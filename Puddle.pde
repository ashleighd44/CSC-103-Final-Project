
class Puddle {
  
  //puddle variables
  int x; 
  int y; 
  int puddleWidth; 
  int puddleHeight;
  color c1; 
  
  //hitbox variables
  int topBound;
  int bottomBound;
  int rightBound; 
  int leftBound; 
  
  
  //constructor function
  Puddle (){
    x = int(random(0, 1300));
    y = int(random(20, 900));
    puddleWidth = 100; 
    puddleHeight = 25; 
    
  //initializing hitbox variables
  topBound = y-puddleHeight/2;
  bottomBound = y + puddleHeight/2;
  leftBound = x - puddleWidth/2;
  rightBound = x + puddleWidth/2;
  
 }
 
  
  void render(){
    fill(245, 25, 25);
    ellipse(x, y, puddleWidth, puddleHeight);
    
  }
  
  void resetBoundaries (){
  topBound = y-puddleHeight/2;
  bottomBound = y + puddleHeight/2;
  leftBound = x - puddleWidth/2;
  rightBound = x + puddleWidth/2;
   }
   
   void puddleCollision(Snake aSnake){
      if (aSnake.leftBound < rightBound) {
        if (aSnake.rightBound > leftBound) {
          if (aSnake.topBound < bottomBound) {
            if (aSnake.bottomBound > topBound) {
               aSnake.isDead = true;
            }
          }
        }
      }
    
}
  
  
  
}
