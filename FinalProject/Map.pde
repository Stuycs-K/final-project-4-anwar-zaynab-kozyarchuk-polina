public class Map{
  public Character fireboy;
  public Character watergirl; 
  ArrayList<Door> doors; 
  ArrayList<Obstacle> blocks; 
  int ycor = height - (height/10);
  int level; 
  ArrayList<Switch> switches;
  ArrayList<Platform> platforms;
 //ArrayList<Gem> gems; 
 //int collectedGems; 
   
   public Map(){
     this(1); 
   }
   
   public Map(int level){
      if (level == 1){
       this.level = 1;
       blocks = new ArrayList<Obstacle>(); 
       blocks.add(new Obstacle("goo", width/4, ycor));
       blocks.add(new Obstacle("water", width/2, ycor)); 
       blocks.add(new Obstacle("lava", width*3/4, ycor)); 
      }
   }
   
   public void printTutorial(){
     PFont font; 
     font = loadFont("DejaVuSerif-48.vlw"); 
     textFont(font, 15); 
     fill(212, 217, 255); 
     textAlign(LEFT); 
     text("use AWD to control watergirl", 40,  height/10);
     text("use the arrow keys to control waterboy", 40, height/5); 
     text("use / and e to toggle levers", 40, height*3/10); 
     text("water kills lava and lava kills water...", 40, height*2/5); 
     text("and the green goo kills them both", 40, height*1/2); 
   }
   
   public void showBackground(){
     background(99, 82, 48); 
     fill(163, 123, 47); 
     noStroke(); 
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
     platforms.add(new Platform(doors.get(1).position.x - 60, doors.get(1).position.y-10));
     platforms.get(0).addState(platforms.get(0).position.x, platforms.get(0).position.y-30);
     
     switches = new ArrayList<Switch>();
     switches.add(new Lever(watergirl.position.x + 60, watergirl.position.y + 3, platforms.get(0)));
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
     displaySwitches(); 
     printTutorial(); 
   }
   
   void moveChars(){
     obstacleCollisions(); 
     fireboy.move(); 
     watergirl.move(); 
   }
   
   boolean lostGame(){
     fireboy.die();
     watergirl.die();
     if (fireboy.isDead || watergirl.isDead){
       background(color(0,0,0));
       textAlign(CENTER); 
       text("AHHAHAHHAHAH LOSER", width/2, height/3); 
       text("press spacebar to restart", width/2, height*2/3); 
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
   
   void restart(){
     setupMap(); 
   }
   
   void obstacleCollisions(){
     for (Platform p : platforms){
       fireboy.collide(p);
       watergirl.collide(p); 
     }
   }
   
}
