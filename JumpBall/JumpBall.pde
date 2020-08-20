Mover[] move = new Mover[100];
float mass;

void setup() {
  size(800, 800);
  frameRate(60);
  
  for (int i = 0; i < move.length; i++) {
    move[i] = new Mover(random(0.1,5),0,0);
  }
  
}


void draw() {
  background(255);
for (int i = 0; i < move.length; i++) {
  PVector wind = new PVector(0.05, 0);
  PVector gravity = new PVector(0, 0.1);
  move[i].applyForce(wind);
  move[i].applyForce(gravity);
  move[i].mover();
  move[i].checkEdges();
  move[i].display();
}}
