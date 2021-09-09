void imuInit();
void imuUpdate();
void imuCalibrate();
void imuGetReadings(float &groll, float &gpitch, float &gyawSpeed);
void imuGetRawData(int &temp, int &ax, int &ay, int &az, int &gx, int &gy, int &gz);
