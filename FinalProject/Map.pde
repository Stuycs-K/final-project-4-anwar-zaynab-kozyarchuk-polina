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
     rect(0, height - (height/10), width, (height/10)); 
   }
}
