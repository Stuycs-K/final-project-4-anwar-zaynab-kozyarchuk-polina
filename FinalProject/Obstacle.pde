public class Obstacle{
  PVector position; 
  String type; 
  int w; 
  int h; 
  color c; 
  
  public Obstacle(String type, int x, int y){
    this.type = type;
    position = new PVector(x, y,0);
    w = width/10; 
    h = height/20;
    if (isLava()){
      c = LAVA;
    } else if (isGoo()){
      c = GOO;
    } else {
      c = WATER;
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
  
  public PVector getLocation(){
    return position;   
  }
  
  public void display(){
    int x = position.x(); 
    int y = position.y(); 
    fill(c); 
    rect(x, y, w, h); 
  }

}
