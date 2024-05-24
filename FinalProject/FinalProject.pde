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
   delay(1000);
   m.fireboy.setPosition(width-15, (int)fireboy.position.y);
   m.watergirl.setPosition(width-20, (int)fireboy.position.y);
     
}
