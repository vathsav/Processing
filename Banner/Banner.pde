int count = 5;
float[][] e = new float[count][5];
float[] circleColor = {
  135, 60, 190, 100, 210
};
int sep, radius, iradius;

void setup() {  
  size(displayWidth * 56/100, displayHeight * 20/100, P3D);
  radius = (int) (height * 55)/100;
  iradius = (int) (height * 55)/100;
  sep = (int) width/count;
  noStroke();
  smooth();
  colorMode(HSB);
  for (int j=0; j<count; j++) {
    e[j][0] = random((j * sep), (j * sep) + sep); // X
    e[j][1] = random(51, height - 51); // Y
    e[j][2] = height * .55; // Diameter
    e[j][3] = random(-.5, .5); // X Speed
    e[j][4] = random(-.5, .5); // Y Speed
  }
}

void draw() {
  background(0, 190, 200);
  frameRate(200);
//image(img, 0, 0, width/2, height/2);
  displayInterface();
}

void displayInterface() {
  for (int j = 0; j < count; j++) {
    //Change color on mouseover
    if (sq(e[j][0] - mouseX) + sq(e[j][1] - mouseY) < sq(e[j][2]/2))
      fill(circleColor[j]+10, 190, 160);
    else
      fill(circleColor[j], 190, 160, 200);
    //Draw circle
    ellipse(e[j][0], e[j][1], radius, radius);
    //If bound reached, rebound
    if (e[j][0] <= (j*sep) + radius/2)
      e[j][3] = random(.01, .5); // X forward
    if (e[j][0] >= ((j*sep) + sep - radius/2))
      e[j][3] = random (-.5, -.01); // X backward
    if (e[j][1] <= radius/2)
      e[j][4] = random(.01, .5); // Y downward
    if (e[j][1] >= height - radius/2)
      e[j][4] = random(-.5, -.01); // Y upward
    //Move the circles a little
    e[j][0] += e[j][3];
    e[j][1] += e[j][4];
    //Draw dots in the center of all circles
    fill(255);
    ellipse(e[j][0], e[j][1], 3, 3);
    //Connect the cirles
    stroke(200);
    if (j!=count-1) {
      line(e[j][0], e[j][1], e[j+1][0], e[j+1][1]);
    }
    noStroke();
  }
}

void mousePressed() {
  //Circle pressed
  if (sq(e[0][0] - mouseX) + sq(e[0][1] - mouseY) < sq(e[0][2]/2))
    link("index.html");
  if (sq(e[1][0] - mouseX) + sq(e[1][1] - mouseY) < sq(e[1][2]/2))
    link("blog.html");
  if (sq(e[2][0] - mouseX) + sq(e[2][1] - mouseY) < sq(e[2][2]/2))
    link("trovestream.html");
  if (sq(e[3][0] - mouseX) + sq(e[3][1] - mouseY) < sq(e[3][2]/2))
    link("about.html");
  if (sq(e[4][0] - mouseX) + sq(e[4][1] - mouseY) < sq(e[4][2]/2))
    link("contact.html");
}
