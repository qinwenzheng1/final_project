public class Player{
  
  PVector position;
  int bombNum = 1;
  int bombPower = 1;
  int speed = 20;
  int lives = 1;
  
  public Player(PVector pos, int s){
     position = pos;
  }
  
  public void move(PVector direction){
    position.add(direction);
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
  
  public void placeBomb(){
    bomb = new Bomb(position, bombPower); 
  }
  
}
