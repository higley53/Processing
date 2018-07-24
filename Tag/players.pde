class players {

  int playerX = 0; 
  int playerY = 0;
  int radius;
  int wait = 1000;
  int time = 0;
  boolean tagged = false;
  color drawingColor;
  color playerColor;
  boolean[] movingKeys;
  int moveBy = 3;
  float score = 0;; 
  boolean boosted = false;

  players(int x, int y, int sw, color c, color player, boolean[] k, int m) {
    playerX = x;
    playerY = y;
    radius = sw;
    drawingColor = c;
    playerColor = player;
    movingKeys = k;
    moveBy = m;
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
  }
  void display() {
    if (tagged) {
      if (millis() - time >= wait) {
        tagged = false;
      }
    }
    if (playerX >= width) {
      playerX = 0;
    }
    if (playerX < 0) {
      playerX = width;
    }
    if (playerY >= height) {
      playerY = scoreBarHeight;
    }
    if (playerY < scoreBarHeight) {
      playerY = height;
    }
    fill(drawingColor);
    ellipse(playerX, playerY, radius *2, radius * 2);    
    fill(playerColor);
    triangle(playerX + radius, playerY - radius*2, playerX - radius, playerY - radius*2, playerX, playerY - radius);

    if (drawingColor != color(255, 0, 0) && !gameOver) {
      score = score + 1;
    }
  }

  void moving() {
    if (movingKeys[0])
    {
      move(-moveBy, 0);
    }
    if (movingKeys[1])
    {
      move(0, moveBy);
    }
    if (movingKeys[2])
    {
      move(0, -moveBy);
    }
    if (movingKeys[3])
    {
      move(moveBy, 0);
    }
  }
}
