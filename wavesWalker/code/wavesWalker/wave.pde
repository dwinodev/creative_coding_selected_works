class Wave {
  float _amplitude;
  float _period;

  Wave(float amplitude, float period) {
    _amplitude = amplitude;
    _period = period;
  }
  
  float calculate(float x) {
    return 0.0;
  }
}

class SinWave extends Wave {
  SinWave(float amplitude, float period) {
    super(amplitude, period);
  }

  float calculate(float x) {
    return sin(x / _period) * _amplitude;
  }
}

class CosWave extends Wave {
  CosWave(float amplitude, float period) {
    super(amplitude, period);
  }

  float calculate(float x) {
    return cos(x / _period) * _amplitude;
  }
}

class TanWave extends Wave {
  TanWave(float amplitude, float period) {
    super(amplitude, period);
  }

  float calculate(float x) {
    return tan(x / _period) * _amplitude;
  }
}
