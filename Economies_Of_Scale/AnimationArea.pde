float animationTopX, animationTopY, animationBottomX, animationBottomY;

class animationArea {
  PImage huts = loadImage("TribalHuts.png");
  PImage background = loadImage("Background.jpg");
  animationArea(float x1, float y1, float x2, float y2) {
    animationTopX = x1;
    animationTopY = y1;
    animationBottomX = x2;
    animationBottomY = y2;
  }
  void display() {
    rectMode(CORNER);
    //fill(0, 0, 100);
    //rect(animationTopX, animationTopY, animationBottomX, animationBottomY);
    image(background, animationTopX, animationTopY, animationBottomX, animationBottomY);
    image(huts, animationBottomX/4, animationBottomY/4, huts.width/2.5, huts.width/2.5);
  }
}
