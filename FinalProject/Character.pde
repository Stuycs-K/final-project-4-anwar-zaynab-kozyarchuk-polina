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
  color belowPixel(){
    PVector bottomRight = bottomRight();
    return get((int) bottomRight.x, (int)bottomRight.y + 3);
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
    if (inProximity(GOO,2)){
      isDead = true;
      setPosition(-10,-10);
    }
    if (isFire()){
      if (inProximity(WATER,2)){
        isDead = true;
        setPosition(-10,-10);
      }
    }
    else {
      if (inProximity(LAVA,2)){
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
    } 
        
  }
  
  
  void collide(Platform p){
    if (velocity.x > 0){
      if (Math.abs(bottomRight().x - p.bottomLeft().x) < 3 &&
          (bottomRight().y <= p.bottomLeft().y && topRight().y >= p.topLeft().y)){
        stop();
        position.set(p.topLeft().x - w - 1, groundY);  
      }
    }
    
    if (velocity.x < 0){
      if (PVector.dist(bottomLeft(), p.bottomRight()) < 2){
        stop();
        position.set(p.topRight().x + 1, groundY); 
      }
    }
  }
  
  //kinda like the same as collide but for obstacles instead of platforms
  void interact(Obstacle o){
    if (velocity.x > 0){
      if (PVector.dist(bottomRight(), o.bottomLeft()) < 2){
        stop(); 
        position.set(o.bottomLeft().x - w - 1, o.bottomLeft().y - h); 
      }
    }
    
    if (velocity.x < 0){
      if (PVector.dist(bottomLeft(), o.bottomRight()) < 2){
        stop();
        position.set(o.bottomRight().x + 1, o.bottomRight().y - h); 
      }
    }
    
    if ((Math.abs(bottomLeft().y - o.topRight().y) < 2)){
      if (bottomRight().x <= o.bottomRight().x && bottomRight().x >= o.bottomLeft().x){
        groundY = o.topLeft().y - 1 - h; 
        position.set(position.x, groundY);  
      }
    }
    
    if (velocity.y < 0){
      if (Math.abs(topRight().y - o.bottomRight().y) < w &&
          (topLeft().x >= o.bottomLeft().x && topRight().x <= o.bottomRight().x)){
            position.set(position.x, o.bottomLeft().y - 1); 
          }
    }
  }
  
  
  void move(){  
    if (position.y > groundY && belowPixel() == GROUND){
      jumping = false; 
      acceleration.set(acceleration.x, 0); 
      velocity.set(velocity.x, 0); 
      position.set(position.x, groundY);
    }
    
    if (belowPixel() == BACKGROUND && !jumping){
      acceleration.add(0, 0.05); 
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
        if (velocity.mag() < 1.5){
          acceleration.add(0.05, 0 ); 
        }else{
          acceleration.set(0, acceleration.y); 
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
