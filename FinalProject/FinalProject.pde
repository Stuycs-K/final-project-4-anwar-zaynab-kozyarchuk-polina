import java.util.*;
import java.lang.IndexOutOfBoundsException;

final color FIREBOY = color(204,81,83);
final color WATERGIRL = color(104, 226, 242);
final color FIREDOOR = color(180,10,10);
final color WATERDOOR = color(50, 200, 200);
final color GOO = color(4, 120, 41);
final color LAVA = color(237, 97, 21);
final color WATER = color(173, 213, 247);
final color uLEVER = color(159, 172, 194); //untoggled lever color
final color tLEVER = color(247, 194, 17);  //toggled lever color
final color PLATFORM = color(181, 155, 201);
final color GROUND = color(163, 123, 47); 
final color BACKGROUND = color(99, 82, 48); 
boolean rightF;
boolean rightW; 
boolean leftF; 
boolean leftW; 
Map m;
int currentLevel; 
PImage wImg; 
PImage fImg; 

void setup(){
  currentLevel = 1; 
  size(800, 700); 
  m = new Map(currentLevel); 
  m.setupMap(); 
  wImg = loadImage("watergirl.jpg"); 
  fImg = loadImage("fireboy.jpg"); 
   
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
  
  if (key == 'e'){
    m.toggleSwitches("w");
  }
  
  if (key == '/'){
    m.toggleSwitches("f");
  }
  
  if (key == 'y'){
    if (currentLevel == 2 || currentLevel == 3){
      m.fireboy.setPosition(0, height - 430);
      m.watergirl.setPosition(0, height - 430);
    }
    if (currentLevel == 1){
      m.fireboy.setPosition(width - 80, m.fireboy.position.y); 
      m.watergirl.setPosition(width - 90, m.watergirl.position.y); 
    }
  }
  
  if (m.lostGame() && key == ' '){
    m.restart(); 
  }
  
  if (m.wonGame() && key == ' '){
    if (currentLevel <= 2){
      currentLevel++; 
      m = new Map(currentLevel); 
      m.setupMap(); 
    }
    else{
      m.restart(); 
    }
  }
  
  if (m.wonGame() && key == 'b'){
    m.restart(); 

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
    m.adjustGems();
  }
  
   

}
