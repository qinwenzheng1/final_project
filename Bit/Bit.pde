public int[][] map = new int[12][12];
  
  // 0 is empty space
  // 1 is breakable wall
  // 2 is wall
  // 3 is bomb bigger powerup
  // 4 is more bomb powerup
  // 5 is more lives\
  // 6 is shoes

  
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
