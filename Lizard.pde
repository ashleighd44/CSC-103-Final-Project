
class Lizard {
  
   //lizard variables
   int x;
   int y;
   int lizWidth;
   int lizHeight;
   int runSpeed;
   int jumpSpeed; 
   
   //hitbox variables
   int topBound; 
   int bottomBound;
   int leftBound; 
   int rightBound;
   int jumpHeight;
   int peakY;
 
 //declaring movement booleans
   boolean isMovingRight;
   boolean isMovingLeft;
   boolean isJumping;
   boolean isFalling;
   
   boolean isDead;

  
  Lizard(){
  x = 1100; 
  y = 850; 
  runSpeed = 8;
  jumpSpeed = 10;
  peakY = y-180;
  lizHeight = 130; 
  lizWidth = 110;
  
 //initializing movement variables
  isJumping = false; 
  isFalling = false;
  isMovingRight = false; 
  isMovingLeft = false;
  
  isDead = false;
  
 //making water snake animate
  fireLizard = new Animation(fireLizardImages, 0.12, 1.8);
    for (int i=0; i < fireLizardImages.length; i++){
   fireLizardImages[i] = loadImage("fire lizard"+i+".png");
}
   fireLizard.isAnimating = true;

}


void render(){
fireLizard.display(x,y);
//fill(245, 25, 25);
//rect(x,y,lizWidth,lizHeight);
}
  
void move() {
  topBound = y;
  bottomBound = y + lizHeight;
  leftBound = x;
  rightBound = x + lizWidth;
  
  
  if (isMovingRight == true && rightBound < width){
   x = x + runSpeed;  
  }
  if (isMovingLeft == true && leftBound > 0){
   x = x - runSpeed;
  }
}

void jump(){
  if (isJumping == true && isFalling == false) {
    y = y - jumpSpeed;
  }
}

void reachedTopOfJump (){
  if (y <= peakY && isJumping == true) {
    isFalling = true; 
    isJumping = false;
  }
}

void fall(){
  if (isFalling == true && isJumping == false){
        y = y + jumpSpeed;
  }
}

void land (){
    bottomBound = y + lizHeight;

  if (bottomBound >= height){
    isFalling = false;
  }
}

void resetBoundaries (){
  if(isJumping == true || isFalling == true  || isMovingLeft == true || isMovingRight == true ){
     topBound = y;
     bottomBound = y + lizHeight;
     leftBound = x;
     rightBound = x + lizWidth;   
  }
}

void fallOffPlatform(ArrayList<Platform> somePlatforms){
    if(bottomBound < height && isJumping == false){
    isFalling = true;
    for(Platform aPlatform : somePlatforms){
      if (leftBound > aPlatform.rightBound) {
        if (rightBound < aPlatform.leftBound) {
          if (topBound < aPlatform.bottomBound) {
            if (bottomBound > aPlatform.topBound) {
              isFalling = false;
        }
       }
      }
     }
    }
   }
  }
 }



  
