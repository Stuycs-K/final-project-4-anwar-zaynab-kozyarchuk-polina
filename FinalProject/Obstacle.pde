public class Obstacle{
  PVector position; 
  String type; 
  int w; 
  int h; 
  color c; 
  
  public Obstacle(String type, int x, int y){
    this(type, x, y, 35, 15);
   
  }
  
  public Obstacle(String type, int x, int y, int w, int h){
    position = new PVector(x, y); 
    this.type = type; 
    this.w = w; 
    this.h = h; 
    if (isLava()){
      c = LAVA; 
    }
    if (isWater()){
      c = WATER; 
    }
    if (isGoo()){
      c = GOO;
    }
    if (isGround()){
      c = GROUND; 
    }
  }

  public boolean isLava(){
    return type.equals("lava"); 
  }
  
  public boolean isGoo(){
    return type.equals("goo"); 
  }
  
  public boolean isWater(){
    return type.equals("water"); 
  }
  
  public boolean isGround(){
    return type.equals("ground"); 
  }
  
  public PVector getLocation(){
    return position;   
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
  
  public void display(){
    float x =  position.x; 
    float y =  position.y; 
    fill(c);
    rect(x, y, w, h); 
  }
}
