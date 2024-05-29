class Lever extends Switch{
  Lever(){
    super();
    c = uLEVER;
  }
  
  Lever(boolean in){
    super(in);
    c = tLEVER;
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
