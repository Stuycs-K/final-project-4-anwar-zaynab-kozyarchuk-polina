abstract class Switch{
  PVector position;
  color c;
  boolean toggled;
  int h;
  int w;
  Platform platform;
  
  Switch(Platform plat){
    this(0,0,false,plat);
  }
  Switch(float x, float y, Platform plat){
    this(x,y,false, plat);
  }
  Switch(boolean isToggled, Platform plat){
    this(0,0,isToggled,plat);
  }
  Switch(float x, float y, boolean isToggled, Platform plat){
    position = new PVector(x,y,0);
    toggled = isToggled;
    platform = plat;
  }
  
  void display(){
    fill(c);
    rect(position.x, position.y, w, h);
    platform.display();
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
