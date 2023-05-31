public int[][] map = { {0,0,1,1,0,1,1,1,1,0,0,0},
  {0,1,0,1,1,1,0,2,1,0,1,0},
  {1,1,1,2,1,0,0,2,1,0,1,0},
  {1,0,0,2,0,2,0,2,2,1,2,1},
  {1,1,1,2,2,2,1,1,1,1,1,0},
  {0,1,1,0,2,1,0,0,2,2,0,1},
  {0,1,1,0,0,1,1,1,2,1,0,0},
  {0,1,0,1,2,2,1,1,1,1,1,0},
  {2,1,1,1,2,1,0,0,0,1,1,2},
  {0,1,0,0,1,0,2,2,1,1,1,0},
  {0,0,1,1,1,1,0,0,1,1,1,0},
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
int lives1 = 1;
int lives2 = 1;


public void setup(){
  size(960, 960);

}
  
public void draw(){
  grid();
  drawPlayer();
}


  // 0 is empty space
  // 1 is breakable wall
  // 2 is wall 
void grid(){
  background(200);
  stroke(100);
  for (int i = 0; i < map.length; i++) {
    for (int j = 0; j < map[0].length; j++) {
      if (map [i][j] == 0) fill(255,255,255);
      if (map [i][j] == 1) fill(#E7DBBB);
      if (map [i][j] == 2) fill(#133337);
      
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
  p1x = (int)(player1.x / 80);
  p1y = (int)(player1.y / 80);
  p2x = (int)(player2.x / 80);
  p2y = (int)(player2.y / 80);
  
  if (key == 'w' && player1.y >= speed1) {
    if (p1y > 0){
      if (map[p1x][p1y - 1] == 0){
        dir = new PVector(0, -speed1);
        player1.add(dir);
      }
    }
    if (p1y == 0){
      if (map[p1x][p1y] == 0){
        dir = new PVector(0, -speed1);
        player1.add(dir);
      }
    }
  }
  if (key == 's' && player1.y <= 880 - speed1) {
    if (p1y < 11){
      if (map[p1x][p1y + 1] == 0){
        dir = new PVector(0, speed1);
        player1.add(dir);
      }
    }
    if (p1y == 11){
      if (map[p1x][p1y] == 0){
        dir = new PVector(0, speed1);
        player1.add(dir);
      }
    }
  }
  if (key == 'a' && player1.x >= speed1) { 
    if (p1x > 0){
      if (map[p1x - 1][p1y] == 0){
        dir = new PVector(-speed1, 0);
        player1.add(dir);
      }
    }
    if (p1x == 0){
      if (map[p1x][p1y] == 0){
        dir = new PVector(-speed1, 0);
        player1.add(dir);
      }
    }
  }
  if (key == 'd' && player1.x <= 880 - speed1) {
    if (p1x < 11){
      if (map[p1x + 1][p1y] == 0){
        dir = new PVector(speed1, 0);
        player1.add(dir);
      }
    }
    if (p1x == 11){
      if (map[p1x][p1y] == 0){
        dir = new PVector(speed1, 0);
        player1.add(dir);
      }
    }
  }
  
  if (keyCode == UP && player2.y >= speed2){
    if (p2y > 0){
      if (map[p2x][p2y - 1] == 0){
        dir1 = new PVector(0, -speed2);
        player2.add(dir1);
      }
    }
    if (p2y == 0){
      if (map[p2x][p2y] == 0){
        dir1 = new PVector(0, -speed2);
        player2.add(dir1);
      }
    }
  }
  if (keyCode == DOWN && player2.y >= 880 - speed2){
    if (p2y < 11){
      if (map[p2x][p2y + 1] == 0){
        dir1 = new PVector(0, speed2);
        player2.add(dir1);
      }
    }
    if (p2y == 11){
      if (map[p2x][p2y] == 0){
        dir1 = new PVector(0, speed2);
        player2.add(dir1);
      }
    }
  }
  if (keyCode == LEFT && player2.x >= speed2){ 
    if (p2x > 0){
      if (map[p2x - 1][p2y] == 0){
        dir1 = new PVector(-speed2, 0);
        player2.add(dir1);
      }
    }
    if (p2x == 0){
      if (map[p2x][p2y] == 0){
        dir1 = new PVector(-speed2, 0);
        player2.add(dir1);
      }
    }
  }
  if (keyCode == RIGHT && player2.x >= 880 - speed2){
    if (p2x < 11){
      if (map[p2x + 1][p2y] == 0){
        dir1 = new PVector(speed2, 0);
        player2.add(dir1);
      }
    }
    if (p2x == 11){
      if (map[p2x][p2y] == 0){
        dir1 = new PVector(speed2, 0);
        player2.add(dir1);
      }
    }
  }
  
  // create a bomb
  if (key == 'e' && p1BombNum > bombTracker1) {
    bombTracker1++;
    map[p1x][p1y] = 7; // for bomb
    fill(#C43432);
    square(80*p1x, 80*p1y, 80);
    new Bomb(bombPower1, p1x, p1y);
    
    
  }
  
}


  //public void upBombNum(){
  //  bombNum++;
  //}
  
  //public void upBombPower(){
  //  bombPower++;
  //}
  
  //public void upSpeed(){
  //  speed -= 2;
  //}
  
  //public void upLives(){
  //  lives++;
  //}
