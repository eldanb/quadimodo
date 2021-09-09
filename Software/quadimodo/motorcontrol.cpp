#include <c_types.h>
#include <Arduino.h>

/*********************************** PWM **********************************/
int motorSpeed[4] = { 0, 0, 0, 0}; // In 1/1000s
int timerCycle = 0;

void ICACHE_RAM_ATTR pwmInterrupt() {
  timerCycle++;
  if (timerCycle == 1000) {
    timerCycle = 0;
    digitalWrite(D5, motorSpeed[0] > 0);
    digitalWrite(D6, motorSpeed[1] > 0);
    digitalWrite(D7, motorSpeed[2] > 0);
    digitalWrite(D8, motorSpeed[3] > 0);
  } else {
  if (timerCycle == motorSpeed[0]) {
      digitalWrite(D5, 0);
    }
    if (timerCycle == motorSpeed[1]) {
      digitalWrite(D6, 0);
    }
    if (timerCycle == motorSpeed[2]) {
      digitalWrite(D7, 0);
    }
    if (timerCycle == motorSpeed[3]) {
      digitalWrite(D8, 0);
    }
  }
}


void motorInit() {
  motorSpeed[0] = 0;
  motorSpeed[1] = 0;
  motorSpeed[2] = 0;
  motorSpeed[3] = 0;

  pinMode(D7, OUTPUT);
  pinMode(D8, OUTPUT);
  pinMode(D5, OUTPUT);
  pinMode(D6, OUTPUT);

  timer1_attachInterrupt(pwmInterrupt);
  timer1_enable(TIM_DIV16, TIM_EDGE, TIM_LOOP);
  timer1_write(50);  // (10 usec; 1000 of these is 10ms)
}

void motorDisable() {
  timer1_disable();
  digitalWrite(D7, 0);
  digitalWrite(D8, 0);
  digitalWrite(D5, 0);
  digitalWrite(D6, 0);
}

void motorSetSpeeds(int m1, int m2, int m3, int m4) {
    motorSpeed[0] = m1;
    motorSpeed[1] = m2;
    motorSpeed[2] = m3;
    motorSpeed[3] = m4;
}

void motorGetSpeeds(int &m1, int &m2, int &m3, int &m4) {
    m1 = motorSpeed[0];
    m2 = motorSpeed[1];
    m3 = motorSpeed[2];
    m4 = motorSpeed[3];
}
