Mover move = new Mover();

void setup() {
  size(800, 800);
  frameRate(60);
}


void draw() {
  background(255);
  move.mover();
  move.checkEdges();
  move.display();
}
