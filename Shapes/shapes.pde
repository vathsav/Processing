boolean cube, sphere, pyramid, cuboid, star;

void setup() {
  stroke(255);
  size(displayWidth, displayHeight, OPENGL);
  cube = false; 
  sphere = false;
  pyramid = false;
  cuboid = false;
  star = false;
}

void draw() {
  background(0);
  displayInterface();
  displayShapes();
  shapeSelected();
  drawShape();
}

void displayShapes() {
  //cube
  pushMatrix();
  translate(displayWidth/16, displayHeight/10);
  fill(180, 0, 0, 50);
  box(50);
  popMatrix();
  //sphere
  pushMatrix();
  translate(displayWidth/16, 3*(displayHeight/10), 0);
  fill(0, 180, 0, 50);
  sphere(35);
  popMatrix();
  //pyramid
  pushMatrix();
  translate(displayWidth/16, 5*(displayHeight/10));
  beginShape();
  rotateY(1000);
  scale(.5);
  fill(0, 100, 100);
  //vertex 1
  vertex(-100, -100, -100);
  vertex( 100, -100, -100);
  vertex( 0, 0, 100);
  //vertex 2
  vertex( 100, -100, -100);
  vertex( 100, 100, -100);
  vertex( 0, 0, 100);
  //vertex 3
  vertex( 100, 100, -100);
  vertex(-100, 100, -100);
  vertex( 0, 0, 100);
  //vertex 4
  vertex(-100, 100, -100);
  vertex(-100, -100, -100);
  vertex( 0, 0, 100);
  endShape();
  popMatrix();
  //cuboid
  pushMatrix();
  translate(displayWidth/16, 7*(displayHeight/10));
  fill(50, 10, 60);
  box(100, 50, 20);
  popMatrix();
  //star
  pushMatrix();
  translate(displayWidth/16, 9*(displayHeight/10));
  fill(60, 255, 100);
  beginShape();
  vertex(0, -50);
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape();
  popMatrix();
}

void displayInterface() {
  strokeWeight(5);
  line(displayWidth/8, 0, displayWidth/8, displayHeight);
  line(0, displayHeight/5, displayWidth/8, displayHeight/5);
  line(0, 2*(displayHeight/5), displayWidth/8, 2*(displayHeight/5));
  line(0, 3*(displayHeight/5), displayWidth/8, 3*(displayHeight/5));
  line(0, 4*(displayHeight/5), displayWidth/8, 4*(displayHeight/5));
  strokeWeight(1);
}

void shapeSelected() {
  if (mouseX >= 0 && mouseX <= displayWidth/8 && mouseY >= 0 && mouseY <= displayHeight/5) {
    cube = true;
    sphere = false;
    pyramid = false;
    cuboid = false;
    star = false;
  } else if (mouseX >= 0 && mouseX <= displayWidth/8 && mouseY >= displayHeight/5 && mouseY <= 2*(displayHeight/5)) {
    cube = false;
    sphere = true;
    pyramid = false;
    cuboid = false;
    star = false;
  } else if (mouseX >= 0 && mouseX <= displayWidth/8 && mouseY >= 2*(displayHeight/5) && mouseY <= 3*(displayHeight/5)) {
    cube = false;
    sphere = false;
    pyramid = true;
    cuboid = false;
    star = false;
  } else if (mouseX >= 0 && mouseX <= displayWidth/8 && mouseY >= 3*(displayHeight/5) && mouseY <= 4*(displayHeight/5)) {
    cube = false;
    sphere = false;
    pyramid = false;
    cuboid = true;
    star = false;
  } else if (mouseX >=0 && mouseX <=displayWidth/8 && mouseY >= 4*(displayHeight/5) && mouseY <= displayHeight) {
    cube = false;
    sphere = false;
    pyramid = false;
    cuboid = false;
    star = true;
  }
}

void drawShape() {
  if (cube) {
    pushMatrix();
    fill(180, 0, 0, 127);
    translate(mouseX, mouseY);
    rotateX(mouseX*0.01);
    rotateY(mouseY*0.01);
    lights();
    box(150);
    popMatrix();
  } else if (sphere) {
    pushMatrix();
    fill(180, 180, 0);
    translate(mouseX, mouseY);
    rotateX(mouseX*0.01);
    rotateY(mouseY*0.01);
    lights();
    sphere(150);
    popMatrix();
  } else if (pyramid) {
    pushMatrix();
    translate(mouseX, mouseY);
    rotateX(mouseX*0.01);
    rotateY(mouseY*0.01);
    lights();
    beginShape();
    vertex(-100, -100, -100);
    vertex( 100, -100, -100);
    vertex( 0, 0, 100);

    vertex( 100, -100, -100);
    vertex( 100, 100, -100);
    vertex( 0, 0, 100);

    vertex( 100, 100, -100);
    vertex(-100, 100, -100);
    vertex( 0, 0, 100);

    vertex(-100, 100, -100);
    vertex(-100, -100, -100);
    vertex( 0, 0, 100);
    endShape();
    popMatrix();
  } else if (cuboid) {
    pushMatrix();
    translate(mouseX, mouseY);
    rotateX(mouseX*0.01);
    rotateY(mouseY*0.01);
    lights();
    fill(50, 10, 60);
    box(150, 100, 20);
    popMatrix();
  } else if (star) {
    pushMatrix();
    translate(mouseX, mouseY);
    rotateX(mouseX*0.01);
    rotateY(mouseY*0.01);
    lights();
    beginShape();
    vertex(0, -50);
    vertex(14, -20);
    vertex(47, -15);
    vertex(23, 7);
    vertex(29, 40);
    vertex(0, 25);
    vertex(-29, 40);
    vertex(-23, 7);
    vertex(-47, -15);
    vertex(-14, -20);
    endShape();
    popMatrix();
  }
}
