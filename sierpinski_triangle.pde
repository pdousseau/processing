int laps = 5;
int out =0;
void setup() {
  size(700, 700);
  noLoop();
}

void draw() {
  background(50, 100, 100);
  noStroke();
  int x=width;
  int y=height;
  
  triangle(x/2, 0, 0, y, x, y);
  tri(x/2, 0, 0, y, x, y, laps);
 
}

void tri(int x1, int y1, int x2, int y2, int x3, int y3, int laps) {

  int z1 = (x1+x2)/2;
  int m1 = (y1+y2)/2;
  int z2 = (x2+x3)/2;
  int m2 = (y2+y3)/2;
  int z3 = (x1+x3)/2;
  int m3 = (y1+y3)/2;

  triangle(z1, m1, z2, m2, z3, m3);

  fill(random(255), 100, 100);
  if (laps>0) {

    laps--;
    tri(x1, y1, z1, m1, z3, m3, laps);
    tri(x2, y2, z2, m2, z1, m1, laps);
    tri(z2, m2, x3, y3, z3, m3, laps);
   
  }
}