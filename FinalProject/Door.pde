class Door{
  PVector position;
  //position is the top left
  String type;
  
  Door(int x, int y, String _type){
    position = new PVector(x,y,0);
    type = _type;
  }
  
  boolean isFire(){
    return type.equals("f") || type.equals("fire") || type.equals("fireboy");
  }
  
  boolean isWater(){
    return !(isFire());
  }
}
