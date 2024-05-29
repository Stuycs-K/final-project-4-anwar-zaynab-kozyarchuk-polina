class Lever extends Switch{
  Lever(){
    super();
    c=uLEVER;
  }
  
  Lever(boolean in){
    super(in);
    if (in){
      c = tLEVER;
    } else {
      c = uLEVER;
    }
  }
  
  void toggle(){
    c = tLEVER
  }
}
