class Character{
  PVector position;
  PVector velocity;
  PVector acceleration;
  String type;
  int h;
  int w;
  
  Character(int x, int y, String str){
    //bottom right coordinate
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
    h = height/20;
    w = h / 2;
  }
  
  boolean isFire(){
    return type.equals("f");
  }
  
  boolean isWater(){
    return type.equals("w");
  }
  
  void setPosition(int x, int y){
    position = new PVector(x,y,0);
  }
  
  //using the rightmost edge of the character
  color belowPixel(){
    return get((int) position.x + w, (int)position.y + h);
  }
  
  boolean reachedGoal(){
    return false;
  }
  
  void display(){
    color c;
    if (isFire()){
       c = color(204,81,83);
    } else {
       c = color(104, 226, 242);
    }
    fill(c);
    rect(position.x, position.y, w, h);
  }
}
