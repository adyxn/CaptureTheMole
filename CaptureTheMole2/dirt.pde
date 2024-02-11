//Done by collegue M
class Dirt1 {
  float x;
  float y;
  float w = 90;
  float h = 100;
  int clickedTime = 0;

  Dirt1(float xVal) {
    x = xVal;
    y = height - 40; //positions then on y axis M
  }

  void reset(float yVal) {
    y = yVal;
  }

  void display() {
    if (menu == 1) { // only display in case 1 M
      fill(139, 69, 19);
      rect(x, y, w, h);
    }
  }
  void remove() {
  this.w = 0; // set the width to 0 to make the rectangle disappear M
  this.h = 0; // set the height to 0 to make the rectangle disappear M
}
}
