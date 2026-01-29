//hex/unhex
// shaders
// key/keycode
// key is single char, ascii
//keycode is not ascii

//perspective//orthangona;//frucstum






int diameter = 200;

 

int lines = 50;

int lineThickness = 1;

 

color ballColor = color(255, 255, 255);

color lineColor = color(150, 150, 150);

color backgroundColor = color(0, 0, 0);

 

 

void setup(){

  size(800, 800, P3D);


}
 

void draw(){
  
  checkKeys(); //checks 4 key press

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
  
  float fov = mouseX/float(width) * PI/2 ;
  float aspect =float(width)/float(height);
  float cameraY = height/2.0;
  float cameraZ = cameraY / tan(fov/2.0);
  
  if (mousePressed) {
    aspect = aspect/2.0;
  }
  
  perspective(fov,aspect,cameraZ/10.0, cameraZ*10.0);
  
  
  //box 
    lights();
  pushMatrix();
  translate(width/2, height/2);
  rotateX(PI/3);
  
  box(180);
  
  popMatrix();
}






void checkKeys(){
  if (keyPressed) 
  {
    
    println(" a key is pressed, but which key?");
    if (key == CODED)
    {
      //prti
      
      println("key got pressed");
    }
  }
  
}
