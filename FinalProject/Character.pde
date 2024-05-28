class Character{
  PVector position;
  PVector velocity;
  PVector acceleration;
  String type;
  int h;
  int w;
  boolean atDoor;
  boolean isDead;
  
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
    
    atDoor = false;
    isDead = false;
  }
  
  boolean isFire(){
    return type.equals("f");
  }
  
  boolean isWater(){
    return type.equals("w");
  }
  
  void setPosition(int x, int y){
    position = new PVector(x,y,0);
  }
  
  //using the rightmost edge of the character
  color belowPixel(){
    PVector bottomRight = bottomRight();
    return get((int) bottomRight.x + w, (int)bottomRight.y + h);
  }
  
  PVector topLeft(){
    return position;
  }
  
  PVector topRight(){
    return new PVector(position.x+w, position.y,0);
  }
  
  PVector bottomLeft(){
    return new PVector(position.x, position.y+h, 0);
  }
  
  PVector bottomRight(){
    return new PVector(position.x+w, position.y+h,0);
  }
  
  void reachGoal(){
    if (isFire()){
      if( inProximity(FIREDOOR,2)){
        atDoor = true;
      }
    }
    else {
      if( inProximity(WATERDOOR, 2)){
        atDoor = true;
      }      
    }
  }
  
  boolean inProximity(color col, int range){
    PImage square = get((int)position.x-range, (int)position.y-range, w+(2*range), h+(2*range));
    for (int r = 0; r < square.width; r++){
      for (int c = 0; c < square.height; c++){
        if (square.get(r,c) == col){
          return true;
        }
      }
    }
    return false;
  }
  
  void die(){
    if (inProximity(GOO,1)){
      isDead = true;
      setPosition(-10,-10);
    }
    if (isFire()){
      if (inProximity(LAVA,1)){
        isDead = true;
        setPosition(-10,-10);
      }
    }
    else {
      if (inProximity(WATER,1)){
        isDead = true;
        setPosition(-10,-10);
      }
    }
  }
  
  void display(){
    if ((!isDead) && (!atDoor)){
      color c;
      if (isFire()){
         c = color(204,81,83);
      } else {
         c = color(104, 226, 242);
      }
      fill(c);
      rect(position.x, position.y, w, h);
    } else {
      println(type + " doesn't exist!");
    }
  }
  
  void move(){
<<<<<<< HEAD
    velocity.add(acceleration); 
    position.add(velocity); 

  }
  
  void slowDown(String direction){ 
    if (direction.equals("right")){
      if (velocity.x <= 0){
        velocity.setMag(0); 
        acceleration.setMag(0); 
      }else{
        acceleration.sub(0.05, 0);
      }
    }
    else if (direction.equals("left")){
      if (velocity.x >= 0){
        velocity.setMag(0); 
        acceleration.setMag(0); 
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
        acceleration.setMag(0); 
      }
    }
    else if (direction.equals("left")){
      if (velocity.mag() < 1){
        acceleration.sub(0.05, 0); 
      }else{
        acceleration.setMag(0); 
      }
    }
  }
  
  void jump(){
    float groundY = position.y;
    float maxY  = groundY + height/10; 
    if (velocity.y() < 1){
      acceleration.add(0, 0.05); 
    }
    else if (velocity.y > 1)
    
  }
    
}
