
class Snake{  
    
  //snake variables
   int x;
   int y;
   int sWidth;
   int sHeight;
   int slitherSpeed;
   int jumpSpeed; 
   
   //hitbox variables
   float topBound; 
   float bottomBound;
   float leftBound; 
   float rightBound;
   int jumpHeight;
   int peakY;
 
 //declaring movement booleans
   boolean isMovingRight;
   boolean isMovingLeft;
   boolean isJumping;
   boolean isFalling;
   
   boolean isDead;
  
 //constructor function
 Snake(){
  x = 110; 
  y = 850; 
  slitherSpeed = 8;
  jumpSpeed = 10;
  peakY = y-180;
  sHeight = 108; 
  sWidth = 85;
  
 //initializing movement variables
  isJumping = false; 
  isFalling = false;
  isMovingRight = false; 
  isMovingLeft = false;
  
  isDead = false;
  
 //making water snake animate
  waterSnake = new Animation(waterSnakeImages, 0.18, 3.5);
    for (int i=0; i < waterSnakeImages.length; i++){
   waterSnakeImages[i] = loadImage("waterSnake"+i+".png");
}
   waterSnake.isAnimating = true;

}

void render(){
waterSnake.display(x,y);
//rect(x,y,sWidth,sHeight);
}


void move() {
  topBound = y;
  bottomBound = y + sHeight;
  leftBound = x;
  rightBound = x + sWidth;
  
  
  if (isMovingRight == true && rightBound < width){
   x = x + slitherSpeed;  
  }
  if (isMovingLeft == true && leftBound > 0){
   x = x - slitherSpeed;
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
   bottomBound = y + sHeight;

  if (bottomBound >= height){
    isFalling = false;
  }
}

void resetBoundaries (){
  if(isJumping == true || isFalling == true  || isMovingLeft == true || isMovingRight == true ){
     topBound = y;
     bottomBound = y + sHeight;
     leftBound = x;
     rightBound = x + sWidth;   
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



  
