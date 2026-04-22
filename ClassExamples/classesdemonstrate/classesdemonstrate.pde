PirateShip PlayerOne; // Declaring an instance of a class and giving it a handle
ArrayList<Character> storedWordAsArrayList;

/* Not Using
String storedWordAsString;
char[] storedWordAsArray; // Arrays are fixed length
*/

void setup(){
  size(1000, 1000);
  PlayerOne = new PirateShip(); // Construct the instance of the class
  storedWordAsArrayList = new ArrayList<Character>();
}


void draw(){
  background(0);
  PlayerOne.showPirateShip();
}


// Use ASDW to move
void keyPressed(){
 
  // There is a variable called 'key' that is stored and is the last pressed key
  // Moving something around on a screen
  if (key == 'a')      {
    /* do something - position X decrement*/
    PlayerOne.posX = PlayerOne.posX - PlayerOne.speed;
    //PlayerOne.posX -= PlayerOne.speed;
  }
 
  else if (key == 's') { /* do something */ }
  else if (key == 'd') { /* do something */ }
  else if (key == 'w') { /* do something */ }
 
  // updating keys to add to words
   storedWordAsArrayList.add(key);
   
   // print the ArrayList of stored characters
   println(storedWordAsArrayList);
   
   println(PlayerOne.posX);
 
}


class PirateShip {
 
  int posX, posY;
  int speed;
  color colorPirateShip;
  int healthPirateShip;
  boolean powerupPirateShip;
 
  // Constructor function
  PirateShip(){
    // This is the function that builds and instance of the class type
    // you can put stuff in this function to run automatically
    posX = width/2;
    posY = height/2;
    speed = int(random(10, 20));
   
    colorPirateShip = color( random(0, 255), random(0, 255), random(0, 255) );
  }
 
  void drawPirateShip(){
      // 3. The Player's Ship
      fill(colorPirateShip);
      stroke(255);      
      strokeWeight(2);
      triangle(400, 270, 380, 320, 420, 320);
  }
 
  void showPirateShip(){
    pushMatrix();
      translate(posX, posY);
      drawPirateShip();
    popMatrix();
  }
 
 
}
