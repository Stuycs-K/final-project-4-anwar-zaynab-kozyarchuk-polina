# Work Log

## Polina Kozyarchuk

### 5/22/2024

wrote coordinates class

### 5/23/2024

thought about how we're gonna do this. worked on character class and made hem able to display. gonna make them move soonn. also for some reason watergirl is weirdly shorter than fireboy i shoudl figure that out

### 5/24/2024

worked on doors, displaying and figuring out where to place them.

### 5/27/2024

working more on doors, writing lose and win screen. they can die also

### 5/28/2024

made it so they win when both characters reach the doors

### 5/29/2024

starting to write constructors and general code for obstacles. spent a lot of time brainstorming on how they're gonna connect to the switches

### 5/30/2024

writing code for the switches, adjusting states of the platforms and such. got them to display

### 5/31/2024

finalized switches and platforms. because they literally didn't work

### 6/3/2024

making the platforms actually prevent the characters from moving. they may phase through them... sometimes.....

### 6/4/2024

trying to update the graphics. i can't get it to work for the life of me. gave up and updated the prototype

### 6/5/2024

trying to make buttons into a thing. incredibly buggy.

### 6/6/2024

when i try to get the buttons to work with two characters things start breaking. the whole game starts breaking. so i think i'm gonna give up on that

### 6/7/2024

working on gems! constructor, brainstorming logistics

### 6/8/2024 

trying to get the gem counter thing to make sense

### 6/9/2024

collecting gems, graphics of gems, etc

## Zaynab Anwar

### 5/22/2024

started on displaying the map in processing

### 5/23/2024

worked on the Block class -- wrote methods that do basic things like determining the type of block and also the constructor. Then I used this to help with the setupMap() method and displaying the obstacles on the initial map.

### 5/24/2024

mainly did some merging stuff with Polina in class (for the Block class, changed the name to obstacle, adding methods to Coordinate class, etc.)

### 5/27/224 

worked on the move() method for the characters. Now, using the D or -> keys, watergirl/fireboy respectively will move to the right. Took a while to make the movement smooth and played around with acceleration too.

### 5/28/2024

worked more on movement. There's a speedup and slowdown method, and this helps the acceleration work smoothly. Now, fireboy and watergirl can move in both directions. Also started working on the jump method. 

### 5/29/2024

did some stuff with placing obstacles randomly--this was how I was originally going to make the tutorial set up.

### 5/30/2024

played around with the map a little bit, started on the printed tutorial

### 5/31/2024

worked on displaying text during gameplay and during the endscreen (minor things like alignment and font)

### 6/3/2024

finally got the restart to work after one of the characters dies. 

### 6/4/2024

since we were having issues with the platforms (the ones that are controlled by the switch), I worked on that. It took a while but I figured out a collide() method so that the characters wouldn't just go through the platforms. 

### 6/5/2024

didn't have much time in class, but I made the window larger and fixed weirdly proportioned objects. 

### 6/6/2024

worked on interacting with obstacles (aka the ground and jumping up onto things). It works partially--the character is stopped when approaching an obstacle from left or right. Also set up the first actual level (level 2). 

### 6/7/2024

there were lots of issues with phasing through blocks, so I tried working to fix that. 

### 6/8/2024 

I made a system for displaying the player's "rank" at the end of the game. Also worked on fixing spacing for the map now that some bugginess was gone. 

### 6/9/2024

Added last touches. Made a third level, which was pretty simple and looks cool and different. Also did more bug fixing. 
