/*
Economies of Scale
 */
button b; 

void setup() {
  size(800, 600);
  b = new button(50, 50, "Make stone hammers");
}

void draw() {
  background(255);
  b.update();
}
