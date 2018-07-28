player p1;
PVector p1Position = new PVector(50, 50);
PVector movement = new PVector(20, 0);
PVector movementB = new PVector(-20, 0);
PVector gravity = new PVector(0, .5);
PVector jump = new PVector(0, -2);

void setup() {
  size(800, 600);
  p1 = new player(p1Position, 10);
}

void draw() {
  background(255);
  p1.update();
  p1.applyYForce(gravity);
}

void keyPressed() {
  if (key == 'a') {
    p1.velocityX = movementB;
  }
  if (key == 'd') {
    p1.velocityX = movement;
  }
  if (key == ' ') {
    p1.applyYForce(jump);
  }
}
