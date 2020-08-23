class Ground {
  float x1, y1, x2, y2;  
  float x, y, len, rot;
  int dirt;

  // Constructor
  Ground(float x1, float y1, float x2, float y2, int d) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    x = (x1+x2)/2;
    y = (y1+y2)/2;
    len = dist(x1, y1, x2, y2);
    rot = atan2((y2-y1), (x2-x1));
    dirt = d;
  }
  
  void hills(){
  
  fill(#9b7653);
  beginShape();
  for (int i=0; i<dirt; i++) {
    vertex(ground[i].x1, ground[i].y1);
    vertex(ground[i].x2, ground[i].y2);
  }
  vertex(ground[dirt-1].x2, height);
  vertex(ground[0].x1, height);
  endShape(CLOSE);
  }
  
}
