float x, y, r, g, b, q, r1, r2;
void setup(){
 size(displayWidth, displayHeight, OPENGL);   
}

void draw(){
  r = random(255);
  g = random(255);
  b = random(255);
  q = random(255);
  x = random(displayWidth);
  y = random(displayHeight);
  r1 = random(100);
  r2 = random(100);
  background(r, g, b);
  lights();
  fill(255-r, 255-g, 255-b);
  translate(x, y);
  rotateX(r1*0.01);
  rotateY(r2*0.01);
  box(150);
  stroke(r, g, b);
}
