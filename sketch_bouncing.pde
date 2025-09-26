Ball b1, b2, b3;

void setup() {
  size(600, 600);
  ellipseMode(RADIUS);
  createNewBalls();
}

void draw() {
  background(100);

  b1.update();
  b2.update();
  b3.update();
}

void mousePressed() {
  createNewBalls();
}

void createNewBalls() {
  b1 = new Ball(width/2, height/2, random(10, 40));
  b2 = new Ball(width/2, height/2, random(10, 40));
  b3 = new Ball(width/2, height/2, random(10, 40));
}

class Ball {
  float x, y;
  float dx, dy;
  float r;
  color c;

  Ball(float startX, float startY, float radius) {
    x = startX;
    y = startY;
    r = radius;
    dx = random(-4, 4);
    dy = random(-4, 4);
    c = color(int(random(256)), int(random(256)), int(random(256)));
  }

  void update() {
    move();
    keepInBounds();
    draw();
  }

  void move() {
    x += dx;
    y += dy;
  }

  void draw() {
    fill(c);
    noStroke();
    circle(x, y, r);
  }

  void keepInBounds() {
    if (x - r < 0) dx = -dx;        
    if (x + r > width) dx = -dx;   
    if (y - r < 0) dy = -dy;        
    if (y + r > height) dy = -dy;  
  }
}
