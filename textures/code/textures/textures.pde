import processing.svg.*;

void setup() {
  size(500, 500);
}

void draw() {
}

void keyPressed() {
  if (key == 's') {
    save("showcase/" + "####.jpg");
  } else if (key == 'c') {
    generateCircleTexture();
  } else if (key == 'e') {
    generateEllipseTexture();
  } else if (key == 'l') {
    generateLineTexture();
  }
}

void generateCircleTexture() { 
  beginRecord(SVG, "showcase/###.svg");
  background(random(5, 250));
  noFill();

  float iterations = random(0, 10000);

  for (int i=0; i < iterations; i++) {

    float x = random(0-width, 2 * width);
    float y = random(0-height, 2* height);
    float r = random(width, 2 * width);

    float darkness = random(5, 250);
    float transparancy = random (5, 250);

    strokeWeight(random(1,4));
    stroke(darkness, transparancy);
    circle(x, y, r);
  }
  endRecord();
}

void generateEllipseTexture() {

  background(random(5, 250));
  noFill();

  beginRecord(SVG, "showcase/###.svg");

  float iterations = random(0, 10000);

  for (int i=0; i < iterations; i++) {

    float a = random(0-(width*3), width*3);
    float b = random(0-(height*3), height*3);
    float c = random(width, width*3);
    float d = random(height, height*3);


    float darkness = random(5, 250);
    float transparancy = random (5, 250);

    stroke(darkness, transparancy);
    ellipse(a, b, c, d);
  }
  endRecord();
}

void generateLineTexture() {
  beginRecord(SVG, "showcase/###.svg");

  background(random(5, 250));
  noFill();

  float iterations = random(0, 10000);

  for (int i=0; i < iterations; i++) {

    float a = random(0-(width*3), 0);
    float b = random(0-(height*3), 0);
    float c = random(width, width*3);
    float d = random(height, height*3);


    float darkness = random(0, 255);
    float transparancy = random (0, 255);

    strokeWeight(random(1,4));
    stroke(darkness, transparancy);
    line(a, b, c, d);
  }
  endRecord();
}
