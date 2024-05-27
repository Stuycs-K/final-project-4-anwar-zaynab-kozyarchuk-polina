public class Map{
  Character fireboy;
  Character watergirl; 
 
 ArrayList<Obstacle> blocks; 
  ArrayList<Door> doors; 
 //ArrayList<Gem> gems; 
 //int collectedGems; 
   
   public Map(){
     //fireboy = new Character(); 
     //watergirl = new Character(); 
     blocks = new ArrayList<Obstacle>(); 
     blocks.add(new Obstacle("goo", width/10, height - height/10)); 
   }
   
   public void setupMap(){

     //background(71, 35, 0); 
     //fill(163, 117, 0); 
     //rect(0, height - height/10, width, height/10); 
     //for (int i = 0; i < blocks.size(); i++){
     //  blocks.get(i).display(); 
     //}


     //fill(122, 206, 255); 
     //rect((width/20), ycor, (width/10), (height/20));
     
     /* code to display characters */
     //fireboy = new Character("f", 0,0);
     //fireboy.setPosition(0, ycor-fireboy.h);
     //fireboy.display();
     //watergirl = new Character("w", 0,0);
     //watergirl.setPosition(fireboy.w + 2, ycor-watergirl.h);
     //watergirl.display();     


     background(99, 82, 48); 
     fill(163, 123, 47); 
     noStroke(); 
     int ycor = height - (height/10);
     rect(0, ycor, width, (height/10)); 
     
     fill(122, 206, 255); 
     rect((width/20), ycor, (width/10), (height/20));
     
     /* code to display characters */
     fireboy = new Character(0,0, "f");
     fireboy.setPosition(0, ycor-fireboy.h);
     watergirl = new Character(0,0, "w");
     watergirl.setPosition(fireboy.w + 2, ycor-watergirl.h);
     displayChars();
     
     doors = new ArrayList<Door>();
     doors.add(new Door(width-10, ycor-fireboy.h, "f"));
     doors.add(new Door(width-10-fireboy.w-2, ycor-fireboy.h, "w"));
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
}
