public class Bomb {
  int posx; // posx is an array number
  int posy; // posy is an array number
  int bombPow;

  public Bomb(int bombPow, int posx, int posy) {
    this.posx = posx;
    this.posy = posy;
    this.bombPow = bombPow;
  }

  // 0 is empty space
  // 1 is breakable wall
  // 2 is wall
  // 3 is bomb bigger powerup
  // 4 is more bomb powerup
  // 5 is more lives powerup
  // 6 is shoes powerup
 
  public int randomBlock() {
    int randResult = (int) random(10); // giving a result between 0 to 9
    if (randResult < 5) {
      return 0;
    } else if (randResult == 5 || randResult == 6) {
      return 3;
    } else if (randResult == 7) {
      return 4;
    } else if (randResult == 8) {
      return 5;
    } else if (randResult == 9) {
      return 6;
    } else {
      return 0;
    }
  }

  // we are going to add deduce opponent's number of lives part later
  public void explode() {
    for (int beginposX = posx; beginposX <= posx + bombPow; beginposX++) {
      if (beginposX >= map.length || map[beginposX][posy] == 2) {
        break;
      } else if (map[beginposX][posy] == 1) {
        map[beginposX][posy] = randomBlock();
        break;
      }
    }

    for (int beginposX = posx; beginposX >= posx - bombPow; beginposX--) {
      if (beginposX < 0 || map[beginposX][posy] == 2) {
        break;
      } else if (map[beginposX][posy] == 1) {
        map[beginposX][posy] = randomBlock();
        break;
      }
    }

    for (int beginposY = posy; beginposY <= posy + bombPow; beginposY++) {
      if (beginposY >= map[0].length || map[posx][beginposY] == 2) {
        break;
      } else if (map[posx][beginposY] == 1) {
        map[posx][beginposY] = randomBlock();
        break;
      }
    }

    for (int beginposY = posy; beginposY >= posy - bombPow; beginposY--) {
      if (beginposY < 0 || map[posx][beginposY] == 2) {
        break;
      } else if (map[posx][beginposY] == 1) {
        map[posx][beginposY] = randomBlock();
        break;
      }
    }
  }
}
