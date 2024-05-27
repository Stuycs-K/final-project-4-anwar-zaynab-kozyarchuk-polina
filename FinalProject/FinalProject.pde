import java.util.*;
import java.lang.IndexOutOfBoundsException;
boolean right;
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
  println(right); 
  if(right){
    m.fireboy.speedUp(); 
  }else{
    m.fireboy.slowDown(); 
  }
  m.fireboy.move(); 
  m.display(); 
}
