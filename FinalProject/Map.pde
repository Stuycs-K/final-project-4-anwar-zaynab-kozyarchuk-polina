public class Map{
  public Character fireboy;
  public Character watergirl; 
  ArrayList<Door> doors; 
  ArrayList<Obstacle> blocks; 
  int ycor = height - 40;
  int level; 
  ArrayList<Switch> switches;
  ArrayList<Platform> platforms;
  ArrayList<Gem> gems; 
  int collectedFGems;
  int collectedWGems;
  PImage fGem;
  PImage wGem;
  int timer; 
   
   public Map(){
     this(1); 
   }
   
   public Map(int level){
     collectedWGems = 0;
     collectedFGems = 0;
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
     background(BACKGROUND); 
     noStroke(); 
     for (Obstacle o: blocks){
       o.display(); 
     }
     fGem = loadImage("firegem.png");
     wGem = loadImage("watergem.png");
     fGem.resize(40,40);
     wGem.resize(40,40);   
     image(fGem,700, 10);
     image(wGem, 700, 60);
   }
   
   public void setupMap(){ 
     timer = 0;
     blocks = new ArrayList<Obstacle>(); 
     doors = new ArrayList<Door>();
     platforms = new ArrayList<Platform>();
     switches = new ArrayList<Switch>();
     gems = new ArrayList<Gem>(); 
     
     /* code to display characters */
     fireboy = new Character(0,0, "f");
     fireboy.setPosition(0, ycor-fireboy.h);
     watergirl = new Character(0,0, "w");
     watergirl.setPosition(fireboy.w + 2, ycor-watergirl.h);
     displayChars();
     
     
     if (level == 1){
       
       blocks.add(new Obstacle("ground", 0, height - 40, width, 40)); 
       blocks.add(new Obstacle("goo", width/4, ycor));
       blocks.add(new Obstacle("water", width/2, ycor)); 
       blocks.add(new Obstacle("lava", width*3/4, ycor)); 
       
       doors.add(new Door(width-10, ycor-fireboy.h, "f"));
       doors.add(new Door(width-10-fireboy.w-8, ycor-fireboy.h, "w"));
       displayDoors();
       
       platforms.add(new Platform(doors.get(1).position.x - 60, doors.get(1).position.y-60, 10, 80));
       platforms.get(0).addState(platforms.get(0).position.x, platforms.get(0).position.y-30);
       
       switches.add(new Lever(watergirl.position.x + 60, watergirl.position.y + 3, platforms.get(0)));
       
       gems.add(new Gem(watergirl.position.x + 120, watergirl.position.y-5, "f"));
       gems.add(new Gem(watergirl.position.x + 650, watergirl.position.y-5, "w"));       
       
     }
     
     if (level == 2){
       
       // ground pieces
       blocks.add(new Obstacle("ground", 0, height - 40, width, 40)); 
       blocks.add(new Obstacle("ground", 0, height - 150, width - 100, 20)); 
       blocks.add(new Obstacle("ground", width - 80, height - 90, 100, 50)); 
       blocks.add(new Obstacle("ground", 0, height - 190, 100, 40)); 
       blocks.add(new Obstacle("ground", 120, height - 250, width - 120, 20)); 
       blocks.add(new Obstacle("ground", 0, height - 310, 300, 20)); 
       blocks.add(new Obstacle("ground", 500, height - 310, 300, 20)); 
       blocks.add(new Obstacle("ground", 0, height - 350, 100, 40)); 
       blocks.add(new Obstacle("ground", width - 100, height - 350, 100, 40)); 
       blocks.add(new Obstacle("ground", 130, height - 380, 530, 20)); 
       blocks.add(new Obstacle("ground", 0, height - 420, 90, 20)); 
       blocks.add(new Obstacle("ground", 120, height - 480, width - 120, 20)); 
       
       // pools
       blocks.add(new Obstacle("goo", 100, height - 40)); 
       blocks.add(new Obstacle("water", 300, height - 40)); 
       blocks.add(new Obstacle("lava", 500, height - 40)); 
       blocks.add(new Obstacle("water", 150, height - 310, 100, 10)); 
       blocks.add(new Obstacle("lava", width - 250, height - 310, 100, 10)); 
       blocks.add(new Obstacle("goo", width - 300, height - 380)); 
       blocks.add(new Obstacle("water", width - 400, height - 380)); 
       
       
       doors.add(new Door(width - 20, height - 500, "f")); 
       doors.add(new Door(width - 40, height - 500, "w")); 
       
       //platforms
       Platform p; 
       p = new Platform(doors.get(1).position.x - 100, height - 480 - 70, 20, 70);
       platforms.add(p); 
       p.addState(p.position.x, p.position.y - 70); 
       switches.add(new Lever(width - 350, height - 400, p)); 
       
       p = new Platform(0, height - 250, 120, 20); 
       platforms.add(p); 
       p.addState(p.position.x + 1000, p.position.y); 
       switches.add(new Lever(width - 400, height - 170, p));
       
       gems.add(new Gem(305, height-95, "f"));
       gems.add(new Gem(505, height-95, "w"));
       gems.add(new Gem(765, height-120, "w"));
       gems.add(new Gem(765, height-280, "f"));
       gems.add(new Gem(265, height-340, "f"));
       gems.add(new Gem(510, height-340, "w"));

     }
    
     showBackground(); 
   }
   
   void displayCollected(){
     text(collectedFGems, 745, 43);
     text(collectedWGems, 745, 93);
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
   
   void displayGems(){
     for (int i = 0; i < gems.size(); i++){
       gems.get(i).display();
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
     displayGems();
     displaySwitches();
     displayTimer();
     displayCollected();
     
     if (level == 1)
       printTutorial(); 
     
     if (frameCount % 100 == 0){
       timer++;
     }
     
     // code to display the number of each block, useful for debugging
     //for (int i = 0; i < blocks.size(); i++){
     //    PFont font; 
     //    font = loadFont("DejaVuSerif-48.vlw"); 
     //    textFont(font, 15); 
     //    fill(0); 
     //    textAlign(LEFT); 
     //    text(i, blocks.get(i).position.x, blocks.get(i).position.y); 
     //  }
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
       fill(255); 
       text("AHHAHAHHAHAH LOSER", width/2, height/3); 
       text("press spacebar to restart", width/2, height*2/3);
       collectedFGems = 0;
       collectedWGems = 0;       
       return true;
     } else {
       return false;
     }

   }
   
   void adjustGems(){
     for (int i = 0; i < gems.size(); i++){
       gems.get(i).disappear();
     }
   }
   
   boolean wonGame(){
     fireboy.reachGoal();
     watergirl.reachGoal();
     if (fireboy.atDoor && watergirl.atDoor){
       //delay(500);
       background(color(0,0,0));
       textAlign(CENTER); 
       fill(255); 
       text("YOU WON!!!", (width/2), height - (height*3/4));  
       String rank = "rank: " + calculateRank(); 
       text(rank, width/2, height/2); 
       if (level == 1){
         text("press spacebar to go to next level, b to repeat level", width - width/2, height - height/4); 
       }
       textAlign(LEFT); 
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
   
   void displayTimer(){
     String s = ""; 
     if (timer/60 < 10){
       s += "0"; 
     }
     s += (timer/60) + ":";
     if (timer%60 < 10){
       s += "0"; 
     }
     s+= timer%60; 
     
     textAlign(CENTER); 
     fill(0); 
     PFont font; 
     font = loadFont("DejaVuSerif-48.vlw"); 
     textFont(font, 30); 
     text(s, width/2, 40); 
     textAlign(LEFT); 
   }
   
   String calculateRank(){
     if (timer < 120 && (collectedFGems + collectedWGems) == gems.size()){
       return "A"; 
     }
     else if (timer < 300){
       if ((collectedFGems + collectedWGems) == gems.size()){
         return "B"; 
       }else{
         return "C"; 
       }
     }else{
       if ((collectedFGems + collectedWGems) >= gems.size() - 3){
         return "D"; 
       }else{
         return "F"; 
       }
     }

   }
   
}
