class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float r = 30;
  float life, colorchange;


  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    life = 100;
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
    if (location.x + r/2 > width) { 
      location.x = width - r/2;
      velocity.x *= -1;
    } else if (location.x - r/2< 0) {
      velocity.x *= -1;
      location.x = r/2;
    }

    if (location.y + r/2> height) {
      location.y = height ;
      velocity.y *= -1;
    } else if (location.y - r/2 <0) {
      location.y = r/2;
      velocity.y *= -1;
    }
  }

  boolean hit(Mover c) {
    float distance = dist(c.location.x, c.location.y, location.x, location.y);
    float minidistance = c.r + r;

    boolean thesame = (this == c);

    colorchange = 0;

    if (minidistance > distance && !thesame) {
      println("yeah");
      colorchange = 255;
      return(true);
    } 
    return(false);
  }


  boolean finished() {
    // Balls fade out
    life--;
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }


  void display() {
    // Display the circle
    fill(colorchange, 100, 0, life);
    noStroke();
    ellipse(location.x, location.y, r, r);
  }
}
