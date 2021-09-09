#include "flightlog.h"

#define MAX_LOG_ENTRIES 1000

FlightLogEntry flightLog[MAX_LOG_ENTRIES];
int logCursor = 0;

void flightLogUpdate(long time, float roll, float pitch, float yawSpeed, int throttle, int rollComp, int pitchComp, int yawComp) {
  flightLog[logCursor].r = roll*1000;
  flightLog[logCursor].p = pitch*1000;
  flightLog[logCursor].y = yawSpeed*1000;
  flightLog[logCursor].rc = rollComp;
  flightLog[logCursor].pc = pitchComp;
  flightLog[logCursor].yc = yawComp;

  logCursor++;
  if(logCursor >= MAX_LOG_ENTRIES) {
    logCursor = 0;
  }
}

int flightLogGetEntryCount() {
    return MAX_LOG_ENTRIES;
}

const FlightLogEntry &flightLogGetEntry(int index) {
    return flightLog[(index + logCursor) % MAX_LOG_ENTRIES];
}