class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float masse;
  float d = 25f;
  float life, colorchange;


  Mover(float m, float x, float y) {
    masse = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    life = 100;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, masse);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0.96);
  }

  void checkEdges() {
    if (location.x + d/2 > width) { 
      location.x = width - d/2;
      velocity.x *= -1;
    } else if (location.x - d/2< 0) {
      velocity.x *= -1;
      location.x = d/2;
    }

    if (location.y + d/2> height) {
      location.y = height - d/2;
      velocity.y *= -1;
    } else if (location.y - d/2 <0) {
      location.y = d/2;
      velocity.y *= -1;
    }
  }

  boolean hit(Mover c) {
    float distance = dist(c.location.x, c.location.y, location.x, location.y);
    float minidistance = c.d + d;

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


void hill(){


}

  void display() {
    // Display the circle
    fill(colorchange, 100, 0, life);
    noStroke();
    ellipse(location.x, location.y, d*2, d*2);
  }
}
