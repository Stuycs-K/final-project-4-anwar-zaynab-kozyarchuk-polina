import java.util.*;
import java.lang.IndexOutOfBoundsException;
boolean right;

void setup(){
  size(400, 400); 
  Map m = new Map(); 
  m.setupMap(); 
}

void keyPressed(){
  right = true;
}

void keyReleased(){
  right = false; 
}
void draw(){
  
}
