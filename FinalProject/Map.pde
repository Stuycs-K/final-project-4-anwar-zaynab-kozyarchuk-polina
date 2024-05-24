public class Map{
  Character fireboy;
  Character watergirl; 
  
 //ArrayList<Door> doors; 
 //ArrayList<Block> blocks; 
 //ArrayList<Gem> gems; 
 //int collectedGems; 
   
   public Map(){
     //fireboy = new Character(); 
     //watergirl = new Character(); 
   }
   
   public void setupMap(){
     background(99, 82, 48); 
     fill(163, 123, 47); 
     noStroke(); 
     int ycor = height - (height/10);
     rect(0, ycor, width, (height/10)); 
     
     fill(122, 206, 255); 
     rect((width/20), ycor, (width/10), (height/20));
     
     fireboy = new Character("f", 0,0);
     fireboy.setPosition(0, ycor-fireboy.h);
     fireboy.display();
     watergirl = new Character("w", 0,0);
     watergirl.setPosition(fireboy.w + 2, ycor-watergirl.h);
     watergirl.display();
     System.out.println("fireboy.position: " + fireboy.position + "\nwatergirl.position: " + watergirl.position);
   }
}
