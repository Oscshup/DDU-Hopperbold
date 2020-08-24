//avriables
float mass;
int dirt = 40;
int quantityBall = 10;

Mover[] move = new Mover[quantityBall];
Ground[] ground = new Ground[dirt];


void setup() {
  size(800, 800);
  frameRate(60);

  // Calculate ground peak heights
  float[] groundpeak = new float[dirt+1];
  //This make the ground peak heights between to random nubmber
  for (int i=0; i<groundpeak.length; i++) {
    groundpeak[i] = random(height-130, height-80);
  }

  /* Now we need to make a float value required for dirt width 
   calculations so the ground spans the entire 
   display window, regardless of dirt number.*/
  float d = dirt;
  for (int i=0; i<dirt; i++) {
    ground[i]  = new Ground(width/d*i, groundpeak[i], width/d*(i+1), groundpeak[i+1], dirt);
  }



  //Objects can be added to ArrayList with add()
  for (int i = 0; i < quantityBall; i++) { 
    move[i] = new Mover(random(3, 5), random(100, width-100), random(100, height-300));
  }
}



void draw() {
  noStroke();
  background(#87ceeb);

  PVector wind = new PVector(0.7, 0);
  PVector gravity = new PVector(0, 0.1);

  for (Mover b1 : move) {
    for (Mover b2 : move) {
      if (b1.hit(b2)) {
      }
    }
  }

  for (Mover b : move) {
    if (key == 'v') {
      b.applyForce(wind);

      if (b.finished()) {
        println("død");
      }
    }
    b.applyForce(gravity);
    b.update();
    b.checkEdges();
  }

  for (int i = 0; i < quantityBall; i++) {
    move[i].display();
  } 

  for (Ground g : ground) {
    //g.hills();
  }
}


void keyPressed() { 
  if (key == 'r') {
    frameCount = -1;
  }
}
