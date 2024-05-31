public class Map{
  public Character fireboy;
  public Character watergirl; 
  ArrayList<Door> doors; 
  ArrayList<Obstacle> blocks; 
  int ycor = height - (height/10);
  int level; 
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
       printTutorial(); 
      }
   }
   
   public void printTutorial(){
     PFont font; 
     font = loadFont("DejaVuSerif-48.vlw"); 
     textFont(font, 15); 
     fill(212, 217, 255); 
     text("use AWD to control watergirl", width/20,  height/10);
     text("use the arrow keys to control waterboy", width/20, height/5); 
     text("water kills lava and lava kills water...", width/20, height*3/10); 
     text("and the green goo kills them both", width/20, height*2/5); 
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
   
   void display(){
     showBackground(); 
     displayChars(); 
     displayDoors(); 
     if (level == 1){
       printTutorial(); 
     }
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
