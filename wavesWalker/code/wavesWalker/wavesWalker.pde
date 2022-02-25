float x = 0;
float y = 15;
WaveAggregator wA;

float r = 0;
float rOffset = 0.005;
float g = 10000;
float gOffset = 0.005;
float b = 1000000;
float bOffset = 0.005;

void setup() {
  size(800, 800);
  background(0);

  wA = new WaveAggregator();
  wA.addWave(new SinWave( -55, 0.5));
  wA.addWave(new CosWave( -40, 3));
  wA.addWave(new SinWave( 10, 0.09));
  wA.addWave(new CosWave( 20, 2.5));
  wA.addWave(new TanWave( 10, 50));
  wA.addWave(new TanWave( -50, -10));
}

void draw() {
  //background(0);

  saveFrame("output/gif/gif-######.png");


  int rNoise = int(map(noise(r), 0, 1, 0, 255));
  int gNoise = int(map(noise(g), 0, 1, 0, 255));
  int bNoise = int(map(noise(b), 0, 1, 0, 255));


  translate(width/2, height/2);
  fill(rNoise, gNoise, bNoise);
  noStroke();
  ellipse(wA.calculate(x), wA.calculate(y), 5, 5);

  x += 0.01;
  y -= 0.01;

  r += rOffset;
  g += gOffset;
  b += bOffset;
}
