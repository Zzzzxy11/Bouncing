ArrayList<Ball> balls;

void setup() {
  size(600, 600);
  ellipseMode(RADIUS);
  balls = new ArrayList<Ball>();
  createNewBalls(5);  
}

void draw() {
  background(100);


  for (Ball b : balls) {
    b.move();
    b.draw();
  }
}


void mousePressed() {
  createNewBalls(3);
}


void createNewBalls(int n) {
  for (int i = 0; i < n; i++) {
    balls.add(new Ball());
  }
}


class Ball {
  float x, y;  
  float dx, dy; 
  float r;    
  color c;     

  
  Ball() {
    this.x = width/2;
    this.y = height/2;
    this.dx = random(-4, 4);
    this.dy = random(-4, 4);
    this.r = random(10, 40);
    this.c = color(int(random(256)), int(random(256)), int(random(256)));
  }

  
  void move() {
    x += dx;
    y += dy;

    
    if (x<r|x> width-r) {
      dx = -dx;
    }
    
    if (y<r|y > height-r) {
      dy = -dy;
    }
  }

  
  void draw() {
    fill(c);
    noStroke();
    circle(x, y, r);
  }
}
