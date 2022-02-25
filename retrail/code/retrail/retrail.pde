// speel met life, birthage, maxspeed, birthage reset, noiseoffset ....


ArrayList<Worm> worms = new ArrayList<Worm>();
Worm w;

float x = width/2;
float y = height/2;
float maxSpeed = 2.5;
int birthAge = 15;
float offset = 0.1;
int filling = 25;

boolean colored = false;

float red = 0;
float rOffset = 0.00001;
float green = 10000;
float gOffset = 0.005;
float blue = 1000000;
float bOffset = 0.00001;

ParamObject resetObject;

void setup() {
  fullScreen();
  //size(640, 360);
  background(0);
  prepareResetObject();

  int rNoise = int(map(noise(red), 0, 1, 0, 255));
  int gNoise = int(map(noise(green), 0, 1, 0, 255));
  int bNoise = int(map(noise(blue), 0, 1, 0, 255));

  w = new Worm(width/2, height/2, maxSpeed, birthAge, offset, filling, rNoise, gNoise, bNoise);
  worms.add(w);
}

void draw() {
  if (resetObject.record) {
    saveFrame("output/gif/gif-######.png");
  }


  println(worms.size());
  background(0);

  if ( worms.size() > 100) {
    worms.get(0)._dying = true;
    if ( worms.get(0)._filling == 0) {
      worms.remove(0);
    }
  }

  for (int i = 0; i < worms.size(); i++ ) {

    int rNoise = int(map(noise(red), 0, 1, 0, 255));
    int gNoise = int(map(noise(green), 0, 1, 0, 255));
    int bNoise = int(map(noise(blue), 0, 1, 0, 255));

    worms.get(i).boundaries();
    worms.get(i).run(rNoise, gNoise, bNoise);

    red += rOffset;
    green += gOffset;
    blue += bOffset;
  }
}

void keyPressed() {
  if (key == 'r') {
    background(0);
    resetParameters();
    resetObject.record = true;
  } else if ( key == 's') {
    saveFrame("output/screenshots/######.png");
  }  else if ( key == 'c') {
    colored = !colored;
  }
}

void prepareResetObject() {

  resetObject = new ParamObject();

  resetObject.x = x;
  resetObject.y = y;
  resetObject.maxSpeed = maxSpeed;
  resetObject.birthAge = birthAge;
  resetObject.offset = offset;
  resetObject.filling = filling;
  
  resetObject.red = red;
  resetObject.rOffset = rOffset;
  resetObject.green = green;
  resetObject.gOffset = gOffset;
  resetObject.blue = blue;
  resetObject.bOffset = bOffset;
}

void resetParameters() {
  worms = new ArrayList<Worm>();

  x = resetObject.x;
  y = resetObject.y;
  maxSpeed = resetObject.maxSpeed;
  birthAge = resetObject.birthAge;
  offset = resetObject.offset;
  filling = resetObject.filling;
  
  red = resetObject.red;
  rOffset = resetObject.rOffset;
  green = resetObject.green;
  gOffset = resetObject.gOffset;
  blue = resetObject.blue;
  bOffset = resetObject.bOffset;

  int rNoise = int(map(noise(red), 0, 1, 0, 255));
  int gNoise = int(map(noise(green), 0, 1, 0, 255));
  int bNoise = int(map(noise(blue), 0, 1, 0, 255));

  w = new Worm(width/2, height/2, maxSpeed, birthAge, offset, filling, rNoise, gNoise, bNoise);
  worms.add(w);
}
