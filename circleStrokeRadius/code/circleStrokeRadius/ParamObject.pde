class ParamObject {
  
  boolean record = false;

  //// radius
  float radius;
  int radiusDeviation;

  //// angle
  float angle;
  float angleVelocity;
  float angleAcceleration;

  //// rgb values and offsets for perlin noise variation
  //// - Offset determines the variation between radii;
  //// - Quickoffset determines the variation inside one radius;
  float r;
  float rOffset;
  float rQuickOffset;
  float g;
  float gOffset;
  float gQuickOffset;
  float b;
  float bOffset;
  float bQuickOffset;
}
