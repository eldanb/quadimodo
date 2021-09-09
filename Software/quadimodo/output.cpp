#include <Arduino.h>

void blinkPattern(const char *patt)  {
  while(*patt) {
    int onP, offP;

    switch(*(patt++)) {
        case 'S':
            onP = 125;
            offP = 125;
            break;

        case 'M':
            onP = 500;
            offP = 500;
            break;

        case 'L':
            onP = 1000;
            offP = 500;
            break;
    }

    digitalWrite(BUILTIN_LED, LOW);
    delay(onP);
    digitalWrite(BUILTIN_LED, HIGH);
    delay(offP);
  }
}