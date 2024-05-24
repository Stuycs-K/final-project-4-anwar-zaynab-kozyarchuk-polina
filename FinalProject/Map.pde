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
     
<<<<<<< HEAD
     //fill(122, 206, 255); 
     //rect((width/20), ycor, (width/10), (height/20));
     
     /* code to display characters */
     //fireboy = new Character("f", 0,0);
     //fireboy.setPosition(0, ycor-fireboy.h);
     //fireboy.display();
     //watergirl = new Character("w", 0,0);
     //watergirl.setPosition(fireboy.w + 2, ycor-watergirl.h);
     //watergirl.display();     
=======
    
>>>>>>> cf513f3a231dcce8132b577bb2bcffef29f5f205
   }
}
