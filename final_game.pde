
//declaring a variable to store the sounds
SoundFile snakeSound;
SoundFile backgroundMusic;
SoundFile lizardSound;

//declaring snake player
Snake waterSnake1;

//delcaing lizard player
Lizard fireLizard1;

//declaring fire puddle
Puddle firePuddle;

//declaring water puddles
waterPuddle waterPuddle;

int state = 0;

Levels Level1;
Levels Level2;
Levels Level3;

//declaring an array list for the snake
ArrayList<Snake> snakeList;

//making my water snake animation
Animation waterSnake;

//making my fire lizard animate
Animation fireLizard;

//make an array of snake images
PImage[] waterSnakeImages = new PImage [3];

//make an array of snake images
PImage[] fireLizardImages = new PImage [2];

//importing sound
import processing.sound.*;

//delaring photo variables
PImage winningPhoto;
PImage startScreen;
PImage level;
PImage gameOver;

PFont titleFont;


void setup () {
  size (1500, 950);

  snakeSound = new SoundFile(this, "snakeSound.mp3");
  snakeSound.amp(1.0);

  backgroundMusic = new SoundFile(this, "backgroundMusic.mp3");
  backgroundMusic.amp(0.7);

  lizardSound = new SoundFile(this, "burning.wav");
  lizardSound.amp(0.8);


  //calling all the classes
  waterSnake1 = new Snake();
  firePuddle = new Puddle();
  fireLizard1 = new Lizard();

  //initalizing level one
  Level1 = new Levels();
  Level2 = new Levels();
  Level3 = new Levels();


  Level1.platformList.add(new Platform(600, 70));
  Level1.platformList.add(new Platform(10, 500));
  Level1.platformList.add(new Platform(70, 375));
  Level1.platformList.add(new Platform(1300, 300));
  Level1.platformList.add(new Platform(1000, 800));
  Level1.platformList.add(new Platform(80, 190));
  Level1.platformList.add(new Platform(400, 450));
  Level1.platformList.add(new Platform(450, 750));
  Level1.platformList.add(new Platform(700, 875));
  Level1.platformList.add(new Platform(800, 200));
  Level1.platformList.add(new Platform(500, 350));
  Level1.platformList.add(new Platform(1200, 550));
  Level1.platformList.add(new Platform(130, 840));
  Level1.platformList.add(new Platform(1150, 150));
  Level1.platformList.add(new Platform(900, 350));
  Level1.platformList.add(new Platform(950, 680));
  Level1.platformList.add(new Platform(1250, 450));
  Level1.platformList.add(new Platform(350, 275));
  Level1.platformList.add(new Platform(150, 70));
  Level1.platformList.add(new Platform(150, 600));
  Level1.platformList.add(new Platform(750, 500));
  Level1.platformList.add(new Platform(700, 600));


  Level2.platformList.add(new Platform(600, 850));
  Level2.platformList.add(new Platform(150, 850));
  Level2.platformList.add(new Platform(850, 800));
  Level2.platformList.add(new Platform(300, 750));
  Level2.platformList.add(new Platform(400, 650));
  Level2.platformList.add(new Platform(50, 550));
  Level2.platformList.add(new Platform(1350, 550));
  Level2.platformList.add(new Platform(900, 600));
  Level2.platformList.add(new Platform(600, 350));
  Level2.platformList.add(new Platform(350, 450));
  Level2.platformList.add(new Platform(750, 450));
  Level2.platformList.add(new Platform(1100, 450));
  Level2.platformList.add(new Platform(1000, 700));
  Level2.platformList.add(new Platform(100, 100));
  Level2.platformList.add(new Platform(650, 200));
  Level2.platformList.add(new Platform(900, 275));
  Level2.platformList.add(new Platform(1150, 150));
  Level2.platformList.add(new Platform(975, 75));

  Level3.platformList.add(new Platform(80, 750));
  Level3.platformList.add(new Platform(300, 750));
  Level3.platformList.add(new Platform(400, 650));
  Level3.platformList.add(new Platform(50, 550));
  Level3.platformList.add(new Platform(1350, 550));
  Level3.platformList.add(new Platform(900, 600));
  Level3.platformList.add(new Platform(600, 350));
  Level3.platformList.add(new Platform(350, 450));
  Level3.platformList.add(new Platform(750, 450));
  Level3.platformList.add(new Platform(1100, 450));
  Level3.platformList.add(new Platform(1000, 700));
  Level3.platformList.add(new Platform(100, 100));
  Level3.platformList.add(new Platform(650, 200));
  Level3.platformList.add(new Platform(900, 275));
  Level3.platformList.add(new Platform(1150, 150));
  Level3.platformList.add(new Platform(975, 55));
  Level3.platformList.add(new Platform(500, 600));
  Level3.platformList.add(new Platform(150, 250));
  Level3.platformList.add(new Platform(400, 225));
  Level3.platformList.add(new Platform(600, 880));
  Level3.platformList.add(new Platform(250, 870));
  Level3.platformList.add(new Platform(850, 800));
  Level3.platformList.add(new Platform(800, 100));
  Level3.platformList.add(new Platform(550, 75));
  Level3.platformList.add(new Platform(1300, 775));


  for (int i=0; i<4; i++) {
    Level1.puddleList.add(new Puddle());
  }

  for (int i=0; i<4; i++) {
    Level1.wPuddleList.add(new waterPuddle());
  }

  for (int i=0; i<6; i++) {
    Level2.puddleList.add(new Puddle());
  }

  for (int i=0; i<6; i++) {
    Level2.wPuddleList.add(new waterPuddle());
  }

  for (int i=0; i<9; i++) {
    Level3.puddleList.add(new Puddle());
  }

  for (int i=0; i<9; i++) {
    Level3.wPuddleList.add(new waterPuddle());
  }

  //initialzing photos
  winningPhoto = loadImage("winning screen.jpg");
  level = loadImage("level background.jpg");
  startScreen = loadImage("start screen.jpg");
  gameOver = loadImage("game over.png");


  startScreen.resize(1500, 950);
  level.resize(1500, 950);
  winningPhoto.resize(1500, 950);
}

void draw () {
  background(200);


  //playing the background music
  if (!backgroundMusic.isPlaying()) {
    backgroundMusic.play();
  }

  //if one player gets to the top of level 1 it will go to level 2
  println(waterSnake1.isFalling);
  if (state == 1) {
    if (fireLizard1.y <= 0 || waterSnake1.y <= 0) {
      state = 2;
      waterSnake1.x = 110;
      waterSnake1.y = 850;
      fireLizard1.x = 1100;
      fireLizard1.y = 850;
      waterSnake1.resetBoundaries();
      fireLizard1.resetBoundaries();
      waterSnake1.isDead = false;
      fireLizard1.isDead = false;
    }
  }

  //if one player gets to the top of level 2 it will go to level 3
  if (state == 2) {
    if (fireLizard1.y <= 0 || waterSnake1.y <= 0) {
      state = 3;
      waterSnake1.x = 110;
      waterSnake1.y = 850;
      fireLizard1.x = 1100;
      fireLizard1.y = 850;
      waterSnake1.resetBoundaries();
      fireLizard1.resetBoundaries();
      waterSnake1.isDead = false;
      fireLizard1.isDead = false;
    }
  }

  //if one player gets to the top of level 3 the winning screen wil pop up
  if (state == 3 && state != 2 && state != 1) {
    if (fireLizard1.y <= 0 || waterSnake1.y <= 0) {
      state = 5;
    }
  }

  //if both players die the game over screen will present
  if (fireLizard1.isDead == true && waterSnake1.isDead == true) {
    state = 4;
  }

  //my finite state machine
  switch(state) {
    
    //start screen
  case 0:
    image(startScreen, 0, 0);

    textSize(75);
    fill(245, 25, 25);
    text("FIRELIZARD", width/2-550, height/4+75);
    fill(0);
    text("AND", width/2 - 65, height/4+75);
    fill(94, 158, 245);
    text("WATERSNAKE", width/2+150, height/4+75);

    textSize(37);
    fill(0);
    text("1. use the 'awd' keys to move the water snake", width/4 - 75, height/2-50);
    text("2. use the arrow keys to move the fire lizard", width/4 - 75, height/2 + 10);
    text("*watch out for the puddles! you can only go through", width/4 - 75, height/2 + 70);
    text("the ones that are the same color as your character", width/4 - 75, height/2 + 130);


    textSize(40);
    fill(232, 196, 52);
    text("press 'r' to start the game", width/2-200, height/2 + 300);
    break;

  case 1:

    image(level, 0, 0);

    if (waterSnake1.isDead == false) {
      waterSnake1.render();
    }
    if (fireLizard1.isDead == false) {
      fireLizard1.render();
    }

    waterSnake1.move();
    waterSnake1.jump();
    waterSnake1.fall();
    waterSnake1.reachedTopOfJump();
    waterSnake1.land();
    waterSnake1.fallOffPlatform(Level1.platformList);
    waterSnake1.resetBoundaries();

    fireLizard1.move();
    fireLizard1.jump();
    fireLizard1.fall();
    fireLizard1.reachedTopOfJump();
    fireLizard1.land();
    fireLizard1.fallOffPlatform(Level1.platformList);
    fireLizard1.resetBoundaries();

    Level1.render();

    for (Platform aPlatform : Level1.platformList) {
      aPlatform.landedOn(waterSnake1);
      aPlatform.landOn(fireLizard1);
    }

    //making the fire puddles appear
    for (Puddle aPuddle : Level1.puddleList) {
      aPuddle.puddleCollision(waterSnake1);
      aPuddle.resetBoundaries();
    }

    //making the water puddles appear
    for (waterPuddle aPuddle : Level1.wPuddleList) {
      aPuddle.puddleCollision(fireLizard1);
      aPuddle.resetBoundaries();
    }

    break;

  case 2 :

    image(level, 0, 0);

    if (waterSnake1.isDead == false) {
      waterSnake1.render();
    }
    if (fireLizard1.isDead == false) {
      fireLizard1.render();
    }

    waterSnake1.move();
    waterSnake1.jump();
    waterSnake1.fall();
    waterSnake1.reachedTopOfJump();
    waterSnake1.land();
    waterSnake1.fallOffPlatform(Level2.platformList);
    waterSnake1.resetBoundaries();

    //fireLizard1.render();
    fireLizard1.move();
    fireLizard1.jump();
    fireLizard1.fall();
    fireLizard1.reachedTopOfJump();
    fireLizard1.land();
    fireLizard1.fallOffPlatform(Level2.platformList);
    fireLizard1.resetBoundaries();

    Level2.render();

    for (Platform aPlatform : Level2.platformList) {
      aPlatform.landedOn(waterSnake1);
      aPlatform.landOn(fireLizard1);
    }

    //making the fire puddles appear
    for (Puddle aPuddle : Level2.puddleList) {
      aPuddle.puddleCollision(waterSnake1);
      aPuddle.resetBoundaries();
    }

    //making the water puddles appear
    for (waterPuddle aPuddle : Level2.wPuddleList) {
      aPuddle.puddleCollision(fireLizard1);
      aPuddle.resetBoundaries();
    }

    break;

  case 3:
    image(level, 0, 0);
    if (waterSnake1.isDead == false) {
      waterSnake1.render();
    }
    if (fireLizard1.isDead == false) {
      fireLizard1.render();
    }

    waterSnake1.move();
    waterSnake1.jump();
    waterSnake1.fall();
    waterSnake1.reachedTopOfJump();
    waterSnake1.land();
    waterSnake1.fallOffPlatform(Level3.platformList);
    waterSnake1.resetBoundaries();

    fireLizard1.render();
    fireLizard1.move();
    fireLizard1.jump();
    fireLizard1.fall();
    fireLizard1.reachedTopOfJump();
    fireLizard1.land();
    fireLizard1.fallOffPlatform(Level3.platformList);
    fireLizard1.resetBoundaries();

    Level3.render();

    for (Platform aPlatform : Level3.platformList) {
      aPlatform.landedOn(waterSnake1);
      aPlatform.landOn(fireLizard1);
    }

    //making the fire puddles appear
    for (Puddle aPuddle : Level3.puddleList) {
      aPuddle.puddleCollision(waterSnake1);
      aPuddle.resetBoundaries();
    }

    //making the water puddles appear
    for (waterPuddle aPuddle : Level3.wPuddleList) {
      aPuddle.puddleCollision(fireLizard1);
      aPuddle.resetBoundaries();
    }

    break;

  case 4:
    gameOver.resize(1500, 950);
    image(gameOver, 0, 0);
    textSize(70);
    fill(250, 170, 15);
    text("press spacebar to restart the game", width/2-450, height/4);
    break;

  case 5:
    image(winningPhoto, 0, 0);
    textSize(100);
    fill(255);
    text("YOU WIN", width/2-200, height/4);
    textSize(70);
    fill(250, 170, 15);
    text("press spacebar to restart game", width/2-450, height/4+700);
    break;
  }
}


void keyPressed () {
  if (key == 'a') {
    waterSnake1.isMovingLeft = true;
  }
  if (key == 'd') {
    waterSnake1.isMovingRight = true;
  }
  if (key =='w' && waterSnake1.isJumping == false && waterSnake1.isFalling == false) {
    waterSnake1.isJumping = true;
    snakeSound.play();
    waterSnake1.peakY = waterSnake1.y-180;
  }
  if (key == CODED) {
    if (keyCode == LEFT) {
      fireLizard1.isMovingLeft = true;
    }
  }
  if (key == CODED) {
    if (keyCode == RIGHT) {
      fireLizard1.isMovingRight = true;
    }
  }
  if (key == CODED) {
    if (keyCode == UP) {
      lizardSound.play();
      fireLizard1.isJumping = true;
      fireLizard1.peakY = fireLizard1.y-180;
    }
  }

  if (key == 'r') {
    setup ();
    state = 1;
  }

  if (key == ' ') {
    setup();
    state = 1;
  }
}

void keyReleased () {
  if (key == 'a') {
    waterSnake1.isMovingLeft = false;
  }
  if (key == 'd') {
    waterSnake1.isMovingRight = false;
  }
  if (key == 'w') {
    waterSnake1.isJumping = false;
  }
  if (key == CODED) {
    if (keyCode == LEFT) {
      fireLizard1.isMovingLeft = false;
    }
  }
  if (key == CODED) {
    if (keyCode == RIGHT) {
      fireLizard1.isMovingRight = false;
    }
  }
  if (key == CODED) {
    if (keyCode == UP) {
      fireLizard1.isJumping = false;
    }
  }
}
