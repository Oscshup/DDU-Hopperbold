class Mover {
  PVector location ;
  PVector velocity;
  PVector acceleration;
  float mass;





  void update() {
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
    fill(0); 
    ellipse(location.x, location.y, mass*3, mass*3);
  }
}
