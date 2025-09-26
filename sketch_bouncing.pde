Ball b1, b2, b3;

void setup() {
  size(1800, 900);
  ellipseMode(RADIUS);
  createNewBalls();
}

void draw() {
  background(100);
  b1.update();
  b2.update();
  b3.update();
  b1.makeEmBounce(b2);
  b1.makeEmBounce(b3);
  b2.makeEmBounce(b3);
}

void mousePressed() {
  createNewBalls();
}

void createNewBalls() {
  b1 = new Ball(random(width), random(height), random(20, 50));
  b2 = new Ball(random(width), random(height), random(20, 50));
  b3 = new Ball(random(width), random(height), random(20, 50));
}

class Ball {
  float x, y, dx, dy, r;
  color c;

  Ball(float startX, float startY, float radius) {
    this.x = startX;
    this.y = startY;
    this.r = radius;
    this.dx = random(-3, 3);
    this.dy = random(-3, 3);
    this.c = color(int(random(256)), int(random(256)), int(random(256)), int(random(256)));
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
    circle(x, y, r);
  }

  void keepInBounds() {
    if (x - r < 0 || x + r > width) dx *= -1;
    if (y - r < 0 || y + r > height) dy *= -1;
  }

  void makeEmBounce(Ball otherBall) {
    if (dist(x, y, otherBall.x, otherBall.y) < r + otherBall.r) {
      float tempDx = dx;
      dx = otherBall.dx;
      otherBall.dx = tempDx;

      float tempDy = dy;
      dy = otherBall.dy;
      otherBall.dy = tempDy;
    }
  }
}
