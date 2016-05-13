ArrayList lines = new ArrayList();
PVector last = new PVector();
void setup() {
  size(600, 600);
  background(30);
  stroke(255);
  noLoop();
}

void draw() {
  PVector l1 = new PVector(100, 300);
  PVector l2 = new PVector(200, 150);
  PVector l3 = new PVector(400, 150);
  PVector l4 = new PVector(500, 300);
  PVector l5 = new PVector(400, 450);
  PVector l6 = new PVector(200, 450);
 
 int num = 4;
  transf(l1, l2, num);
  transf(l2, l3, num);
  transf(l3, l4, num);
  transf(l4, l5, num);
  transf(l5, l6, num);
  transf(l6, l1, num);
   
}

PVector vertex(PVector p1, PVector p2) {
  float s60 = sin(60 * PI / 180.0);    
  float c60 = cos(60 * PI / 180.0);
  float a = c60 * (p1.x - p2.x) - s60 * (p1.y - p2.y) + p2.x;
  float b = s60 * (p1.x - p2.x) + c60 * (p1.y - p2.y) + p2.y;
  return new PVector(a, b);
}

void transf(PVector l1, PVector l2, int level) {

  if (level!=0) {

    level--;

    //LINE 1
    float x1 = l1.x+((l2.x - l1.x)/3f);
    float y1 = l1.y- (l1.y-l2.y)/3;
    transf(l1, new PVector(x1, y1), level); //OK!

    //LINE 2
    float x2 = l1.x+2*(l2.x - l1.x)/3;
    float y2 = l1.y- 2*(l1.y-l2.y)/3;
    PVector pico = vertex(new PVector(x1, y1), new PVector(x2, y2));
    transf(new PVector(x1, y1), pico, level);

    //LINE 3
    float x3 = l1.x+2*(l2.x - l1.x)/3;
    float y3= l1.y- 2*(l1.y-l2.y)/3;
    transf(pico, new PVector(x3, y3), level);

    //LINE 4
    transf(new PVector(x3, y3), l2, level); //OK!


    if (level==0) {
      line(l1.x, l1.y, x1, y1);
      line(x1, y1, pico.x, pico.y);
      line(pico.x, pico.y, x3, y3);
      line(x3, y3, l2.x, l2.y);
    }
  }
  
}