abstract class Switch{
<<<<<<< HEAD
  PVector position;
=======
>>>>>>> 9d47571375353adbbb2470783d3da98c47337e06
  color c;
  boolean toggled;
  Platform platform;
  
  Switch(){
    this(0,0,false);
  }
  Switch(int x, int y){
    this(x,y,false);
  }
  Switch(boolean isToggled){
    this(0,0,isToggled);
  }
  Switch(int x, int y, boolean isToggled){
    position = new PVector(x,y,0);
    toggled = isToggled;
    platform = new Platform();
  }
  
  abstract void toggle();
  boolean isToggled(){return toggled;}
}
