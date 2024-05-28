import java.util.*;
import java.lang.IndexOutOfBoundsException;

final color FIREDOOR = color(180,10,10);
final color WATERDOOR = color(50, 200, 200);
final color GOO = color(4, 120, 41);
final color LAVA = color(237, 97, 21);
final color WATER = color(173, 213, 247);
boolean rightF;
boolean rightW; 
boolean leftF; 
boolean leftW; 
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
    
  if (keyCode == LEFT)
    leftF = true;
  if (key == 'a')
    leftW = true; 
    
  if (keyCode == UP && !m.fireboy.isJumping()){
    m.fireboy.setJumping(true); 
    m.fireboy.jump(); 
  }
  if (key == 'w' && !m.watergirl.isJumping()){
    m.watergirl.setJumping(true); 
    m.watergirl.jump(); 
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
  if (!m.wonGame() && !m.lostGame()){
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
    
    
    m.moveChars(); 
    m.display(); 
  }

}
