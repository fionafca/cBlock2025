//hex/unhex
// shaders
// key/keycode
//perspective//orthangona;//frucstum






int diameter = 200;

 

int lines = 50;

int lineThickness = 1;

 

color ballColor = color(255, 255, 255);

color lineColor = color(150, 150, 150);

color backgroundColor = color(0, 0, 0);

 

 

void setup(){

  size(800, 800);

}
 

void draw(){

  // Draw Background

  background(backgroundColor);

 
  // Draw Lines

  for(int i = 0; i < lines; i++){

    strokeWeight(lineThickness);
    stroke(lineColor);

    int x1 = (width/lines) * i;
    int y1 = 0;
    int x2 = (width/lines) * i;
    int y2 = height;

    line(x1, y1, x2, y2);
  }


  // Draw Ellipse

  ellipseMode(CENTER);
  noStroke();
  ellipse(width/2, height/2, diameter, diameter);
}
