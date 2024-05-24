class Door{
  PVector position;
  //position is the top left pixel
  String type;
  int h;
  int w;
  
  Door(int x, int y, String _type){
    position = new PVector(x,y,0);
    type = _type;
    h = height/20;
    w = h / 2;    
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
       c = color(130,61,75);
    } else {
       c = color(50, 200, 200);
    }
    fill(c);
    rect(position.x, position.y, w, h);    
  }
}
