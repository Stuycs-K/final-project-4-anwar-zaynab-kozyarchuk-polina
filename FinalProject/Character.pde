class Character{
  PVector position;
  PVector velocity;
  PVector acceleration;
  String type;
  int h;
  int w;
  public float groundY;
  boolean jumping; 
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
    h = 20;
    w = 10;
    groundY = y;    
    atDoor = false;
    isDead = false;
  
  }
  
  boolean isFire(){
    return type.equals("f");
  }
  
  boolean isWater(){
    return type.equals("w");
  }
  
  void setPosition(float x, float y){
    position = new PVector(x,y,0);
    groundY = y; 
  }
  
  float getX(){
    return position.x;
  }
  
  float getY(){
    return position.y;
  }
  
  
  //using the rightmost edge of the character
  color belowPixelRight(){
    return get((int)bottomRight().x, (int)bottomRight().y + 1);
  }
  
  color belowPixelLeft(){
    return get((int)bottomLeft().x, (int)bottomLeft().y + 1); 
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
    return new PVector(position.x+w+1, position.y+h-2,0);
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
      if (inProximity(WATER,1)){
        isDead = true;
        setPosition(-10,-10);
      }
    }
    else {
      if (inProximity(LAVA,1)){
        isDead = true;
        setPosition(-10,-10);
      }
    }
  }
  
  void display(){
    if ((!isDead) && (!atDoor)){
      color c;
      if (isFire()){
         c = FIREBOY;
      } else {
         c = WATERGIRL;
      }
      fill(c);
      rect(position.x, position.y, w, h);
      //image(wImg, position.x, position.y, w, h); 
    } 
        
  }
  
  
  
  //kinda like the same as collide but for obstacles instead of platforms
  void interact(Obstacle o){
    if (velocity.x > 0){
      if (Math.abs(bottomRight().x - o.bottomLeft().x) < 2 &&
          (bottomRight().y <= o.bottomLeft().y && topRight().y >= o.topLeft().y)){
        acceleration.set(0, acceleration.y); 
        velocity.set(0, velocity.y); 
        position.set(o.topLeft().x - w, position.y);  
      }
    }
    
    if (velocity.x < 0){
      if (Math.abs(bottomLeft().x - o.bottomRight().x) < 2 && 
          (bottomLeft().y <= o.bottomRight().y && topLeft().y >= o.topRight().y)){
        acceleration.set(0, acceleration.y); 
        velocity.set(0, velocity.y); 
        position.set(o.bottomRight().x + 1, position.y); 
      }
    }
    
    if (velocity.y > 0){
      if ((bottomRight().y > o.topRight().y && bottomRight().y < o.bottomRight().y) &&
          (bottomRight().x < o.bottomRight().x && bottomRight().x > o.bottomLeft().x)){
          jumping = false; 
          acceleration.set(acceleration.x, 0); 
          velocity.set(velocity.x, 0); 
          groundY = o.topLeft().y - h; 
          position.set(position.x, groundY);  
      }
    }
    
    if (velocity.y < 0){
      if (topRight().y < o.bottomRight().y && topRight().y > o.topRight().y &&
          (topLeft().x >= o.bottomLeft().x && topRight().x <= o.bottomRight().x)){
            jumping = false; 
            position.set(position.x, o.bottomLeft().y - 1); 
          }
    }
    
    // fixing the bug where you can get stuck into the ground
    if (topLeft().x >= o.topLeft().x && 
        topRight().x <= o.topRight().x && 
        topLeft().y >= o.topLeft().y && 
        bottomLeft().y <= o.bottomLeft().y){
          position.set(position.x, o.topLeft().y - h); 
          
    }
  }
  
  
  void move(){  
    
    if (belowPixelRight() == BACKGROUND && belowPixelLeft() == BACKGROUND && !jumping){
      acceleration.add(0, 0.05);
      groundY = position.y; 
    }
    
    
    velocity.add(acceleration); 
    position.add(velocity); 
    
    if (position.x < 0 && velocity.x < 0){
      position.set(0, groundY);
    }
    if (topRight().x > width && velocity.x > 0){
      position.set(width - w - 5, groundY); 
    }
    if (position.y > height && velocity.y > 0){
      position.set(position.x, groundY); 
    }
  }
  
  void slowDown(String direction){ 
    PVector bottomRight = bottomRight();
    if (direction.equals("right") && (get((int) bottomRight.x, (int) bottomRight.y) != PLATFORM)) {
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
        PVector bottomRight = bottomRight();
        boolean ableToMove = get((int) bottomRight.x, (int)bottomRight.y) != PLATFORM;
        //println("color:" + get((int) bottomRight.x, (int)bottomRight.y));
        //println("ableToMove: " + ableToMove);
        if (ableToMove){
          if (velocity.mag() < 1.5){
            acceleration.add(0.05, 0 ); 
          }else{
            acceleration.set(0, acceleration.y); 
          }
        } else {
          velocity = new PVector(0,0,0);
        }
      }
 
    else if (direction.equals("left")){
      if (velocity.mag() < 1.5){
        acceleration.sub(0.05, 0); 
      }else{
        acceleration.set(0, acceleration.y); 
      }

    } 
  }

  
  void stop(){
    velocity.set(0, 0); 
    acceleration.set(0, 0); 
    jumping = false; 
  }
  
  void jump(){
    acceleration.add(0, 0.5); 
    velocity.add(0, -8); 
  }
  
  boolean isJumping(){
    return jumping; 
  }
  
  void setJumping(boolean j){
    jumping = j; 
  }
    
}
