ArrayList<Ball> balls;
int maxBalls = 10;  

void setup() {
  size(600, 600);
  ellipseMode(RADIUS);
  balls = new ArrayList<Ball>();
  for (int i = 0; i < 5; i++) {
    balls.add(new Ball(random(width), random(height)));
  }
}

void draw() {
  background(200);

  for (Ball b : balls) {
    b.update();
    b.draw();
  }

  for (int i = 0; i < balls.size(); i++) {
    for (int j = i+1; j < balls.size(); j++) {
      balls.get(i).bounce(balls.get(j));
    }
  }
}

void mousePressed() {
  balls.add(new Ball(mouseX, mouseY));
  if (balls.size() > maxBalls) {
    balls.remove(0); 
  }
}

class Ball {
  float x, y;
  float dx, dy;
  float r;
  color c;

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
    if (x - r < 0 || x + r > width) dx = -dx;
    if (y - r < 0 || y + r > height) dy = -dy;
  }

  void draw() {
    fill(c);
    noStroke();
    circle(x, y, r);
  }

  void bounce(Ball other) {
    float d = dist(x, y, other.x, other.y);
    if (d < r + other.r) {
      float tempDx = dx;
      dx = other.dx;
      other.dx = tempDx;

      float tempDy = dy;
      dy = other.dy;
      other.dy = tempDy;
    }
  }
}
