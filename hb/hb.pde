//avriables
float mass;
int dirt = 40;


ArrayList<Mover> move = new ArrayList<Mover>();

Ground[] ground = new Ground[dirt];


void setup() {
  size(800, 800);
  frameRate(60);

  //Objects can be added to ArrayList with add()
  move.add(new Mover(random(3, 5), mouseX, mouseY));

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
}



void draw() {
  noStroke();
  background(#87ceeb);

  PVector wind = new PVector(0.7, 0);
  PVector gravity = new PVector(0, 0.1);

  for (Mover m1 : move) {
    for (Mover m2 : move) {
      if (m1.hit(m2)) {
        println("Collision");
      }
    }
  }


  //The objects can be pulled out of an ArrayList with get()
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
    move.get(i).display();
    ground[i].hills();
  }

  
}

//Added more objects form the ArrayList
void mouseClicked() {
  move.add(new Mover(random(1, 5), mouseX, mouseY));
} 

void keyPressed() {
  if (key == 'r' ) {
    println("reset");
    resetdata();
  }
}

void resetdata() {
  smooth();
}
