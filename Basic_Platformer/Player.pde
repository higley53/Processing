class player {
  PVector position;
  PVector velocityY;
  PVector velocityX;
  PVector accelerationX;
  PVector accelerationY;
  float mass;
  player(PVector p, float m) {
    position = p;
    mass = m;
    velocityX = new PVector(0, 0);
    velocityY = new PVector(0, 0);
    accelerationY = new PVector(0, 0);
    accelerationX = new PVector(0, 0);
  }

  void update() {
    fill(0);
    rect(position.x, position.y, mass*10, mass*10);
    velocityY.add(accelerationY);
    velocityX.add(accelerationX);
    position.add(velocityY);
    position.add(velocityX);
    accelerationY.mult(0);
    accelerationX.mult(0);
  
    velocityY.limit(2);
    velocityX.limit(2);
    
    //System.out.println(velocityX);
    
    if (position.x + mass*10 > width) {
      position.x = width - mass*10;
      //velocity.x *= -1;
    } else if (position.x < 0) {
      //velocity.x *= -1;
      position.x = 0;
    }

    if (position.y + mass*10> height) {
      //velocity.y *= -1;
      position.y = height - mass*10;
    } else if (position.y < 0) {
      //velocity.y *= -1;
      position.y = 0;
    }
  }

  void applyYForce(PVector force) {
    PVector f = PVector.div(force, mass); 
    accelerationY.add(f);
  }
  
  void applyXForce(PVector force) {
    PVector f = PVector.div(force, mass); 
    accelerationX.add(f);
  }
}
