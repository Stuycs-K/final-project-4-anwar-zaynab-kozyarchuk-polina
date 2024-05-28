public class Map{
  public Character fireboy;
  public Character watergirl; 
  

  ArrayList<Door> doors; 
  ArrayList<Obstacle> blocks; 
 //ArrayList<Gem> gems; 
 //int collectedGems; 
   
   public Map(){
     //fireboy = new Character(); 
     //watergirl = new Character(); 
     blocks = new ArrayList<Obstacle>(); 
     blocks.add(new Obstacle("goo", width/10, height - height/10)); 
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
   }
   
   void moveChars(){
     fireboy.move(); 
     watergirl.move(); 
   }
   

}
