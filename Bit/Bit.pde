public int[][] map = new int[12][12];
PVector player1;
PVector player2;
PVector bomb;
int spd = 10;
int p1BombNum = 1;
int p2BombNum = 1;
  
  // 0 is empty space
  // 1 is breakable wall
  // 2 is wall
  // 3 is bomb bigger powerup
  // 4 is more bomb powerup
  // 5 is more lives\
  // 6 is shoes


map = { {2,2,2,2,2,2,2,2,2,2,2,2,},
  {2,0,0,1,1,3,0,2,1,0,5,2},
  {2,0,1,2,4,0,0,2,1,0,1,2},
  {2,0,0,2,0,2,0,2,2,1,2,2},
  {2,1,3,2,2,2,1,1,4,1,4,2},
  {2,1,1,2,2,4,0,0,2,2,0,2}
  {2,3,1,2,0,1,6,1,2,5,0,2}
  {2,0,

public void setup(){
  size(960, 960);

}
  
public void draw(){
  grid();
  drawPlayer();
  drawMap();
  if (frameCount % spd == 0) {
    updatePlayer();
  }
}
  
//public void explode(){
//  if (bomb >= 4) {
          
//  }
//}

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
  
}

void updatePlayer(){
  
}

void drawMap(){
  
}

void keyPressed(){
  if (key == 'w') dir = new PVector(0, -1);
  if (key == 's') dir = new PVector(0, 1);
  if (key == 'a') dir = new PVector(-1, 0);
  if (key == 'd') dir = new PVector(1, 0);
}

if(
