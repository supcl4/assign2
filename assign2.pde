final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_OVER = 2;

PImage Imgx,Imgy,Imgz,Imgu,Imga,Imgb,Imgst1,Imgst2,ed1,ed2;

float speed = 7;
float fighterX,fighterY;//fighter

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

int hp = 40;
int enemyY,treasureX,treasureY;
int enemyX = 0;
int backOneX = 0; // the x location of bg1
int backTwoX = -640; // the x location of bg2

int gameState;


void setup () {
size(640, 480) ;
Imgst1 =loadImage("img/start1.png");
Imgst2 =loadImage("img/start2.png");
Imgx = loadImage("img/fighter.png");
Imgy = loadImage("img/hp.png");
Imgz = loadImage("img/treasure.png");
Imgu = loadImage("img/enemy.png");
Imga = loadImage("img/bg1.png");
Imgb = loadImage("img/bg2.png");
ed1 = loadImage("img/end1.png");
ed2 = loadImage("img/end2.png");
  
fighterX = 580;
fighterY = 240;
treasureX = int(random(580));
treasureY = int(random(430));
enemyY = int(random(30,460));
 
gameState = GAME_START;
  
}


void draw() {

switch (gameState){
 case GAME_START:
 image(Imgst2,0,0);
 if (mouseX>210 && mouseX<430 && mouseY > 380 && mouseY < 425){
        if (mousePressed){
          gameState = GAME_RUN;
        }else{
         image(Imgst1,0,0);
        }
         }
         break;

 case GAME_OVER:
  enemyY = int(random(30,460));
 image(ed2,0,0);
  if(mouseX >= width/3 && mouseX <= 2*width/3 && mouseY >=315 && mouseY <=350) {
  if(mousePressed) {
  gameState = GAME_RUN;
  fighterX = 580;
  fighterY = 240;
  hp = 40;
  enemyX = 0;
  treasureX = int(random(580));
  treasureY = int(random(430));
} else {
   image(ed1,0,0);
        }
}
break;
   
 case GAME_RUN:
  //background
 image(Imga, backOneX, 0);
 image(Imgb, backTwoX, 0);
 backOneX++;backTwoX++;
 if(backOneX>640){backOneX=-640;backOneX++;}
 if(backTwoX>640){backTwoX=-640;backTwoX++;}
 
 //hp
 fill(#FF0000); //red
 rect(16,10,hp,18); //hp
 image(Imgy,10,10); //hp box
 
 //location
 image(Imgx, fighterX, fighterY); //fighter
 image(Imgz, treasureX, treasureY); //treasure
 image(Imgu,enemyX,enemyY); // enemy
 if(enemyX>640){enemyX=0;enemyX=enemyX+3;}
 enemyX=enemyX+3; //spead
 
 //bump
 if ((enemyY+30.5)>=(fighterY+25.5)){
   enemyY-=3;}
 if ((enemyY+30.5)<=(fighterY+25.5)){enemyY+=3;}
 
 if(treasureX+41>=fighterX && treasureX<=fighterX+51 && treasureY+41>=fighterY && treasureY<=fighterY+51){
   treasureX=int(random(580));
   treasureY=int(random(430));
   hp+=20;
 }
   if(hp>=200){
     hp=200;
   }

 
 //location
 image(Imgx, fighterX, fighterY); //fighter
 image(Imgz, treasureX, treasureY); //treasure
 
 image(Imgu,enemyX,enemyY); // enemy
 if(enemyX>640){enemyX=0;enemyX=enemyX+3;}
 enemyX=enemyX+3; //spead
 if(enemyX+61>=fighterX && enemyX<=fighterX+51 && enemyY+61>=fighterY && enemyY<=fighterY+51){
   hp-=40;
   enemyX=0;
   enemyY=int(random(30,460));
   if(hp<=0){
     gameState=GAME_OVER;
   }
 }
 if(hp<=0){
 hp=0;}
break;
}
 
  //speed of Keyboard
   if (upPressed) {
    fighterY -= speed;
  }
  if (downPressed) {
    fighterY += speed;
  }
  if (leftPressed) {
    fighterX -= speed;
  }
  if (rightPressed) {
    fighterX += speed;
  }
  
  //Border
  if (fighterX > 589) {
    fighterX = 589;
  }
  if(fighterX < 0){
    fighterX = 0;
  }
  if (fighterY > 429) {
    fighterY = 429;
  }
  if (fighterY < 0) {
    fighterY = 0;
  }
  
}
void keyPressed(){
if (key == CODED) { 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
 }
  }
   } 
 

void keyReleased(){
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
