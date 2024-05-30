abstract class Switch{
  PVector position;
  color c;
  boolean toggled;
  int h;
  int w;
  Platform platform;
  
  Switch(){
    this(0,0,false);
  }
  Switch(float x, float y){
    this(x,y,false);
  }
  Switch(boolean isToggled){
    this(0,0,isToggled);
  }
  Switch(float x, float y, boolean isToggled){
    position = new PVector(x,y,0);
    toggled = isToggled;
    platform = new Platform();
  }
  
  void display(){
    fill(c);
    rect(position.x, position.y, w, h);
  }
  
  abstract void toggle(String type);
  
  boolean inProximity(color col, int range){
    PImage square = get((int)position.x-range, (int)position.y-range, w+(2*range), h+(2*range));
    for (int r = 0; r < square.width; r++){
      for (int c = 0; c < square.height; c++){
        if (square.get(r,c) == col){
          return true;
        }
      }
    }
    return false;
  }  
  boolean isToggled(){return toggled;}
}
