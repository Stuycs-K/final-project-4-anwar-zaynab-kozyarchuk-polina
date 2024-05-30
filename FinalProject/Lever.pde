class Lever extends Switch{
  Lever(){
    super();
    c = uLEVER;
    h = height/30;
    w = h / 2;    
  }
  Lever(boolean isToggled){
    super(isToggled);
    if (isToggled){
      c = tLEVER;
    } else { c = uLEVER; }
    h = height/30;
    w = h / 2;    
  }
  Lever(float x, float y){
    super(x,y);
    c = uLEVER;
    h = height/30;
    w = h / 2;    
  }
  Lever(float x, float y, boolean isToggled){
    super(x,y,isToggled);
    if (isToggled){
      c = tLEVER;
    } else { c = uLEVER; }
    h = height/30;
    w = h / 2;
  }
  
  void toggle(String type){
    boolean execute;
    if (type.equals("f")){
      execute = inProximity(FIREBOY,1);
    } else {
      execute = inProximity(WATERGIRL,1);
    }
    
    if (execute){
      toggled = !toggled;
      if (toggled){
        c = tLEVER;
      } else {
        c = uLEVER;
      }
      platform.adjustState();
      }      
   }

}
