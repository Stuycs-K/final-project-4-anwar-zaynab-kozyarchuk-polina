public class Block{
  Coordinate location; 
  String type; 
  
  public Block(String type, int x, int y){
    this.type = type;
    location = new Coordinate(x, y); 
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

}
