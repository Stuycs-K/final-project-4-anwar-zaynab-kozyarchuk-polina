class Character{
  PVector position;
  PVector velocity;
  PVector acceleration;
  String type;
  int h;
  int w;
  float groundY;
  boolean jumping; 
  
  Character(int x, int y, String str){
    //top left coordinate
    position = new PVector(x,y,0);
    velocity = new PVector(0,0,0);
    acceleration = new PVector(0,0,0);
    if (str.equals("f") || str.equals("fire") || str.equals("fireboy")){
      type = "f";
    } else if (str.equals("w") || str.equals("water") || str.equals("watergirl")){
      type = "w";
    } else {
      throw new IllegalArgumentException("illegal argument");
    }
    h = height/20;
    w = h / 2;
    groundY = y;
  }
  
  boolean isFire(){
    return type.equals("f");
  }
  
  boolean isWater(){
    return type.equals("w");
  }
  
  void setPosition(int x, int y){
    position = new PVector(x,y,0);
    groundY = position.y; 
  }
  
  //using the rightmost edge of the character
  color belowPixel(){
    return get((int) position.x + w, (int)position.y + h);
  }
  
  boolean reachedGoal(){
    return false;
  }
  
  void display(){
    color c;
    if (isFire()){
       c = color(204,81,83);
    } else {
       c = color(104, 226, 242);
    }
    fill(c);
    rect(position.x, position.y, w, h);
  }
  
  void move(){
    velocity.add(acceleration); 
    position.add(velocity); 
    
    if (position.y > groundY){
      jumping = false; 
      acceleration.set(acceleration.x, 0); 
      velocity.set(velocity.x, 0); 
      position.set(position.x, groundY); 
    }
    
  }
  
  void slowDown(String direction){ 
    if (direction.equals("right")){
      if (velocity.x <= 0){
        velocity.set(0, velocity.y); 
        acceleration.set(0, acceleration.y); 
      }else{
        acceleration.sub(0.05, 0);
      }
    }
    else if (direction.equals("left")){
      if (velocity.x >= 0){
        velocity.set(0, velocity.y); 
        acceleration.set(0, acceleration.y); 
      }else{
        acceleration.add(0.05, 0); 
      }
    }
  }
  
  void speedUp(String direction){
    if (direction.equals("right")){
      if (velocity.mag() < 1){
        acceleration.add(0.05, 0); 
      }else{
        acceleration.set(0, acceleration.y); 
      }
    }
    else if (direction.equals("left")){
      if (velocity.mag() < 1){
        acceleration.sub(0.05, 0); 
      }else{
        acceleration.set(0, acceleration.y); 
      }
    }
  }
  
  
  void jump(){
    acceleration.add(0, 0.5); 
    velocity.add(0, -7); 
  }
  
  boolean isJumping(){
    return jumping; 
  }
  
  void setJumping(boolean j){
    jumping = j; 
  }
    
}
