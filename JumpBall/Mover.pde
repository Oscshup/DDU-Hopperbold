class Mover {
  PVector location = new PVector(10,10);
  PVector velocity = new PVector(1, 0);
  PVector acceleration = new PVector(0, 1);
  float mass;


  void applyForce(PVector force) {
       PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }

  void mover() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void checkEdges() {
    if (location.x > width-mass*3/2) { 
      velocity.x *= -1;
    } else if (location.x < mass*3/2) { 
      velocity.x *= -1;
    }
    if (location.y > height-mass*3/2) { 
      velocity.y *= -1;
    } else if (location.y < mass*3/2) { 
      velocity.y *= -1;
    }
  }

  void display() {
    noStroke(); 
    fill(100, 100, 100); 
    ellipse(location.x, location.y, 20, 20);
  }
}
