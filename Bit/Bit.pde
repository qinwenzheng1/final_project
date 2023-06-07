public int[][] map = { {0,0,1,1,0,1,1,1,1,0,0,0},
  {0,2,1,0,1,1,0,2,1,0,1,0},
  {1,1,1,2,1,0,0,2,1,0,1,0},
  {1,0,0,2,0,2,0,2,2,1,2,1},
  {1,1,1,2,2,2,1,1,1,1,1,0},
  {0,1,1,0,2,1,0,0,2,2,0,1},
  {0,1,1,0,0,1,1,1,2,1,0,0},
  {0,1,0,1,2,2,1,1,1,1,1,0},
  {2,1,1,1,2,1,0,0,0,1,1,2},
  {0,1,0,0,1,0,2,2,1,1,1,1},
  {0,0,1,1,1,1,0,0,1,1,2,0},
  {0,0,2,1,1,0,0,0,1,1,0,0} };
// pre-coded map
  // 0 is empty space
  // 1 is breakable wall
  // 2 is wall
  // 3 is bomb bigger powerup
  // 4 is more bomb powerup
  // 5 is more lives powerup
  // 6 is shoes powerup
  
PVector dir;
PVector dir1;
PVector player1 = new PVector(0, 0); // actual position (in terms of 880)
PVector player2 = new PVector(880, 880); // actual position (in terms of 880)

// for array usage, so those are in terms of arrays
int p1x = 0; 
int p1y = 0;
int p2x = 0;
int p2y = 0;

//Power Ups for both characters
int p1BombNum = 1;
int p2BombNum = 1;
int bombTracker1 = 0;
int bombTracker2 = 0;
int bombPower1 = 1;
int bombPower2 = 1;
int speed1 = 80;
int speed2 = 80;
int lives1 = 3;
int lives2 = 3;
Bomb bomb1;
Bomb bomb2;
boolean bombDown1 = false;
boolean bombDown2 = false;

Bomb bomb3;
Bomb bomb4;
boolean bombDown3 = false;
boolean bombDown4 = false;

Bomb bomb5;
Bomb bomb6;
boolean bombDown5 = false;
boolean bombDown6 = false;

Bomb bomb7;
Bomb bomb8;
boolean bombDown7 = false;
boolean bombDown8 = false;


public void setup(){
  size(1050, 1050);

}
  
public void draw(){
  grid();
  drawPlayer();
  textSize(50);
  text(p1BombNum - bombTracker1+"", 1000, 50);
  textSize(50);
  text(bombPower1+"", 1000, 100);
  textSize(50);
  text(lives1+"", 1000, 150);
  
  textSize(50);
  text(p2BombNum - bombTracker2+"", 1000, 250);
  textSize(50);
  text(bombPower2+"", 1000, 300);
  textSize(50);
  text(lives2+"", 1000, 350);
  
  if(lives2 <= 0) {
    background(255);
    textSize(100);
    text("Player 1 Wins", width/2 - 250, height/2 - 100);
  }
  
  if(lives1 <= 0) {
    background(255);
    textSize(100);
    text("Player 2 Wins", width/2 - 250, height/2 - 100);
  }
    
  
}


  // 0 is empty space
  // 1 is breakable wall
  // 2 is wall 
void grid(){
  background(200);
  stroke(100);
  for (int i = 0; i < map.length; i++) {
    for (int j = 0; j < map[0].length; j++) {
      if (map [j][i] == 0) fill(255,255,255);
      if (map [j][i] == 1) fill(#E7DBBB);
      if (map [j][i] == 2) fill(#133337);
      if (map [j][i] == 3) fill(#069606);
      if (map [j][i] == 4) fill(#35fc35);
      if (map [j][i] == 5) fill(#a83f39);
      //if (map [j][i] == 6) fill(#35fc35);
      if (map [j][i] == 7) fill(#C43432);
      
      square(80*j, 80*i, 80);
    }
  }
}


//create two character in opposite corners of the map
void drawPlayer(){
  fill(0);
  square(player1.x , player1.y , 80);
  square(player2.x , player2.y , 80);
}


//Add boundaries if position + 80 has color

void keyPressed(){
  
  if (key == 'w' && player1.y >= speed1) {
    if (p1y > 0){
      if (!(map[p1x][p1y - 1] == 1) && !(map[p1x][p1y - 1] == 2 && !(map[p1x][p1y - 1] == 7))){
        dir = new PVector(0, -speed1);
        player1.add(dir);
      }
    }
    if (p1y == 0){
      if (!(map[p1x][p1y] == 1) && !(map[p1x][p1y] == 2) && !(map[p1x][p1y] == 7)){
        dir = new PVector(0, -speed1);
        player1.add(dir);
      }
    }
    if(bombDown1)
    bomb1.steps++;
    
    if(bombDown3)
    bomb3.steps++;
    
    if(bombDown5)
    bomb5.steps++;
    
    if(bombDown7)
    bomb7.steps++;
  }
  if (key == 's' && player1.y <= 880 - speed1) {
    if (p1y < 11){
      if (!(map[p1x][p1y + 1] == 1) && !(map[p1x][p1y + 1] == 2) && !(map[p1x][p1y + 1] == 7)){
        dir = new PVector(0, speed1);
        player1.add(dir);
      }
    }
    if (p1y == 11){
      if (!(map[p1x][p1y] == 1) && !(map[p1x][p1y] == 2) && !(map[p1x][p1y] == 7)){
        dir = new PVector(0, speed1);
        player1.add(dir);
      }
    }
    if(bombDown1)
    bomb1.steps++;
    
    if(bombDown3)
    bomb3.steps++;
    
    if(bombDown5)
    bomb5.steps++;
    
    if(bombDown7)
    bomb7.steps++;
  }
  if (key == 'a' && player1.x >= speed1) { 
    if (p1x > 0){
      if (!(map[p1x - 1][p1y] == 1) && !(map[p1x - 1][p1y] == 2 && !(map[p1x - 1][p1y] == 7))){
        dir = new PVector(-speed1, 0);
        player1.add(dir);
      }
    }
    if (p1x == 0){
      if (!(map[p1x][p1y] == 1) && !(map[p1x][p1y] == 2 && !(map[p1x][p1y] == 7))){
        dir = new PVector(-speed1, 0);
        player1.add(dir);
      }
    }
    if(bombDown1)
    bomb1.steps++;
    
    if(bombDown3)
    bomb3.steps++;
    
    if(bombDown5)
    bomb5.steps++;
    
    if(bombDown7)
    bomb7.steps++;
  }
  if (key == 'd' && player1.x <= 880 - speed1) {
    if (p1x < 11){
      if (!(map[p1x + 1][p1y] == 1) && !(map[p1x + 1][p1y] == 2) && !(map[p1x + 1][p1y] == 7)){
        dir = new PVector(speed1, 0);
        player1.add(dir);
      }
    }
    if (p1x == 11){
      if (!(map[p1x][p1y] == 1) && !(map[p1x][p1y] == 2 && !(map[p1x][p1y] == 7))){
        dir = new PVector(speed1, 0);
        player1.add(dir);
      }
    }
    if(bombDown1)
    bomb1.steps++;
    
    if(bombDown3)
    bomb3.steps++;
    
    if(bombDown5)
    bomb5.steps++;
    
    if(bombDown7)
    bomb7.steps++;
  }
  
  if (keyCode == UP && player2.y >= speed2){
    if (p2y > 0){
      if (!(map[p2x][p2y - 1] == 1) && !(map[p2x][p2y - 1] == 2) && !(map[p2x][p2y - 1] == 7)){
        dir1 = new PVector(0, -speed2);
        player2.add(dir1);
      }
    }
    if (p2y == 0){
      if (!(map[p2x][p2y] == 1) && !(map[p2x][p2y] == 2 && !(map[p2x][p2y] == 7))){
        dir1 = new PVector(0, -speed2);
        player2.add(dir1);
      }
    }
    if(bombDown2)
    bomb2.steps++;
    
    if(bombDown4)
    bomb4.steps++;
    
    if(bombDown6)
    bomb6.steps++;
    
    if(bombDown8)
    bomb8.steps++;
  }
  if (keyCode == DOWN && player2.y <= 880 - speed2){
    if (p2y < 11){
      if (!(map[p2x][p2y + 1] == 1) && !(map[p2x][p2y + 1] == 2) && !(map[p2x][p2y + 1] == 7)){
        dir1 = new PVector(0, speed2);
        player2.add(dir1);
      }
    }
    if (p2y == 11){
      if (!(map[p2x][p2y] == 1) && !(map[p2x][p2y] == 2 && !(map[p2x][p2y] == 7))){
        dir1 = new PVector(0, speed2);
        player2.add(dir1);
      }
    }
    if(bombDown2)
    bomb2.steps++;
    
    if(bombDown4)
    bomb4.steps++;
    
    if(bombDown6)
    bomb6.steps++;
    
    if(bombDown8)
    bomb8.steps++;
  }
  if (keyCode == LEFT && player2.x >= speed2){ 
    if (p2x > 0){
      if (!(map[p2x - 1][p2y] == 1) && !(map[p2x - 1][p2y] == 2) && !(map[p2x - 1][p2y] == 7)){
        dir1 = new PVector(-speed2, 0);
        player2.add(dir1);
      }
    }
    if (p2x == 0){
      if (!(map[p2x][p2y] == 1) && !(map[p2x][p2y] == 2) && !(map[p2x][p2y] == 7)){
        dir1 = new PVector(-speed2, 0);
        player2.add(dir1);
      }
    }
    if(bombDown2)
    bomb2.steps++;
    
    if(bombDown4)
    bomb4.steps++;
    
    if(bombDown6)
    bomb6.steps++;
    
    if(bombDown8)
    bomb8.steps++;
  }
  if (keyCode == RIGHT && player2.x <= 880 - speed2){
    if (p2x < 11){
      if (!(map[p2x + 1][p2y] == 1) && !(map[p2x + 1][p2y] == 2) && !(map[p2x + 1][p2y] == 7)){
        dir1 = new PVector(speed2, 0);
        player2.add(dir1);
      }
    }
    if (p2x == 11){
      if (!(map[p2x][p2y] == 1) && !(map[p2x][p2y] == 2) && !(map[p2x][p2y] == 7)){
        dir1 = new PVector(speed2, 0);
        player2.add(dir1);
      }
    }
    if(bombDown2)
    bomb2.steps++;
    
    if(bombDown4)
    bomb4.steps++;
    
    if(bombDown6)
    bomb6.steps++;
    
    if(bombDown8)
    bomb8.steps++;
  }
  
  p1x = (int)(player1.x / 80);
  p1y = (int)(player1.y / 80);
  p2x = (int)(player2.x / 80);
  p2y = (int)(player2.y / 80);
  
  // create a bomb
  if (key == 'e' && p1BombNum > bombTracker1) {
    bombTracker1++;
    map[p1x][p1y] = 7; // for bomb
    if (bombDown5) {
      bomb7 = new Bomb(bombPower1, p1x, p1y);
      bombDown7 = true;
    }
    else if (bombDown3) {
      bomb5 = new Bomb(bombPower1, p1x, p1y);
      bombDown5 = true;
    }
    else if (bombDown1) {
      bomb3 = new Bomb(bombPower1, p1x, p1y);
      bombDown3 = true;
    }
    else {
      bomb1 = new Bomb(bombPower1, p1x, p1y);
      bombDown1 = true;
    }
  }
  
  if (keyCode == CONTROL && p2BombNum > bombTracker2) {
    bombTracker2++;
    map[p2x][p2y] = 7; // for bomb
    if (bombDown6) {
      bomb8 = new Bomb(bombPower1, p1x, p1y);
      bombDown8 = true;
    }
    else if (bombDown4) {
      bomb6 = new Bomb(bombPower1, p1x, p1y);
      bombDown6 = true;
    }
    else if (bombDown2) {
      bomb4 = new Bomb(bombPower1, p1x, p1y);
      bombDown4 = true;
    }
    else {
      bomb2 = new Bomb(bombPower1, p1x, p1y);
      bombDown2 = true;
    }
  }
  
   if (bombDown1 && bomb1.steps == 5){
      bomb1.explode();
      map[bomb1.posx][bomb1.posy] = 0;
      bomb1.steps = 0;
      bombTracker1--;
      bombDown1 = false;
    }
  
   if (bombDown2 && bomb2.steps == 5){
      bomb2.explode();
      map[bomb2.posx][bomb2.posy] = 0;
      bomb2.steps = 0;
      bombTracker2--;
      bombDown2 = false;
    }
    
   if (bombDown3 && bomb3.steps == 5 && p1BombNum >= 2){
      bomb3.explode();
      map[bomb3.posx][bomb3.posy] = 0;
      bomb3.steps = 0;
      bombTracker1--;
      bombDown3 = false;
    }
  
   if (bombDown4 && bomb4.steps == 5 && p2BombNum >= 2){
      bomb4.explode();
      map[bomb4.posx][bomb4.posy] = 0;
      bomb4.steps = 0;
      bombTracker2--;
      bombDown4 = false;
    }
    
   if (bombDown5 && bomb5.steps == 5 && p1BombNum >= 3){
      bomb5.explode();
      map[bomb5.posx][bomb5.posy] = 0;
      bomb5.steps = 0;
      bombTracker1--;
      bombDown5 = false;
    }
  
    if (bombDown6 && bomb6.steps == 5 && p2BombNum >= 3){
      bomb6.explode();
      map[bomb6.posx][bomb6.posy] = 0;
      bomb6.steps = 0;
      bombTracker2--;
      bombDown6 = false;
    }
    
    if (bombDown7 && bomb7.steps == 5 && p1BombNum >= 4){
      bomb7.explode();
      map[bomb7.posx][bomb7.posy] = 0;
      bomb7.steps = 0;
      bombTracker1--;
      bombDown7 = false;
    }
  
  if (bombDown8 && bomb8.steps == 5 && p2BombNum >= 4){
      bomb8.explode();
      map[bomb8.posx][bomb8.posy] = 0;
      bomb8.steps = 0;
      bombTracker2--;
      bombDown8 = false;
    }
  
   if ( map[p1x][p1y] == 3) {
      bombPower1++;
      map[p1x][p1y] = 0;
    }
    if ( map[p2x][p2y] == 3) {
      bombPower2++;
      map[p2x][p2y] = 0;
    }
    if ( map[p1x][p1y] == 4) {
      p1BombNum++;
      map[p1x][p1y] = 0;
    }
    if ( map[p2x][p2y] == 4) {
      p2BombNum++;
      map[p2x][p2y] = 0;
    }
    if ( map[p1x][p1y] == 5) {
      lives1++;
      map[p1x][p1y] = 0;
    }
    if ( map[p2x][p2y] == 5) {
       lives2++;
       map[p2x][p2y] = 0;
    }
    
//    if(key == 'p') {
//      map = { {0,0,1,1,0,1,1,1,1,0,0,0},
//  {0,2,1,0,1,1,0,2,1,0,1,0},
//  {1,1,1,2,1,0,0,2,1,0,1,0},
//  {1,0,0,2,0,2,0,2,2,1,2,1},
//  {1,1,1,2,2,2,1,1,1,1,1,0},
//  {0,1,1,0,2,1,0,0,2,2,0,1},
//  {0,1,1,0,0,1,1,1,2,1,0,0},
//  {0,1,0,1,2,2,1,1,1,1,1,0},
//  {2,1,1,1,2,1,0,0,0,1,1,2},
//  {0,1,0,0,1,0,2,2,1,1,1,1},
//  {0,0,1,1,1,1,0,0,1,1,2,0},
//  {0,0,2,1,1,0,0,0,1,1,0,0} };
  
//  p1BombNum = 1;
//p2BombNum = 1;
//bombTracker1 = 0;
//bombTracker2 = 0;
//bombPower1 = 1;
//bombPower2 = 1;
//speed1 = 80;
//speed2 = 80;
//lives1 = 3;
//lives2 = 3;
//Bomb bomb1;
//Bomb bomb2;
//bombDown1 = false;
//bombDown2 = false;

//dir = 0;
//dir1 = 0;
//player1 = new PVector(0, 0); // actual position (in terms of 880)
//player2 = new PVector(880, 880); // actual position (in terms of 880)
      
//    }
}
