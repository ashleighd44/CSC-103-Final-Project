class waterPuddle {
  
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
  waterPuddle (){
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
    fill(78, 150, 245);
    ellipse(x, y, puddleWidth, puddleHeight);
    
  }
  
  void resetBoundaries (){
  topBound = y-puddleHeight/2;
  bottomBound = y + puddleHeight/2;
  leftBound = x - puddleWidth/2;
  rightBound = x + puddleWidth/2;
   }


   void puddleCollision(Lizard aLizard){
      if (aLizard.leftBound < rightBound) {
        if (aLizard.rightBound > leftBound) {
          if (aLizard.topBound < bottomBound) {
            if (aLizard.bottomBound > topBound) {
               aLizard.isDead = true;
             //  println("HAH U SUCK");
            }
          }
        }
      }
    }
   
}
