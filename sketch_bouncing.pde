Ball b1, b2, b3;

void setup() {
  size(600, 600);
  ellipseMode(RADIUS);
  b1 = new Ball(width/2, height/2);
  b2 = new Ball(width/3, height/3);
  b3 = new Ball(width/4*3, height/2);
}

void draw() {
  background(200);
  b1.update();
  b1.draw();
  b2.update();
  b2.draw();
  b3.update();
  b3.draw();
}

void mousePressed() {
  if (b1.isHit(mouseX, mouseY)) {
    b1 = new Ball(mouseX, mouseY);
  } else if (b2.isHit(mouseX, mouseY)) {
    b2 = new Ball(mouseX, mouseY);
  } else if (b3.isHit(mouseX, mouseY)) {
    b3 = new Ball(mouseX, mouseY);
  }
}

class Ball {
  float x, y;
  float dx, dy;
  float r;
  color c;

  Ball() {
    this(width/2, height/2);
  }

  Ball(float startX, float startY) {
    x = startX;
    y = startY;
    r = random(15, 40);
    dx = random(-4, 4);
    dy = random(-4, 4);
    c = color(int(random(256)), int(random(256)), int(random(256)));
  }

  void update() {
    x += dx;
    y += dy;
    keepInBounds();
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

  
  boolean isHit(float mx, float my) {
    return dist(mx, my, x, y) <= r;
  }
}
