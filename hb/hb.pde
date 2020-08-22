ArrayList<Mover> move;
float mass;
float c = 255;

void setup() {
  size(800, 800);
  frameRate(60);

  move = new ArrayList<Mover>();

  move.add(new Mover(random(3, 5), mouseX, mouseY));
  
  
  draw();
}


void draw() {
  noStroke();
 //background(c);

  PVector wind = new PVector(0.7, 0);
  PVector gravity = new PVector(0, 0.1);

  for (Mover m1 : move) {
    for (Mover m2 : move) {
      if (m1.hit(m2)) {
        println("Collision");
      }
    }
  }



  for (int i = 0; i < move.size(); i++) {

    if (key == 'v') {
      move.get(i).applyForce(wind);

      if (move.get(i).finished()) {
        println("død");
        //move.get(i).remove();
      }
    }
    move.get(i).applyForce(gravity);

    move.get(i).update();
    move.get(i).checkEdges();
    move.get(i).BackGround();
    move.get(i).display();
  }
}

void mouseClicked() {
  move.add(new Mover(random(1, 5), mouseX, mouseY));
} 

void keyPressed() {
  if (key == 'r' ) {
    println("reset");
    resetdata();
  }
}

void resetdata(){
  smooth();
background(c);

}
