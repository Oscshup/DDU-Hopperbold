class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float masse;
  float d = 9;
  float life, colorchange;
  float damping = 0.8;


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
    acceleration.mult(0.98);
  }

  void checkEdges() {
    if (location.x + d > width) { 
      location.x = width - d;
      velocity.x *= -1;
    } else if (location.x - d < 0) {
      location.x = d/2;
      velocity.x *= -1;
    }

    if (location.y + d > height) {
      location.y = height - d;
      velocity.y *= -1;
    } else if (location.y - d < 0) {
      location.y = d;
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


  void display() {
    // Display the circle
    fill(colorchange, 100, 0, life);
    noStroke();
    ellipse(location.x, location.y, d*2, d*2);
  }

  void checkGroundCollision(Ground groundSegment) {

    // Get difference between orb and ground
    float deltaX = location.x - groundSegment.x;
    float deltaY = location.y - groundSegment.y;

    // Precalculate trig values
    float cosine = cos(groundSegment.rot);
    float sine = sin(groundSegment.rot);

    /* Rotate ground and velocity to allow 
     orthogonal collision calculations */
    float groundXTemp = cosine * deltaX + sine * deltaY;
    float groundYTemp = cosine * deltaY - sine * deltaX;
    float velocityXTemp = cosine * velocity.x + sine * velocity.y;
    float velocityYTemp = cosine * velocity.y - sine * velocity.x;

    /* Ground collision - check for surface 
     collision and also that orb is within 
     left/rights bounds of ground segment */
    if (groundYTemp > -d &&
      location.x > groundSegment.x1 &&
      location.x < groundSegment.x2 ) {
      // keep orb from going into ground
      groundYTemp = -d;
      // bounce and slow down orb
      velocityYTemp *= -1.0;
      velocityYTemp *= damping;
    }

    // Reset ground, velocity and orb
    deltaX = cosine * groundXTemp - sine * groundYTemp;
    deltaY = cosine * groundYTemp + sine * groundXTemp;
    velocity.x = cosine * velocityXTemp - sine * velocityYTemp;
    velocity.y = cosine * velocityYTemp + sine * velocityXTemp;
    location.x = groundSegment.x + deltaX;
    location.y = groundSegment.y + deltaY;
  }
}
