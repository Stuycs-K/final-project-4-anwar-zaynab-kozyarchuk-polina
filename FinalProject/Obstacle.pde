public class Obstacle{
  PVector position; 
  String type; 
  int w; 
  int h; 
  color c; 
  
  public Obstacle(String type, int x, int y){
    this.type = type;
    position = new PVector(x, y,0);
    
    
    if (isLava()){
      w = 35;
      h = 20;
      c = LAVA;
    } else if (isGoo()){
      w = 35;
      h = 20;
      c = GOO;
    } else if (isWater()){
      w = 35;
      h = 20;
      c = WATER;
    }
    else{
      w = width; 
      h = 40; 
      c = GROUND; 
    }
  }
  
  public Obstacle(String type, int x, int y, int w, int h){
    if (type.equals("ground")){
      this.type = type; 
      position = new PVector(x, y);
      c = GROUND; 
      this.w = w; 
      this.h = h; 
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
