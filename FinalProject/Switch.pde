abstract class Switch{
  color 
  boolean toggled;
  
  Switch(){
    toggled = false;
  }
  Switch(boolean in){
    toggled = in;
  }
  
  abstract void toggle();
  boolean isToggled(){return toggled;}
}
