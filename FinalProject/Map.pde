public class Map{
  public Character fireboy;
  public Character watergirl; 
  ArrayList<Door> doors; 
  ArrayList<Obstacle> blocks; 
  int ycor = height - 40;
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
      }
       
      if (level == 2){
        this.level = 2; 
      }
   }
   
   public void printTutorial(){
     PFont font; 
     font = loadFont("DejaVuSerif-48.vlw"); 
     textFont(font, 15); 
     fill(212, 217, 255); 
     textAlign(LEFT); 
     text("use AWD to control watergirl", 40,  40);
     text("use the arrow keys to control waterboy", 40, 80); 
     text("use / and e to toggle levers", 40, 120); 
     text("water kills lava and lava kills water...", 40, 160); 
     text("and the green goo kills them both", 40, 200); 
   }
   
   public void showBackground(){
     background(99, 82, 48); 
     noStroke(); 
     for (Obstacle o: blocks){
       o.display(); 
     }
   }
   
   public void setupMap(){ 
     blocks = new ArrayList<Obstacle>(); 
     doors = new ArrayList<Door>();
     platforms = new ArrayList<Platform>();
     switches = new ArrayList<Switch>();
     
     /* code to display characters */
     fireboy = new Character(0,0, "f");
     fireboy.setPosition(0, ycor-fireboy.h);
     watergirl = new Character(0,0, "w");
     watergirl.setPosition(fireboy.w + 2, ycor-watergirl.h);
     displayChars();
     
     if (level == 1){
       
       blocks.add(new Obstacle("ground", 0, height - 40)); 
       blocks.add(new Obstacle("goo", width/4, ycor));
       blocks.add(new Obstacle("water", width/2, ycor)); 
       blocks.add(new Obstacle("lava", width*3/4, ycor)); 
       
       doors.add(new Door(width-10, ycor-fireboy.h, "f"));
       doors.add(new Door(width-10-fireboy.w-8, ycor-fireboy.h, "w"));
       displayDoors();
       
       platforms.add(new Platform(doors.get(1).position.x - 60, doors.get(1).position.y-10));
       platforms.get(0).addState(platforms.get(0).position.x, platforms.get(0).position.y-30);
       
       switches.add(new Lever(watergirl.position.x + 60, watergirl.position.y + 3, platforms.get(0)));
       
     }
     
     if (level == 2){
       
       // ground pieces
       blocks.add(new Obstacle("ground", 0, height - 40, width, 40)); 
       blocks.add(new Obstacle("ground", 0, height - 120, width - 100, 20)); 
       blocks.add(new Obstacle("ground", width - 80, height - 80, 100, 40)); 
       blocks.add(new Obstacle("ground", 0, height - 160, 100, 40)); 
       blocks.add(new Obstacle("ground", 100, height - 220, width - 100, 20)); 
       blocks.add(new Obstacle("ground", 0, height - 280, 300, 20)); 
       blocks.add(new Obstacle("ground", 500, height - 280, 300, 20)); 
       blocks.add(new Obstacle("ground", 0, height - 320, 100, 40)); 
       blocks.add(new Obstacle("ground", width - 100, height - 320, 100, 40)); 
       blocks.add(new Obstacle("ground", 120, height - 360, 530, 20)); 
       blocks.add(new Obstacle("ground", 0, height - 400, 100, 20)); 
       blocks.add(new Obstacle("ground", 120, height - 450, width - 120, 20)); 
       
       // pools
       blocks.add(new Obstacle("goo", 100, height - 40)); 
       blocks.add(new Obstacle("water", 300, height - 40)); 
       blocks.add(new Obstacle("lava", 500, height - 40)); 
       blocks.add(new Obstacle("water", 150, height - 280, 100, 10)); 
       blocks.add(new Obstacle("lava", width - 250, height - 280, 100, 10)); 
       blocks.add(new Obstacle("goo", width - 300, height - 360)); 
       blocks.add(new Obstacle("water", width - 400, height - 360)); 
       
       doors.add(new Door(width - 20, height - 470, "f")); 
       doors.add(new Door(width - 40, height - 470, "w")); 
       
       //platforms
       Platform p; 
       p = new Platform(doors.get(1).position.x - 100, height - 470 - 50, 20, 70);
       platforms.add(p); 
       p.addState(p.position.x, p.position.y - 70); 
       switches.add(new Lever(width - 350, height - 380, p)); 
       
       p = new Platform(0, height - 220, 100, 20); 
       platforms.add(p); 
       p.addState(p.position.x + 100, p.position.y); 
       switches.add(new Lever(width - 400, height - 140, p)); 
     }
    
     
     showBackground(); 
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
     if (level == 1)
       printTutorial(); 
   }
   
   void moveChars(){ 
     fireboy.move(); 
     watergirl.move(); 
     platformCollisions(); 
     obstacleInteractions();
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
   
   void platformCollisions(){
     for (Platform p : platforms){
       fireboy.collide(p);
       watergirl.collide(p); 
     }
   }
   
   void obstacleInteractions(){
     for (Obstacle o : blocks){
       fireboy.interact(o); 
       watergirl.interact(o); 
     }
   }
   
}
