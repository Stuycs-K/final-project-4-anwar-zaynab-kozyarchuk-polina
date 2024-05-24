public class Block{
  Coordinate location; 
  String type; 
  int w; 
  int h; 
  color c; 
  
  public Block(String type, int x, int y){
    this.type = type;
    location = new Coordinate(x, y);
    w = width/10; 
    h = height/20;
    c = color(4, 120, 41); 
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
  
  public Coordinate getLocation(){
    return location;   
  }
  
  public void display(){
    int x = location.getX(); 
    int y = location.getY(); 
    fill(c); 
    rect(x, y, w, h); 
  }

}
