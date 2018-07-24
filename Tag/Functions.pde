void scoreBoard() {
  fill(120);
  stroke(120);
  rect(0, 0, width, scoreBarHeight);
  fill(player1SetColor);
  textSize(15);
  textAlign(LEFT);
  text("Player 1 Score: " + round(player1.score/60), 5, 15);
  fill(player2SetColor);
  text("Player 2 Score: " + round(player2.score/60), 5, 40);
  fill(255);
  textAlign(CENTER);
  text("Reset Game", width - 50, scoreBarHeight/2);
}

boolean overRect(int x1, int y1, int x2, int y2) {
  if (dist(x1, y1, x2, y2) <= radius*2) {
    return true;
  } else {
    return false;
  }
}

void beginGame() {

  textAlign(CENTER);
  fill(0);
  textSize(15);
  text("The red player is 'it', first player to "+ endScore + " points wins.", width/2, height/2);
  text("Player 1 uses WASD  -  Player 2 uses arrows", width/2, height/2 + 17);
  rectMode(CENTER);
  fill(80);
  stroke(80);
  rect(width/2, height/2 + 35, 90, 20);
  fill(255);
  textSize(12);
  text("Click To Begin", width/2, height/2 + 40);
  rectMode(CORNER);
  player1.score = 0;
  player2.score = 0;
  player1.playerX = player1X;
  player1.playerY = player1Y;
  player2.playerX = player2X;
  player2.playerY = player2Y;
  player1.radius = radius;
  player2.radius = radius;
  gameOver = false;
}

void endGame() {
  player1.radius = 0;
  player2.radius = 0;
  fill(0);
  text(whoWon() + " Wins!", width/2,height/2);
  gameOver = true;
}

String whoWon() {
  if (player1.score >= endScore*60) {
    return "Player 1";
  } else {
    return "Player 2";
  }
} 
