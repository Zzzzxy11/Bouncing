ArrayList<Ball> balls;

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
    for (int j = i + 1; j < balls.size(); j++) {
      balls.get(i).bounce(balls.get(j));
    }
  }
}

void mousePressed() {
  for (Ball b : balls) {
    if (b.isHit(mouseX, mouseY)) {
      b.respawn();  
    }
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
    if (x - r < 0 || x + r > width) dx *= -1;
    if (y - r < 0 || y + r > height) dy *= -1;
  }

  void draw() {
    fill(c);
    noStroke();
    circle(x, y, r);
  }

  void bounce(Ball other) {
    float d = dist(x, y, other.x, other.y);
    if (d < r + other.r) {

      float overlap = 0.5 * (r + other.r - d);
      float angle = atan2(other.y - y, other.x - x);
      x -= overlap * cos(angle);
      y -= overlap * sin(angle);
      other.x += overlap * cos(angle);
      other.y += overlap * sin(angle);

  
      float tempDx = dx;
      float tempDy = dy;
      dx = other.dx;
      dy = other.dy;
      other.dx = tempDx;
      other.dy = tempDy;
    }
  }

  boolean isHit(float mx, float my) {
    return dist(mx, my, x, y) <= r;
  }

  void respawn() {
    x = random(r, width - r);
    y = random(r, height - r);
    dx = random(-4, 4);
    dy = random(-4, 4);
    c = color(int(random(256)), int(random(256)), int(random(256)));
  }
}
