import java.util.*;
import java.lang.IndexOutOfBoundsException;
boolean right;
final color FIREDOOR = color(130,61,75);
final color WATERDOOR = color(50, 200, 200);
Map m;

void setup(){
  size(400, 400); 
  m = new Map(); 
  m.setupMap(); 
}

void keyPressed(){
  right = true;
}

void keyReleased(){
  right = false; 
}
void draw(){
  //TEMPORARY

}
