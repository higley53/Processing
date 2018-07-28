class mover {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass = 1;
  mover(float m, PVector p) {
    mass = m;
    position = p;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  void update() {
    fill(0);
    ellipse(position.x, position.y, mass*10, mass*10);
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);

    //if (position.x >= width) {
    //  position.x = 0;
    //}
    //if (position.y >= height) {
    //  position.y = 0;
    //}
    //if (position.x < 0) {
    //  position.x = width;
    //}
    //if (position.y < 0) {
    //  position.y = height;
    //}

    if (position.x > width) {
      position.x = width;
      velocity.x *= -1;
    } else if (position.x < 0) {
      velocity.x *= -1;
      position.x = 0;
    }

    if (position.y > height) {
      velocity.y *= -1;
      position.y = height;
    } else if (position.y < 0) {
      velocity.y *= -1;
      position.y = 0;
    }
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass); 
    acceleration.add(f);
  }
}
