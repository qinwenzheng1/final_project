public int[][] map = new int[12][12];
PVector dir;
PVector dir1;
PVector player1 = new PVector(0, 0);
PVector player2 = new PVector(880, 880);

int p1BombNum = 1;
int p2BombNum = 1;
int bombPower1 = 1;
int bombPower2 = 1;
int speed1 = 10;
int speed2 = 10;
int lives1 = 1;
int lives2 = 1;



  // 0 is empty space
  // 1 is breakable wall
  // 2 is wall
  // 3 is bomb bigger powerup
  // 4 is more bomb powerup
  // 5 is more lives powerup
  // 6 is shoes powerup

  
public void setup(){
  size(960, 960);

}
  
public void draw(){
  grid();
  drawPlayer();
  drawMap();
  // update snake if frameCount is a multiple of spd which is 20 at the beginning
  if(frameCount % speed == 0) {
    drawPlayer();
  if (frameCount % speed1 == 0) {
    updatePlayer1();
  }
  if (frameCount % speed2 == 0) {
    updatePlayer2();
  }
  
}

void grid(){
  background(200);
  stroke(100);
  fill(255,255,255);
  for (int i = 0; i < map.length; i++) {
    for (int j = 0; j < map[0].length; j++) {
      square(80*j, 80*i, 80);
    }
  }
}


void drawPlayer(){
  fill(0);
  square(player1.x , player1.y , 80);
  square(player2.x , player2.y , 80);
}

void updatePlayer1(){
  

}

void updatePlayer2(){
  
}

void drawMap(){
  
}

//Add boundaries if position + 80 has color

oid keyPressed(){
  if (key == 'w' && player1.y >= 80) {
    dir = new PVector(0, -80);
    player1.add(dir);
  }
  if (key == 's' && player1.y <= 800) {
    dir = new PVector(0, 80);
    player1.add(dir);
  }
  if (key == 'a' && player1.x >= 80) { 
    dir = new PVector(-80, 0);
    player1.add(dir);
  }
  if (key == 'd' && player1.x <= 800) {
    dir = new PVector(80, 0);
    player1.add(dir);
  }
  
  if (keyCode == UP && player2.y >= 80){
    dir1 = new PVector(0, -80);
    player2.add(dir1);
  }
  if (keyCode == DOWN && player2.y >= 800){
    dir1 = new PVector(0, 80);
    player2.add(dir1);
  }
  if (keyCode == LEFT && player2.x >= 80){ 
    dir1 = new PVector(-80, 0);
    player2.add(dir1);
  }
  if (keyCode == RIGHT && player2.x >= 800){
    dir1 = new PVector(80, 0);
    player2.add(dir1);
  }
}


  public void upBombNum(){
    bombNum++;
  }
  
  public void upBombPower(){
    bombPower++;
  }
  
  public void upSpeed(){
    speed -= 2;
  }
  
  public void upLives(){
    lives++;
  }
