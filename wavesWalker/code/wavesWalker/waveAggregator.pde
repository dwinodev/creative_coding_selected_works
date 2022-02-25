class WaveAggregator {
  ArrayList<Wave> waves;

  WaveAggregator() {
    waves = new ArrayList<Wave>();
  }

  void addWave(Wave w) {
    waves.add(w);
  }

  float calculate(float x) {
    float fX = 0.0;

    for ( Wave wave : waves) {
      fX += wave.calculate(x);
    }

    return fX;
  }
}
