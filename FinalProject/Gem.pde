public class Gem{
  PVector position;
  String type;
  PImage display;
  boolean displayed;
  
  Gem(float x, float y, String _type){
    displayed = true;
    position = new PVector(x, y);
    type = _type;
    if (type.equals("f")){
      display = loadImage("firegem.png");
    } else {
      display = loadImage("watergem.png");
    }
  }
  
  void disappear(){
    if (displayed){
      if (type.equals("f")){
        if (inProximity(FIREBOY,1)){
          displayed = false;
          m.collectedFGems++;
        }
      } else {
        if (inProximity(WATERGIRL,1)){
          displayed = false;
          m.collectedWGems++;
        }
      }
    }
  }
  
  void display(){
    if (displayed){
      image(display, position.x, position.y);
      display.resize(25,25);
    }
  }

  boolean inProximity(color col, int range){
    PImage square = get((int)position.x-range, (int)position.y-range, 25+(2*range), 25+(2*range));
    for (int r = 0; r < square.width; r++){
      for (int c = 0; c < square.height; c++){
        if (square.get(r,c) == col){
          return true;
        }
      }
    }
    return false;
  }
}
