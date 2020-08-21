class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float scl = 20;


  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0.94);
  }

  void checkEdges() {
    if (location.x > width-mass||location.x < mass) { 
      velocity.x *= -1;
    }
    if (location.y > height-mass||location.y < mass) { 
      velocity.y *= -1;
    }
  }


  void display() {
    noStroke();
    fill(150);
    ellipse(location.x, location.y, scl, scl);
  }

  void BackGround() {
    for (int i = 0; i < 10; i++) {
      ellipse(random(0, 800), random(700, 800), 60, 60);
    }
  }
}
