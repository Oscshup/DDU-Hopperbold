Mover[] move = new Mover[10];
float mass;

void setup() {
  size(800, 800);
  frameRate(60);

  for (int i = 0; i < move.length; i++) {
    move[i] = new Mover(random(0.1, 5), random(width), random(height));
  }
}


void draw() {
  background(255);
  for (int i = 0; i < move.length; i++) {
    PVector wind = new PVector(0.1, 0);
    PVector gravity = new PVector(0, 0.1);
    if (mousePressed) {
      move[i].applyForce(wind);
    }
    move[i].applyForce(gravity);
    move[i].mover();
    move[i].checkEdges();
    move[i].display();
  }
}
