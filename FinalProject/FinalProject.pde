import java.util.*;
import java.lang.IndexOutOfBoundsException;
boolean rightF;
boolean rightW; 
boolean leftF; 
boolean leftW; 
Map m;
int jumpCounter = 0;
 

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
    
  if (keyCode == LEFT)
    leftF = true;
  if (key == 'a')
    leftW = true; 
    
  if (keyCode == UP){
    jumpCounter = 50; 
    m.fireboy.accelerateUp(); 
  }
}

void keyReleased(){
  if (keyCode == RIGHT)
    rightF = false;
  if (key == 'd')
    rightW = false; 
    
  if (keyCode == LEFT)
    leftF = false;
  if (key == 'a')
    leftW = false; 
}
void draw(){
  if(rightF && !leftF){
    m.fireboy.speedUp("right"); 
  }else if (!rightF && !leftF){
    m.fireboy.slowDown("right"); 
  }
  
  if(rightW && !leftW){
    m.watergirl.speedUp("right"); 
  }else if (!rightW && !leftW){
    m.watergirl.slowDown("right"); 
  }
  
  if(leftF && !rightF){
    m.fireboy.speedUp("left"); 
  }else if (!leftF && !rightF){
    m.fireboy.slowDown("left"); 
  }
  
  if(leftW && !rightW){
    m.watergirl.speedUp("left"); 
  }else if (!leftW && !rightW){
    m.watergirl.slowDown("left"); 
  }
  
  if (jumpCounter > 0){
    jumpCounter--; 
    m.fireboy.jump(); 
  }
  
  m.moveChars(); 
  m.display(); 
}
