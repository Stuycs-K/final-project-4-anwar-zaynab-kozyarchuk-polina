public class Map{
  public Character fireboy;
  public Character watergirl; 
  

  ArrayList<Door> doors; 
  ArrayList<Obstacle> blocks; 
  ArrayList<Switch> switches;
  ArrayList<Platform> platforms;
 //ArrayList<Gem> gems; 
 //int collectedGems; 
   
   public Map(){
     //fireboy = new Character(); 
     //watergirl = new Character(); 
     blocks = new ArrayList<Obstacle>(); 
    // blocks.add(new Obstacle("goo", width/10, height - height/10)); 
   }
   
   public void showBackground(){
     background(99, 82, 48); 
     fill(163, 123, 47); 
     noStroke(); 
     int ycor = height - (height/10);
     rect(0, ycor, width, (height/10)); 
     
     for (Obstacle o: blocks){
       o.display(); 
     }
   }
   public void setupMap(){
     showBackground(); 
     
     /* code to display characters */
     int ycor = height - (height/10);
     fireboy = new Character(0,0, "f");
     fireboy.setPosition(0, ycor-fireboy.h);
     watergirl = new Character(0,0, "w");
     watergirl.setPosition(fireboy.w + 2, ycor-watergirl.h);
     displayChars();
     
     doors = new ArrayList<Door>();
     doors.add(new Door(width-10, ycor-fireboy.h, "f"));
     doors.add(new Door(width-10-fireboy.w-8, ycor-fireboy.h, "w"));
     displayDoors();
     
     platforms = new ArrayList<Platform>();
     platforms.add(new Platform(doors.get(1).position.x - 15, doors.get(1).position.y-10));
     platforms.get(0).addState(platforms.get(0).position.x, platforms.get(0).position.y-30);
     
     switches = new ArrayList<Switch>();
     switches.add(new Button(watergirl.position.x + 15, watergirl.position.y+(watergirl.h) - 3, platforms.get(0)));
   }
   
   void toggleSwitches(String type){
     for (int i = 0; i < switches.size(); i++){
       switches.get(i).toggle(type);
     }
   }
   
   void displayDoors(){
     for (int i = 0; i < doors.size(); i++){
       doors.get(i).display();
     }
   }
   
   void displayChars(){
     fireboy.display();
     watergirl.display();
   }
   
   void displaySwitches(){
     for (int i = 0; i < switches.size(); i++){
       switches.get(i).display();
     }     
   }
   
   void display(){
     showBackground(); 
     displayChars(); 
     displayDoors();
     //println("platform position: " + platforms.get(0).position);
     displaySwitches();
   }
   
   void moveChars(){
     fireboy.move(); 
     watergirl.move(); 
   }
   
   boolean lostGame(){
     fireboy.die();
     watergirl.die();
     if (fireboy.isDead || watergirl.isDead){
       background(color(0,0,0));
       text("AHHAHAHHAHAH LOSER", width- (width/2), height - (height/2)); 
       return true;
     } else {
       return false;
     }
   }
   
   boolean wonGame(){
     fireboy.reachGoal();
     watergirl.reachGoal();
     if (fireboy.atDoor && watergirl.atDoor){
       delay(500);
       background(color(0,0,0));
       text("YOU WON!!!", width- (width/2), height - (height/2));  
       return true;
     } else {
       return false;
     }
   }
   
}
