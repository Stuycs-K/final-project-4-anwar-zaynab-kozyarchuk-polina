class Coordinate{
  private int xcor;
  private int ycor;
  
  Coordinate(){
    xcor = 0;
    ycor = 0;
  }
  
  Coordinate(int x, int y){
    xcor = x;
    ycor = y;
  }
  
  void setX(int x){
    if (x >= 0 && x <= width){
      xcor = x;
    } else {
      throw new IndexOutOfBoundsException(x + " is out of bound (0, " + width + ")");
    }
  }
  
  void setY(int y){
    if (y >= 0 && y <= height){
      ycor = y;
    } else {
      throw new IndexOutOfBoundsException(y + " is out of bound (0, " + height + ")");
    }
  }
  
  void set(int x, int y){
    setX(x);
    setY(y);
  }
  
  int getX(){
    return xcor; 
  }
  
  int getY(){
    return ycor; 
  }
}
