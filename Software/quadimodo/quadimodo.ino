#include <Wire.h>
#include <ESP8266WiFi.h>
#include <WiFiUdp.h>

#include "pidloop.h"
#include "picontrol.h"
#include "imu.h"
#include "network.h"
#include "motorcontrol.h"
#include "output.h"

void autonomousSetup() {
  controlLoadPidCoefficients(
      17, (float)30/1000, 1700000,
      17, (float)30/1000, 1700000,
      30, 0, 0 
  );
}

void setup() {
  pinMode(BUILTIN_LED, OUTPUT);
  
  blinkPattern("L");

  Serial.begin(115200);

  imuInit();
  imuCalibrate();

  blinkPattern("M");

#ifdef AUTONOMOUS
  autonomousSetup();  
#else
  netInit();
#endif

  motorInit();

  blinkPattern("SS");
}

void noTimerDelay() {
  delay(500);
}


void loop() {  
  imuUpdate();
  controlApplyMotorControl();
  
 #ifndef AUTONOMOUS
  netUpdate();
 #else
  delay(1);
 #endif  
}
