// speel met life, birthage, maxspeed, birthage reset, noiseoffset ....

class Worm {
  ArrayList<PVector> tail = new ArrayList<PVector>();

  PVector _position;
  PVector _velocity;
  PVector _acceleration;

  float _maxSpeed;

  float _tx, _ty, _offset;

  int _life;
  int _birthAge;

  int _filling;
  boolean _dying;

  int _r, _g, _b;


  Worm(float x, float y, float maxSpeed, int birthAge, float offset, int filling, int r, int g, int b) {
    _acceleration = new PVector(0, 0);
    _velocity = new PVector(0, 0);
    _position = new PVector(x, y);
    _maxSpeed = maxSpeed;
    _tx = 0;
    _ty = 10000;
    _offset = offset;
    _life = 0;
    _birthAge = birthAge;
    _filling = filling;
    _dying = false;

    _r = r;
    _g = g;
    _b = b;
  }

  void run(int r, int g, int b) {
    update(r, g, b);
    display();
  }

  // Method to update position
  void update(int r, int g, int b) {
    // Update velocity
    _velocity.add(_acceleration);
    // Limit speed
    _velocity.limit(_maxSpeed);
    _position.add(_velocity);
    // Reset accelertion to 0 each cycle
    _acceleration.mult(0);

    tail.add(_position.copy());
    _life++;
    if (_life == birthAge) {
      Worm w = new Worm(_position.x, _position.y, _maxSpeed, _birthAge, _offset, _filling, r, g, b);
      worms.add(w);
    }
    if (tail.size() > 50) {
      tail.remove(0);
    }

    float x = map(noise(_tx), 0, 1, -0.5, 0.5);
    float y = map(noise(_ty), 0, 1, -0.5, 0.5);

    PVector noiseForce = new PVector(x, y);
    applyForce(noiseForce);

    _tx += offset;
    _ty += offset;

    if (_dying) {
      fade();
    }
  }

  void boundaries() {


    if (_position.x > width) {
      _position.x = 0;
    } else if (_position.x < 0 ) {
      _position.x = width;
    }

    if (_position.y > height) {
      _position.y = 0;
    } else if (_position.y < 0 ) {
      _position.y = height;
    }
  }


  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    _acceleration.add(force);
  }

  void fade() {
    _filling--;
  }


  void display() {
    for (PVector v : tail) {
      if ( colored ) {
        fill(_r, _g, _b, _filling);
      } else {
        fill(100, _filling);
      }
      noStroke();
      ellipse(v.x, v.y, 7, 7);
    }
  }
}
