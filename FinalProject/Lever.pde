class Lever extends Switch{
  Lever(Platform plat){
    super(plat);
    c = uLEVER;
    h = 13;
    w = 6;    
  }
  Lever(boolean isToggled, Platform plat){
    super(isToggled,plat);
    if (isToggled){
      c = tLEVER;
    } else { c = uLEVER; }
    h = 13;
    w = 6;    
  }
  Lever(float x, float y, Platform plat){
    super(x,y,plat);
    c = uLEVER;
    h = 13;
    w = 6;    
  }
  Lever(float x, float y, boolean isToggled, Platform plat){
    super(x,y,isToggled,plat);
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
