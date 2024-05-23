class Character{
  PVector position;
  PVector velocity;
  PVector acceleration;
  String type;
  
  Character(String str, int x, int y){
    position = new PVector(x,y,0);
    velocity = new PVector(0,0,0);
    acceleration = new PVector(0,0,0);
    if (str.equals("f") || str.equals("fire") || str.equals("fireboy")){
      type = "f";
    } else {
      type = "w";
    }
  }
  
  boolean isFire(){
    return type.equals("f");
  }
  
  boolean isWater(){
    return type.equals("w");
  }
  
  void move(char k){
   if (isFire()){
     
   }
  }
  
}
