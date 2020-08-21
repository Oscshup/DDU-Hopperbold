ArrayList<Mover> move;
float mass;

void setup() {
  size(800, 800);
  frameRate(60);

  move = new ArrayList<Mover>();

  move.add(new Mover(random(3, 5), mouseX, mouseY));
}


void draw() {
  noStroke();
  background(255);

  PVector wind = new PVector(0.7, 0);
  PVector gravity = new PVector(0, 0.1);

  for (Mover m1 : move) {
    for (Mover m2 : move) {
      if (m1.hit(m2)) {
        println("kys");
      }
    }
  }




  for (int i = 0; i < move.size(); i++) {

    if (keyPressed) {
      move.get(i).applyForce(wind);
    }
    move.get(i).applyForce(gravity);

    move.get(i).update();
    move.get(i).checkEdges();

    move.get(i).display();
    move.get(i).BackGround();
  }
}

void mouseClicked() {
  move.add(new Mover(random(1, 5), mouseX, mouseY));
} 
