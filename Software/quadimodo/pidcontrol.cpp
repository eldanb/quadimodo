#include <algorithm>
#include <Arduino.h>

#include "pidloop.h"
#include "motorcontrol.h"
#include "flightlog.h"
#include "imu.h"

PidControlLoop rollPid;
float rollSetpoint = 0;

PidControlLoop pitchPid;
float pitchSetpoint = 0;

PidControlLoop yawPid;
float yawSetpoint = 0;

int throttle;
bool manualControl = true;

void controlSetAuto(int _throttle, float _rollSetpoint, float _pitchSetpoint, float _yawSetpoint) {
    throttle = _throttle;
    yawSetpoint = _yawSetpoint;
    pitchSetpoint = _pitchSetpoint;
    rollSetpoint = _rollSetpoint;
    manualControl = false;
}

void controlSetManual(int m1, int m2, int m3, int m4) {
    manualControl = true;
    motorSetSpeeds(m1, m2, m3, m4);
}

void controlLoadPidCoefficients(float rollP, float rollI, float rollD,
                         float pitchP, float pitchI, float pitchD,
                         float yawP, float yawI, float yawD) {

  rollPid.setCoefficients(rollP, rollI, rollD);
  pitchPid.setCoefficients(pitchP, pitchI, pitchD);
  yawPid.setCoefficients(yawP, yawI,yawD);
}

void controlResetAutoMotorControl() {
    rollPid.reset();
    pitchPid.reset();
    yawPid.reset();
}

void controlApplyMotorControl() {
    if(!manualControl) {
        long timestamp = micros();
        
        float roll, pitch, yawSpeed;
        imuGetReadings(roll, pitch, yawSpeed);

        rollPid.providePlantReading(roll-rollSetpoint, timestamp);
        pitchPid.providePlantReading(pitch-pitchSetpoint, timestamp);
        yawPid.providePlantReading(yawSpeed-yawSetpoint, timestamp);

        int rollComp = rollPid.getOutput();
        int pitchComp = pitchPid.getOutput(); 
        int yawComp = yawPid.getOutput(); 
        
        int maxMotor =  1000;
        int minMotor =  100;

        motorSetSpeeds(
            std::max(minMotor, std::min(throttle - rollComp - pitchComp + yawComp, maxMotor)),
            std::max(minMotor, std::min(throttle + rollComp - pitchComp - yawComp, maxMotor)),
            std::max(minMotor, std::min(throttle - rollComp + pitchComp - yawComp, maxMotor)),
            std::max(minMotor, std::min(throttle + rollComp + pitchComp + yawComp, maxMotor)));

        flightLogUpdate(timestamp, roll, pitch, yawSpeed, throttle, rollComp, pitchComp, yawComp);
    }
}
