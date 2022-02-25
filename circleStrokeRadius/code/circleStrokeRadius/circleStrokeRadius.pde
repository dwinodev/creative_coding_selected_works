// PARAMETERS

//// radius
float radius = 400;
int radiusDeviation = 0;

//// angle
float angle = 0.0;
float angleVelocity = 0.00031;
float angleAcceleration = 0;

//// rgb values and offsets for perlin noise variation
//// - Offset determines the variation between radii;
//// - Quickoffset determines the variation inside one radius;
float r = 0;
float rOffset = 0;
float rQuickOffset = 0;
float g = 10000;
float gOffset = 0.05;
float gQuickOffset = 0.00005;
float b = 1000000;
float bOffset = 0;
float bQuickOffset = 0;

ParamObject resetObject;

void setup() {
  size(1000, 1000);
  background(255);
  prepareResetObject();
}

void draw() {
  if (resetObject.record) {
    saveFrame("output/gif/gif-######.png");
  }

  translate(width/2, height/2);

  int currentRadius = int(radiusDeviation * randomGaussian() + radius);

  for ( int i = 0; i <= currentRadius; i += 1) {
    int x = int(i * cos(angle)) + width/2;
    int y = int(i * sin(angle)) + height/2;

    int rNoise = int(map(noise(r), 0, 1, 0, 255));
    int gNoise = int(map(noise(g), 0, 1, 0, 255));
    int bNoise = int(map(noise(b), 0, 1, 0, 255));

    color colori = color(rNoise, gNoise, bNoise);

    set(x, y, colori);

    // quicker
    r += rQuickOffset;
    g += gQuickOffset;
    b += bQuickOffset;
  }

  angleVelocity += angleAcceleration;
  angle += angleVelocity;

  r += rOffset;
  g += gOffset;
  b += bOffset;
}

void keyPressed() {
  if (key == 'r') {
    background(255);
    resetParameters();
    resetObject.record = true;
  } else if ( key == 's') {
        saveFrame("output/screenshots/######.png");
  }
}

void prepareResetObject() {

  resetObject = new ParamObject();

  //// radius
  resetObject.radius = radius;
  resetObject.radiusDeviation = radiusDeviation;

  //// angle
  resetObject.angle = angle;
  resetObject.angleVelocity = angleVelocity;
  resetObject.angleAcceleration = angleAcceleration;

  //// rgb values and offsets for perlin noise variation
  //// - Offset determines the variation between radii;
  //// - Quickoffset determines the variation inside one radius;
  resetObject.r = r;
  resetObject.rOffset = rOffset;
  resetObject.rQuickOffset = rQuickOffset;
  resetObject.g = g;
  resetObject.gOffset = gOffset;
  resetObject.gQuickOffset = gQuickOffset;
  resetObject.b = b;
  resetObject.bOffset = bOffset;
  resetObject.bQuickOffset = bQuickOffset;
}

void resetParameters() {

  //// radius
  radius = resetObject.radius;
  radiusDeviation = resetObject.radiusDeviation;

  //// angle
  angle = resetObject.angle;
  angleVelocity = resetObject.angleVelocity;
  angleAcceleration = resetObject.angleAcceleration;

  //// rgb values and offsets for perlin noise variation
  //// - Offset determines the variation between radii;
  //// - Quickoffset determines the variation inside one radius;
  r = resetObject.r;
  rOffset = resetObject.rOffset;
  rQuickOffset = resetObject.rQuickOffset;
  g = resetObject.g;
  gOffset = resetObject.gOffset;
  gQuickOffset = resetObject.gQuickOffset;
  b = resetObject.b;
  bOffset = resetObject.bOffset;
  bQuickOffset = resetObject.bQuickOffset;
}
