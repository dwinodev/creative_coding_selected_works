float x = 0;

WaveAggregator wA;

void setup() {
  size(800, 800);
  background(0);

  wA = new WaveAggregator();
  wA.addWave(new SinWave( 30, 2.5, 255, 0, 0));
  wA.addWave(new CosWave( 15, 5, 0, 255, 0));
  wA.addWave(new TanWave( 5, 30, 0, 0, 255));
  //wA.addWave(new CosWave( 10, 25));
}

void draw() {
  saveFrame("output/gif/gif-######.png");

  noStroke();

  int yOffset = 1;
  for (Wave w : wA.waves) {
    float y = w.calculate(x);
    if (y < 50 && y > -50) {
      fill(w._r, w._g, w._b);
      ellipse(x, w.calculate(x) + height/12 * yOffset, 4, 4);
    }
    yOffset += 2.5;
  }
  float y = wA.calculate(x);
  if (y < 50 && y > -50) {
    fill(255);
    ellipse(x, y + (height/12) * yOffset, 4, 4);
  }

  x += 0.1;
}
