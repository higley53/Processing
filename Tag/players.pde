class players {

  int playerX = 0; 
  int playerY = 0;
  int radius;
  int wait = 1000;
  boolean tagged = false;
  color drawingColor;
  color playerColor;

  players(int x, int y, int sw, color c, color player) {
    playerX = x;
    playerY = y;
    radius = sw;
    drawingColor = c;
    playerColor = player;
  }

  void move(int xMove, int yMove) {
    if (!tagged) {
      playerX += xMove;
      playerY += yMove;
    }
  }

  void tagged() {
    time =  millis();
    tagged = true;
    while (tagged) {
      if (millis() - time >= wait) {
        tagged = false;
      }
    }
  }
  void display() {
    if (playerX >= width) {
      playerX = 0;
    }
    if (playerX < 0) {
      playerX = width;
    }
    if (playerY >= height) {
      playerY = 0;
    }
    if (playerY < 0) {
      playerY = height;
    }
    fill(drawingColor);
    ellipse(playerX, playerY, radius *2, radius * 2);    
    fill(playerColor);
    triangle(playerX + radius, playerY - radius*2, playerX - radius, playerY - radius*2, playerX, playerY - radius);
  }
}
