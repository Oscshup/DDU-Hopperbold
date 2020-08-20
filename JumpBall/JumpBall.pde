Mover mover = new Mover();



void setup() {
  size(800, 800);
  frameRate(60);
}

void draw() {
  mover.update();
  mover.checkEdges();
  mover.display();
}
