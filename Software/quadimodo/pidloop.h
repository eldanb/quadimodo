#include <algorithm>

class PidControlLoop {

public:
  PidControlLoop():
    lastError(0), lastTimestamp(0), errorIntegral(0)
  {
   
  }
  
  float getOutput() {
    return currentOutput;
  }

  void providePlantReading(float error, unsigned long atTimestamp) {
    errorDerivative = (float)(error - lastError) / (atTimestamp - lastTimestamp);
    errorIntegral += error;
    lastError = error;
    lastTimestamp = atTimestamp;

    float newOutput = std::max(std::min(coeffP * lastError + coeffD * errorDerivative + coeffI * errorIntegral, (float)600.0), (float)-600.0);
    currentOutput = newOutput;  
  }
    
  void setCoefficients(float _coeffP, float _coeffI, float _coeffD) {
    coeffP = _coeffP;
    coeffI = _coeffI;
    coeffD = _coeffD;     
  }

  float getCoefficientP() {
    return coeffP;    
  }

  float getCoefficientI() {
    return coeffI;    
  }

  float getCoefficientD() {
    return coeffD;    
  }

  float getLastError() {
    return lastError;
  }
  
  float getDerivative() {
    return errorDerivative;
  }

  float getIntegral() {
    return errorIntegral;
  }

  unsigned long getLastTimestamp() {
    return lastTimestamp;
  }
  
  void reset() {
    errorIntegral = 0;  
  }
  
private:
  unsigned long lastTimestamp;
  float lastError;

  float errorDerivative;
  float errorIntegral;
  
  float coeffP;
  float coeffI;  
  float coeffD;

  float currentOutput;
};
