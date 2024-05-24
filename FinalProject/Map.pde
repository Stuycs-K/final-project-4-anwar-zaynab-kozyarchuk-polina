public class Map{
  Character fireboy;
  Character watergirl; 
  
 //ArrayList<Door> doors; 
 ArrayList<Block> blocks; 
 //ArrayList<Gem> gems; 
 //int collectedGems; 
   
   public Map(){
     //fireboy = new Character(); 
     //watergirl = new Character(); 
     blocks = new ArrayList<Block>(); 
     blocks.add(new Block("goo", width/10, height - height/10)); 
   }
   
   public void setupMap(){
     background(71, 35, 0); 
     fill(163, 117, 0); 
     rect(0, height - height/10, width, height/10); 
     for (int i = 0; i < blocks.size(); i++){
       blocks.get(i).display(); 
     }
     
    
   }
}
