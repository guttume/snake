class Food {

  PVector location;

  Food() {
    pickLocation();
  }

  void display() {
    noStroke();
    fill(255, 255, 0);
    rect(location.x, location.y, scale, scale);
  }

  void pickLocation() {
    location = new PVector(floor(random(cols)), floor(random(3, rows)));
    location.mult(scale);
  }
}
