import java.util.*;
import java.lang.IndexOutOfBoundsException;
final color FIREDOOR = color(130,61,75);
final color WATERDOOR = color(50, 200, 200);
boolean rightF;
boolean rightW; 
Map m;

void setup(){
  size(400, 400); 
  m = new Map(); 
  m.setupMap(); 
}

void keyPressed(){
  if (keyCode == RIGHT)
    rightF = true;
  if (key == 'd')
    rightW = true; 
}

void keyReleased(){
  if (keyCode == RIGHT)
    rightF = false;
  if (key == 'd')
    rightW = false; 
}
void draw(){

  if(rightF){
    m.fireboy.speedUp(); 
  }else{
    m.fireboy.slowDown(); 
  }
  
  if(rightW){
    m.watergirl.speedUp(); 
  }else{
    m.watergirl.slowDown(); 
  }
  m.moveChars(); 
  m.display(); 
}
