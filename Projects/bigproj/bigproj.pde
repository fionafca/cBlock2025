int r = 100;
int g = 100;
int b = 100;
int objectnoteheight = 100;
int note = 0;
int gengap = 25;


void setup(){
  size(500,500);
  noStroke();
  fill(r,g,b);
}


void draw(){
  background(255);
  
  draw_opening();

}


void draw_opening(){
  background(255,255,255);
  draw_plus(40,gengap);
  draw_showobject(5);
  draw_obptitle();
}

void draw_objectpage(){
  background(255,255,255);
  draw_plus(40,gengap);
  draw_home(40,gengap);
  draw_title();
  draw_text();
}

void draw_plus(int sizeplus, int gap){
  fill(0,200,100);
  rect(width-sizeplus-gap,gap,sizeplus,sizeplus);
}

void draw_home(int sizeplus, int gap){
  fill(0,100,255);
  rect(width-sizeplus-sizeplus-gap-gap,gap,sizeplus,sizeplus);
}

void draw_title(){
  fill(10,10,10);
  rect(gengap,gengap,width-250,50);
}

void draw_obptitle(){
  fill(10,10,10);
  rect(gengap,gengap,width-150,50);
}

void draw_text(){
  fill(100,100,100);
  rect(gengap,100,width-2*gengap,200);
}

void draw_showobject(int n){
  for (int i = 0; i<n; i=i+1){
    if (i % 2 == 0){ // color alternates
      note=10;
    }
    else {
      note =-10;
    }
    //fill boxes
    fill(200-note,220-note,245-note);
    rect(0,125+objectnoteheight*i,width,objectnoteheight);
    //write text
    fill(0,10,10);
    rect(gengap,125+gengap+objectnoteheight*i,width, objectnoteheight/4);
  }
}
