class Door{
  PVector position;
  //position is the top left pixel
  String type;
  int h;
  int w;
  
  Door(int x, int y, String _type){
    position = new PVector(x,y,0);
    type = _type;
    h = 20;
    w = 10;    
  }
  
  boolean isFire(){
    return type.equals("f") || type.equals("fire") || type.equals("fireboy");
  }
  
  boolean isWater(){
    return !(isFire());
  }
  
  void display(){
    color c;
    if (isFire()){
       c = FIREDOOR;
    } else {
       c = WATERDOOR;
    }
    fill(c);
    rect(position.x, position.y, w, h);    
  }
}
