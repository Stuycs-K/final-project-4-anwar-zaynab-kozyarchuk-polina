class Lever extends Switch{
  Lever(){
    super();
    c = uLEVER;
  }
  Lever(boolean isToggled){
    super(isToggled);
    if (isToggled){
      c = tLEVER;
    } else { c = uLEVER; }
  }
  Lever(int x, int y){
    super(x,y);
    c = uLEVER;
  }
  Lever(int x, int y, boolean isToggled){
    super(x,y,isToggled);
    if (isToggled){
      c = tLEVER;
    } else { c = uLEVER; }
  }
  
  void toggle(){
    toggled = !toggled;
    if (toggled){
      c = tLEVER;
    } else {
      c = uLEVER;
    }
  }
}
