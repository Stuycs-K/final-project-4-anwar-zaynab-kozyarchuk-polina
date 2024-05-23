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
     background(0); 
     fill(102, 66, 0); 
     rect(0, height - 50, width, 50); 
   }
}
