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

     
 
      this.level = level; 
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
       p = new Platform(doors.get(1).position.x - 100, height - 480 - 100, 20, 100);
       platforms.add(p); 
       p.addState(p.position.x, p.position.y - 100); 
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
     
     if (level == 3){
       watergirl.setPosition(width - watergirl.w, watergirl.getY() + watergirl.h); 
       
       int currY = height - 20; 
       blocks.add(new Obstacle("ground", 0, currY, width, 20)); 
       blocks.add(new Obstacle("lava", 200, currY, 150, 10)); 
       blocks.add(new Obstacle("water", 450, currY, 150, 10)); 
       currY -= 50; 
       blocks.add(new Obstacle("ground", 350, currY, 100, 50));
       currY -= 60; 
       blocks.add(new Obstacle("ground", 0, currY, 350, 20)); 
       blocks.add(new Obstacle("water", 80, currY, 150, 10));
       blocks.add(new Obstacle("ground", 450, currY, 350, 20));
       blocks.add(new Obstacle("lava", 580, currY, 150, 10)); 
       currY -= 40; 
       blocks.add(new Obstacle("ground", 0, currY, 30, 40)); 
       blocks.add(new Obstacle("ground", width - 30, currY, 30, 40)); 
       currY -= 40; 
       int doorY = currY;
       blocks.add(new Obstacle("ground", 80, currY, width - 160, 20)); 
       currY -= 40;  
       blocks.add(new Obstacle("ground", 350, currY, 100, 40)); 
       currY -= 20; 
       blocks.add(new Obstacle("ground", 0, currY, 60, 20)); 
       blocks.add(new Obstacle("ground", width - 60, currY, 60, 20)); 
       currY -= 40; 
       blocks.add(new Obstacle("ground", 200, currY, 100, 20)); 
       blocks.add(new Obstacle("lava", 210, currY, 80, 10)); 
       blocks.add(new Obstacle("ground", 500, currY, 100, 20)); 
       blocks.add(new Obstacle("water", 510, currY, 80, 10)); 
       blocks.add(new Obstacle("ground", 390, currY, 20, 60)); 
       currY -= 100; 
       blocks.add(new Obstacle("ground", 350, currY, 100, 100)); 
       currY -= 80; 
       blocks.add(new Obstacle("ground", 60, currY, 280, 20)); 
       blocks.add(new Obstacle("ground", width - 340, currY, 280, 20)); 
       currY += 20; 
       blocks.add(new Obstacle("ground", 180, currY, 20, 260)); 
       blocks.add(new Obstacle("ground", 600, currY, 20, 260)); 
       currY += 100; 
       blocks.add(new Obstacle("ground", 120, currY, 60, 20)); 
       blocks.add(new Obstacle("ground", 620, currY, 60, 20)); 
       
       doorY -= 20; 
       doors.add(new Door(250, doorY, "fire")); 
       doors.add(new Door(540, doorY, "water")); 
       
       Platform p; 
       p = new Platform(120, 360, 60, 20); 
       p.addState(60, 380); 
       platforms.add(p); 
       switches.add(new Lever(10, 410, p)); 
       
       p = new Platform(80, 300, 100, 20); 
       p.addState(0, 280); 
       platforms.add(p); 
       switches.add(new Lever(80, 360, p)); 
       
       p = new Platform(620, 360, 60, 20); 
       p.addState(680, 380); 
       platforms.add(p); 
       switches.add(new Lever(width - 10, 410, p)); 
       
       p = new Platform(620, 300, 100, 20); 
       p.addState(width - 100, 280); 
       platforms.add(p); 
       switches.add(new Lever(width - 80, 360, p)); 
       
       gems.add(new Gem(300, height-160, "f"));
       gems.add(new Gem(500, height-160, "w"));
       gems.add(new Gem(355, 420, "f"));
       gems.add(new Gem(420, 420, "w"));
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
       String collectedGems = " collectedGems: " + (collectedFGems + collectedWGems)  +"/" + gems.size();
       String rank = "rank: " + calculateRank(); 
       text(collectedGems, width/2, height/3 +50);
       text(rank, width/2, 2*height/3 -50);  
       if (level <= 2){
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
   
   
   void obstacleInteractions(){
     for (Obstacle o : blocks){
       fireboy.interact(o); 
       watergirl.interact(o); 
     }
     for (Platform p : platforms){
       fireboy.interact(p); 
       watergirl.interact(p); 
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
