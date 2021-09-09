
struct FlightLogEntry {
  int y; 
  int yc; 
  int r; 
  int rc; 
  int p;
  int pc;
} ;


void flightLogUpdate(long time, float roll, float pitch, float yawSpeed, int throttle, int rollComp, int pitchComp, int yawComp);
int flightLogGetEntryCount();
const FlightLogEntry &flightLogGetEntry(int index);