#include <Wire.h>

/*********************************** MPU-6050 Gyro/Acc **********************************/
const uint8_t MPU_addr = 0x68; // I2C address of the MPU-6050
int16_t AcX, AcY, AcZ, Tmp, GyX, GyY, GyZ;
int16_t compAcX, compAcY, compAcZ, compGyX, compGyY, compGyZ;
int16_t lastMicros = 0, lastDt = 0;

float roll, yawSpeed, pitch;

#define M_PI 3.14159265359
#define FS_GYRO 250 

void imuInit() {
  // D3 is GND for MPU
  pinMode(D3, OUTPUT);
  
  Wire.begin();
  Wire.setClock(3400000);

  Wire.beginTransmission(MPU_addr);
  Wire.write(0x6B);  // PWR_MGMT_1 register
  Wire.write(0);     // set to zero (wakes up the MPU-6050)
  Wire.endTransmission(true);
  
  Wire.beginTransmission(MPU_addr);
  Wire.write(0x1A);  // DLPF
  Wire.write(2);     
  Wire.endTransmission(true);
}

void imuSample() {
  long lmic= micros(); 

  Wire.beginTransmission(MPU_addr);
  Wire.write(0x3B);  // starting with register 0x3B (ACCEL_XOUT_H)
  Wire.endTransmission(false);
  Wire.requestFrom(MPU_addr, (size_t)14, true);  // request a total of 14 registers

  byte res[14];
  Wire.readBytes(res, 14);
  
  AcX = res[0] << 8 | res[1]; // 0x3B (ACCEL_XOUT_H) & 0x3C (ACCEL_XOUT_L)
  AcY = res[2] << 8 | res[3]; // 0x3D (ACCEL_YOUT_H) & 0x3E (ACCEL_YOUT_L)
  AcZ = res[4] << 8 | res[5]; // 0x3F (ACCEL_ZOUT_H) & 0x40 (ACCEL_ZOUT_L)
  Tmp = res[6] << 8 | res[7]; // 0x41 (TEMP_OUT_H) & 0x42 (TEMP_OUT_L)
  GyX = res[8] << 8 | res[9]; // 0x43 (GYRO_XOUT_H) & 0x44 (GYRO_XOUT_L)
  GyY = res[10] << 8 | res[11]; // 0x45 (GYRO_YOUT_H) & 0x46 (GYRO_YOUT_L)
  GyZ = res[12] << 8 | res[13]; // 0x47 (GYRO_ZOUT_H) & 0x48 (GYRO_ZOUT_L)
  Tmp = Tmp / 340.00 + 36.53;

  lastDt = lmic - lastMicros;
  lastMicros = lmic;
}

void imuCalibrate() {
  long totAcX = 0, totAcY = 0, totAcZ = 0, totGyX = 0, totGyY = 0, totGyZ = 0;
  const int numSamples = 1000;

  for (int i = 0; i < numSamples; i++) {
    imuSample();
    totAcX += AcX;
    totAcY += AcY;
    totAcZ += AcZ;
    totGyX += GyX;
    totGyY += GyY;
    totGyZ += GyZ;
    delay(1);
  }

  compAcX = totAcX / numSamples;
  compAcY = totAcY / numSamples;
  compAcZ = totAcZ / numSamples;
  compGyX = totGyX / numSamples;
  compGyY = totGyY / numSamples;
  compGyZ = totGyZ / numSamples;

  roll = 0; yawSpeed = 0; pitch = 0;
}

void imuUpdate() {
  imuSample();

  yawSpeed =(float) (yawSpeed + (float)(GyZ - compGyZ) * (float)FS_GYRO / 32768.0) / 2.0;
  pitch += (float) (-(GyY - compGyY)*((float)lastDt / 1000000)) * FS_GYRO / 32768;
  roll  += (float) ((GyX - compGyX)*((float)lastDt / 1000000)) * FS_GYRO / 32768;

  pitch = pitch * 0.9998 + 0.0002 * atan2f((float)(AcX - compAcX), (float)(AcZ)) * 180 / M_PI;
  roll = roll * 0.9998 + 0.0002 * atan2f((float)(AcY - compAcY), (float)(AcZ)) * 180 / M_PI;
}


void imuGetReadings(float &groll, float &gpitch, float &gyawSpeed) {
    groll = roll;
    gpitch = pitch;
    gyawSpeed = yawSpeed;
}


void imuGetRawData(int &temp, int &ax, int &ay, int &az, int &gx, int &gy, int &gz) {
    temp = Tmp * 10;
    ax = AcX;
    ay = AcY;
    az = AcZ;
    gx = GyX;
    gy = GyY;
    gz = GyZ;   
}
