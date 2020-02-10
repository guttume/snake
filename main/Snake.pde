class Snake {

  PVector location;
  PVector velocity;

  ArrayList<PVector> tails = new ArrayList<PVector>();
  int total = 0;

  int speed = scale;

  Snake() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(1, 0);
  }

  void update() {

    if (total > 0) {
      if (total == tails.size() && !tails.isEmpty()) {
        tails.remove(0);
      }
      tails.add(new PVector(location.x, location.y));
    }


    velocity.mult(speed);
    location.add(velocity);
    velocity.normalize();
  }

  void display() {
    noStroke();
    fill(255);
    for (PVector v : tails) {
      rect(v.x, v.y, scale, scale);
    }
    rect(location.x, location.y, scale, scale);
  }

  void changeDirection(float angle) {
    velocity = PVector.fromAngle(angle);
  }

  boolean eats(Food food) {

    if (dist(location.x, location.y, food.location.x, food.location.y) < 1) {
      total++;
      return true;
    }

    return false;
  }

  boolean dead() {
    for (int i = 0; i < tails.size(); i++) {
      if (dist(location.x, location.y, tails.get(i).x, tails.get(i).y) < 1) {
        return true;
      }
    }
    return false;
  }

  boolean hitWall() {
    if (location.x + scale > width || location.x < 0 || location.y + scale > height || location.y < 0) {
      return true;
    }

    return false;
  }
}
