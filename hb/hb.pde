//avriables
float mass;
int quantityBall = 6;


Mover[] move = new Mover[quantityBall];



void setup() {
  size(800, 800);
  frameRate(30);

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
      if (b1.hit(b2) ) {

        //Bestem afstanden
        float distance = b1.location.dist(b2.location);
        //Hvor meget er de over hinanden?
        float  overlap = 0.5 * (distance - b1.d - b2.d);
        //flytter bolden væk fra hinanden 
        float dx =  overlap * (b1.location.x - b2.location.x) / distance;
        float dy = overlap * (b1.location.y - b2.location.y) / distance;

        b1.location.x -= dx ;
        b1.location.y -= dy;

        b2.location.x += dx ;
        b2.location.y += dy;


        PVector b1coordinate = b1.location.copy();
        PVector b2coordinate = b2.location.copy();


        //Find vektoren mellem de to kolliderende kugler som svarer til cirkelbue på kontaktfladen
        PVector cirkelbue = b1coordinate.sub(b2coordinate).normalize();

        //Find tangenten til de to cirkler
        PVector tangent = new PVector(-cirkelbue.y, cirkelbue.x);

        //Dette skal hjælpe med opdel begge hastigheder i x og y retning ved at prikke vektorerne med cirkelbue og tangenten.
        //cirkelbue er den vigtig, idet det forventes at kuglerne beholder tangenthastigheden. Så dette er formel til at give hastighed til cirkel når de rammer hinanden
        float dpTan1 = b1.velocity.x * tangent.x + b1.velocity.y * tangent.y; 
        float dpTan2 = b2.velocity.x * tangent.x + b2.velocity.y * tangent.y;
        float dpNorm1 = b1.velocity.x * cirkelbue.x + b1.velocity.y * cirkelbue.y; 
        float dpNorm2 = b2.velocity.x * cirkelbue.x + b2.velocity.y * cirkelbue.y;

        //Nu kan vi bruge formel 
        float v1 = ((b1.masse - b2.masse) * dpNorm1 + 2.0f * b2.masse * dpNorm2) / (b1.masse + b2.masse);
        float v2 = (2 * b1.masse * dpNorm1 + (b2.masse - b1.masse) * dpNorm2) / (b1.masse + b2.masse);

        b1.velocity.x = tangent.x * dpTan1 + cirkelbue.x * v1;
        b1.velocity.y = tangent.y * dpTan1 + cirkelbue.y * v1;

        b2.velocity.x = tangent.x * dpTan2 + cirkelbue.x * v2;
        b2.velocity.y = tangent.y * dpTan2 + cirkelbue.y * v2;
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
}


void keyPressed() { 
  if (key == 'r') {
    frameCount = -1;
  }
}
