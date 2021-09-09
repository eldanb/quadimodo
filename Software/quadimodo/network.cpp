#include <ESP8266WiFi.h>
#include <WiFiUdp.h>

#include "picontrol.h"
#include "motorcontrol.h"
#include "config.h"
#include "flightlog.h"
#include "imu.h"
#include "output.h"

WiFiUDP netUdp;
IPAddress controlServerAddress(0, 0, 0 ,0);
IPAddress broadcastAddress(192, 168, 1, 255);

void netInit() {
  Serial.println("Trying to connect");

  WiFi.persistent(false);
  WiFi.mode(WIFI_OFF);   // this is a temporary line, to be removed after SDK update to 1.5.4
  WiFi.mode(WIFI_STA);
  WiFi.begin("tazmania3", "califragi");

  bool ledStat = false;
  while (WiFi.status() != WL_CONNECTED)
  {
    delay(125);
    ledStat = !ledStat;
    digitalWrite(BUILTIN_LED, ledStat);
  }

  Serial.println("Local IP ");
  Serial.println(WiFi.localIP().toString());

  netUdp.begin(4567);
}


#define PACKET_TYPE_MANUAL_ENGINE_CONTROL 1
#define PACKET_TYPE_AUTO_ENGINE_CONTROL 2
#define PACKET_TYPE_RECALIBRATE 3
#define PACKET_TYPE_GET_LOG 5

#define PACKET_TYPE_STATUS 101
#define PACKET_TYPE_ADVERTISE 8
#define PACKET_TYPE_LOG_PACKET 103

struct QuadimodoPacketHeader {
  int packetType;
};


struct StatusUdpPacket {
  QuadimodoPacketHeader header;
  
  int Temp;

  int AcX;
  int AcY;
  int AcZ;

  int GyX;
  int GyY;
  int GyZ;

  int motor[4];

  int pitch;
  int yaw;
  int roll;
  
  int loopTime;
} ;

struct QuadAdvertisePacket {
    QuadimodoPacketHeader hdr;

    int version;
    
    uint32_t ipAddress;
    char quadId[16];
} ;

struct ManualEngineControlPacket {
  QuadimodoPacketHeader hdr;
  
  int m1;
  int m2;
  int m3;
  int m4;
};


struct PIDConf {
  int p;
  int i;
  int d;
};

struct AutoEngineControlPacket {
  QuadimodoPacketHeader hdr;
  
  int throttle;
  
  PIDConf rollPid;
  int rollSetpoint;

  PIDConf pitchPid;
  int pitchSetpoint;

  PIDConf yawPid;
  int yawSetpoint;
} ;

struct GetLogPacket {
  QuadimodoPacketHeader hdr;  
};

struct LogInfoPacket  {
    QuadimodoPacketHeader hdr;

    int packetIndex;
    FlightLogEntry packet[16];
} packetBuff;

long lastBroadcastMillis = 0;
bool broadcastEnabled = true;

void processManualEngineControlPacket(struct ManualEngineControlPacket *packet) {
    controlSetManual(packet->m1, packet->m2, packet->m3, packet->m4);
    broadcastEnabled = !(packet->m1 || packet->m2 || packet->m3 || packet->m4);
}

void processAutoEngineControlPacket(struct AutoEngineControlPacket *packet) {
    controlLoadPidCoefficients(
        (float)packet->rollPid.p / 1000, (float)packet->rollPid.i / 1000, (float)packet->rollPid.d,
        (float)packet->pitchPid.p / 1000, (float)packet->pitchPid.i / 1000, (float)packet->pitchPid.d,
        (float)packet->yawPid.p / 1000, (float)packet->yawPid.i / 1000, (float)packet->yawPid.d
        );

    controlSetAuto(
        packet->throttle, 
        (float)packet->rollSetpoint / 1000, (float)packet->pitchSetpoint / 1000, (float)packet->yawSetpoint / 1000);
  
  
  broadcastEnabled = false;
}

void processRecalibratePacket() {
  blinkPattern("M");
  
  digitalWrite(BUILTIN_LED, HIGH);

    controlSetManual(0, 0, 0, 0);

    controlResetAutoMotorControl();

    imuInit();
    imuCalibrate();

  blinkPattern("SS");
  broadcastEnabled = true;
}

void processGetLogPacket(struct GetLogPacket* packet) {
  int entriesSent = 0;
  int packetsSent = 0;
  
  blinkPattern("S");

  LogInfoPacket packetBuff;
  int packetOfs = 0;
  
  int logEntryCount = flightLogGetEntryCount();
  while(entriesSent<logEntryCount) {
    packetBuff.packet[packetOfs++] = flightLogGetEntry(entriesSent);
    entriesSent ++;

    if(entriesSent == logEntryCount || packetOfs == 16) {
      packetBuff.hdr.packetType = PACKET_TYPE_LOG_PACKET;
      packetBuff.packetIndex = packetsSent ++;    

      if (netUdp.beginPacket(controlServerAddress, 4567)) {
        netUdp.write((byte*)&packetBuff, sizeof(packetBuff));
        if (!netUdp.endPacket()) {
          Serial.printf("Cant send packet of size %d\n", sizeof(packetBuff));
        }
      } 

      yield();
      
      packetOfs = 0;
    }      
  }  

  blinkPattern("SS");

}

void netUpdate() {
#ifdef SEND_STATUS_UPDATES
  StatusUdpPacket packet = { { PACKET_TYPE_STATUS } };
  imuGetRawData(packet.Temp, packet.AcX, packet.AcY, packet.AcZ, packet.GyX, packet.GyY, packet.GyZ);
  motorGetSpeeds(packet.motor[0], packet.motor[1], packet.motor[2], packet.motor[3]);

  float fPitch, fYaw, fRoll;
  imuGetReadings(fRoll, fPitch, fYaw);
  packet.pitch = fPitch;
  packet.roll = fRoll;
  packet.yaw = fYaw;
  
  if (netUdp.beginPacket(controlServerAddress, 4567)) {
    netUdp.write((byte*)&packet, sizeof(packet));
    if (!netUdp.endPacket()) {
      Serial.println("Cant send packet");
    }
  } else {
    Serial.println("Cant begin packet");
  }
#endif

  if(broadcastEnabled && millis() - lastBroadcastMillis > 3000) {
      yield();
      QuadAdvertisePacket packet;
      packet.hdr.packetType = PACKET_TYPE_ADVERTISE;
      packet.version = 1;
      strcpy(packet.quadId, QUADCOPTER_NAME);
      packet.ipAddress = (uint32_t)WiFi.localIP();

      Serial.println("Broadcast");
      if (netUdp.beginPacket(broadcastAddress, 4567)) {
        netUdp.write((byte*)&packet, sizeof(packet));
        if (!netUdp.endPacket()) {
        Serial.println("Cant send packet");
        }
      } else {
        Serial.println("Cant begin packet");
      }
      yield();

      lastBroadcastMillis = millis();
  }

  int packetSize = netUdp.parsePacket();
  if (packetSize) {
    controlServerAddress = netUdp.remoteIP();

    char buff[2048];
    netUdp.read(buff, packetSize);

    struct QuadimodoPacketHeader *hdr = (QuadimodoPacketHeader*)buff;
    switch (hdr->packetType) {
      case PACKET_TYPE_MANUAL_ENGINE_CONTROL:
        processManualEngineControlPacket((ManualEngineControlPacket*)buff);
        break;
        
      case PACKET_TYPE_AUTO_ENGINE_CONTROL:
        processAutoEngineControlPacket((AutoEngineControlPacket*)buff);
        break;    

      case PACKET_TYPE_RECALIBRATE:
        processRecalibratePacket();
        break;    

      case PACKET_TYPE_GET_LOG:
        processGetLogPacket((GetLogPacket*)buff);
        break;    
    }
  }
}
