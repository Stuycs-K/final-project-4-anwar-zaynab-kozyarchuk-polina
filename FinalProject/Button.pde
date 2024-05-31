class Button extends Switch{
  Button(Platform plat){
    super(plat);
    c = uBUTTON;
    w = height/30;
    h = w / 2;    
  }
  Button(boolean isToggled, Platform plat){
    super(isToggled,plat);
    if (isToggled){
      c = tBUTTON;
    } else { c = uBUTTON; }
    w = height/30;
    h = w / 2;    
  }
  Button(float x, float y, Platform plat){
    super(x,y,plat);
    c = uBUTTON;
    w = height/30;
    h = w / 2;    
  }
  Button(float x, float y, boolean isToggled, Platform plat){
    super(x,y,isToggled,plat);
    if (isToggled){
      c = tBUTTON;
    } else { c = uBUTTON; }
    w = height/30;
    h = w / 2;
  }  
  
  void toggle(String type){
    if (type.equals("f")){
      if(inProximity(FIREBOY,1)){
        toggled = true;
        c = tBUTTON;
        platform.adjustState();
      }
    } else {
      if(inProximity(WATERGIRL,1)){
        toggled = true;
        c = tBUTTON;
        platform.adjustState();        
      }
    } 
    unToggle(type);
   }
   
   void unToggle(String type){
    if (type.equals("f")){
      if(!inProximity(FIREBOY,1)){
        toggled = false;
        c = uBUTTON;
        platform.adjustState();
      }
    } else {
      if(!inProximity(WATERGIRL,1)){
        toggled = false;
        c = uBUTTON;
        platform.adjustState();        
      }
    } 
   }
}
