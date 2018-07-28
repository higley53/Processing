PVector gravity;
PVector wind;
PVector lift;
float AIRRES = .01;
float radius = 10;
mover[] movers;

void setup() {
  size(400, 400);
  movers = new mover[5];
  for (int i = 0; i < movers.length; i++) {
    PVector pos = new PVector(random(15, width - 15), random(15, height-15));
    mover m = new mover(random(.5, 4), pos);
    movers[i] = m;
  }
  gravity = new PVector(0, 1);
  wind = new PVector(.3, 0);
  lift = new PVector(0, -3);
}

void draw() {
  background(255);
  for (mover m : movers) {
    m.update();
    m.applyForce(gravity);
    PVector airRes = m.velocity.get();
    airRes.normalize();
    airRes.mult(-AIRRES);
    m.applyForce(airRes);
  }
}

void keyPressed() {

  for (mover m : movers) {
    if (key == 'd')
    {
      m.applyForce(wind);
    }

    if (key == 'a')
    {
      wind.mult(-1);
      m.applyForce(wind);
      wind.mult(-1);
    }

    if (key == 'w')
    {
      m.applyForce(lift);
    }
  }
}  
