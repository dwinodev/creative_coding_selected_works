class Wave {
  float _amplitude;
  float _period;
  
  int _r, _g, _b;

  Wave(float amplitude, float period, int r, int g, int b) {
    _amplitude = amplitude;
    _period = period;
    
    _r = r;
    _g = g;
    _b = b;
  }
  
  float calculate(float x) {
    return 0.0;
  }
}

class SinWave extends Wave {
  SinWave(float amplitude, float period, int r, int g, int b) {
    super(amplitude, period, r, g, b);
  }

  float calculate(float x) {
    return sin(x / _period) * _amplitude;
  }
}

class CosWave extends Wave {
  CosWave(float amplitude, float period, int r, int g, int b) {
    super(amplitude, period, r, g, b);
  }

  float calculate(float x) {
    return cos(x / _period) * _amplitude;
  }
}

class TanWave extends Wave {
  TanWave(float amplitude, float period, int r, int g, int b) {
    super(amplitude, period, r, g, b);
  }

  float calculate(float x) {
    return tan(x / _period) * _amplitude;
  }
}
