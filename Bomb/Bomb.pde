public class Bomb{
  PVector position = new PVector ( 0 , 0) //stub because it should be exist under the player
  int time = 5; // bombing time wait
  int size = 2 // defaut 2
  
  void explode(){
    if (time == 0) {
         
    }
  }
  
  void updateTime(){
      time--; //modify in main class using Thread.sleep(5000);
  }
  
}
