//Done by collegue M
class Timer {
  float Time;

  Timer(float set) {  //Constructor M
    Time = set;
  }

  float getTime() { // returns current time M
    return Time;
  }

  void setTime(float set) { //set timer to what you put it as, ex 10,5,2 secs, M
    Time = set;
  }

  void countUp() { //sets timer to count up  M
    Time += 1 / frameRate;
  }

  void countDown() { //sets timer to count down, cant call countup and down at the same time. M
    Time -= 1 / frameRate;
  }
  
  void resetTime(float set) { //sets timer to reset when called
    Time = set;
  }
}
