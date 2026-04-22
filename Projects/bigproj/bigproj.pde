int r = 100;
int g = 100;
int b = 100;

int gengap = 25;

ObjectNote[] notes;

int currentNote = 0;

// controls which page we are on woohoo
boolean onObjectPage = false;

// input system
boolean typing = false;
String inputText = "";

void setup(){
  size(500,500);
  noStroke();
  fill(r,g,b);
  
  notes = new ObjectNote[5];
  for (int i = 0; i < notes.length; i++){
    notes[i] = new ObjectNote(i);
  }
}

void draw(){
  background(255);
  
  if (!onObjectPage){
    draw_opening();
  } else {
    draw_objectpage();
  }
}

void draw_opening(){
  background(255,255,255);
  draw_plus(40,gengap);
  
  for (int i = 0; i < notes.length; i++){
    notes[i].displayRow();
  }
  
  notes[0].drawTitleBar();
}

void draw_objectpage(){
  background(220,220,220);
  draw_plus(40,gengap);
  draw_home(40,gengap);
  
  // start typing when page first opens
  if (!typing && inputText.equals("")){
    typing = true;
  }
  
  if (typing){
    drawInputPrompt();
  } else {
    currentNote = constrain(currentNote, 0, notes.length - 1);
    notes[currentNote].drawTitleBar();
    notes[currentNote].drawTextBox();
    notes[currentNote].drawNumber();
  }
}

//here come both the typing and mouse clicking input systems:


//this is to swithc pages on any click

void mousePressed(){
  if (!onObjectPage){
    onObjectPage = true;
    
    // reset input when entering object page
    typing = true;
    inputText = "";
  }
}

//this is just asking for basic inpit, might reuse this later to make something else but now serves to check which page we should be on
void drawInputPrompt(){
  fill(0);
  textSize(16);
  text("Enter note number (0 - " + (notes.length-1) + "):", 50, 200);
  
  fill(50);
  rect(50, 220, 200, 30);
  
  fill(255);
  text(inputText, 55, 242);
}

//for now this is used to pick the page to go onto, but later may repurpose to type letters
void keyPressed(){
  if (typing){
    if (key >= '0' && key <= '9'){
      inputText += key;
    }
    
    else if (key == BACKSPACE && inputText.length() > 0){
      inputText = inputText.substring(0, inputText.length()-1);
    }
    
    else if (key == ENTER || key == RETURN){
      if (inputText.length() > 0){
        currentNote = int(inputText);
      }
      typing = false;
    }
  }
}

void draw_plus(int sizeplus, int gap){
  fill(0,200,100);
  rect(width-sizeplus-gap,gap,sizeplus,sizeplus);
}

void draw_home(int sizeplus, int gap){
  fill(0,100,255);
  rect(width-sizeplus-sizeplus-gap-gap,gap,sizeplus,sizeplus);
}

class ObjectNote {
  
  // self explanatory mostly
  int index;
  int objectnoteheight = 100;
  
  //defines the index here
  ObjectNote(int i){
    index = i;
  }
  
  //changes the shade of each note on opening page
  void displayRow(){
    int noteshade;
    
    if (index % 2 == 0){
      noteshade = 10;
    } else {
      noteshade = -10;
    }
    
    fill(200-noteshade,220-noteshade,245-noteshade);
    rect(0, 125 + objectnoteheight * index, width, objectnoteheight);
    
    fill(0,10,10);
    rect(gengap, 125 + gengap + objectnoteheight * index, width, objectnoteheight/4);
  }
  
  void drawTitleBar(){
    fill(10,10,10);
    rect(gengap, gengap, width-150, 50);
  }
  
  void drawTextBox(){
    fill(100,100,100);
    rect(gengap, 100, width-2*gengap, 200);
  }
  //this is just changing the fill color so you can idenityf whihc page ur on for now
  void drawNumber(){
    fill(50*index,10,10);
    rect(10, 100, width-2*gengap, 200);
  }
  
}
