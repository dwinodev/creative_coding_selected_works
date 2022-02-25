float leftCenterX = width/4;
float rightCenterX = (width - (width/2)) / 2;

void setup() {

  fullScreen();
  //size(700, 700);

  leftCenterX = width/4;
  rightCenterX = (width/4) * 3;

  println(width, leftCenterX);
  println(width, rightCenterX);

  background(0);
  fill(255);
  rect(0, 0, width/2, height);
}

void draw() {
  saveFrame("output/gif/gif-######.png");

  drawLayer(leftCenterX, 0);
  drawLayer(rightCenterX, 255);
}

void drawLayer(float centerX, int fillColor) {

  //gaussian random number for x location ellipse
  float sdX = 60;
  float meanX = centerX;
  float gaussX = createRandomGaussian(sdX, meanX);

  //gaussian random number for y location ellipes
  float sdY = 60;
  float meanY = height/2;
  float gaussY = createRandomGaussian(sdY, meanY);

  //gaussian random number for width location ellipse
  float sdWidth = 100;
  float meanWidth = 16;
  float gaussWidth = createRandomGaussian(sdWidth, meanWidth);

  //gaussian random number for height location ellipse
  float sdHeight = 100;
  float meanHeight = 16;
  float gaussHeight = createRandomGaussian(sdHeight, meanHeight);

  noStroke();
  fill(fillColor, 2);
  ellipse(gaussX, gaussY, gaussWidth, gaussHeight);
}

float createRandomGaussian(float sd, float mean) {
  return (randomGaussian() * sd) + mean;
}
