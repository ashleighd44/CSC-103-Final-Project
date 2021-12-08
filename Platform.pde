
class Platform {

  int x;
  int y;
  int w;
  int h;
  color c;

  float topBound;
  float bottomBound;
  float leftBound;
  float rightBound;


  Platform (int tempX, int tempY) {
    x = tempX;
    y = tempY;
    w = int(random(100, 250));
    h = 30;
    c = color(23, 118, 52);

    //initializing hitbox variables
    topBound = y;
    bottomBound = y + h;
    leftBound = x;
    rightBound = x + w;
  }


  void render() {
    fill(23, 118, 52);
    rect(x, y, w, h);
  }


  void landedOn (Snake aSnake) {
  
    if (aSnake.isFalling == true) {
      if (leftBound < aSnake.rightBound) {
        if (rightBound > aSnake.leftBound) {
          if (topBound < aSnake.bottomBound) {
            if (bottomBound > aSnake.bottomBound) {
              aSnake.isFalling = false;
              aSnake.y = y-aSnake.sHeight;
            }
          }
        }
      }
    }
  }
  
  void landOn (Lizard aLizard) {
    
     if (aLizard.isFalling == true) {
      if (leftBound < aLizard.rightBound) {
        if (rightBound > aLizard.leftBound) {
          if (topBound < aLizard.bottomBound) {
            if (bottomBound > aLizard.bottomBound) {
              aLizard.isFalling = false;
              aLizard.y = y-aLizard.lizHeight;
            }
          }
        }
      }
    }
    
  }
}
