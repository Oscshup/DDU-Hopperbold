class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass = 10;
  
  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    
  }

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
    if (location.x > width-mass) { 
      velocity.x *= -1;
    } else if (location.x < mass) { 
      velocity.x *= -1;
    }
    if (location.y > height-mass) { 
      velocity.y *= -1;
    } else if (location.y < mass) { 
      velocity.y *= -1;
    }
  }

  void display() {
    noStroke(); 
    fill(100, 100, 100); 
    ellipse(location.x, location.y, 20, 20);
  }
}
