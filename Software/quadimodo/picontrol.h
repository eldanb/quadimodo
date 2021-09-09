void controlResetAutoMotorControl();

void controlSetManual(int m1, int m2, int m3, int m4);

void controlSetAuto(int _throttle, float _rollSetpoint, float _pitchSetpoint, float _yawSetpoint);
void controlLoadPidCoefficients(float rollP, float rollI, float rollD,
                         float pitchP, float pitchI, float pitchD,
                         float yawP, float yawI, float yawD);

void controlApplyMotorControl();