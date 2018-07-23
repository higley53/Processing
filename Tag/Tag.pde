boolean[] player1Keys = new boolean[4];
boolean[] player2Keys = new boolean[4];

int scoreBarHeight = 50;

int player1MoveBy = 3;
int player2MoveBy = 3;
boolean offShape = true;
boolean gameStarted = false;
boolean gameOver = false;

int endScore = 40;

int radius = 12;
color player1Color;
color player2Color;

color player1SetColor = color(0, 250, 0);
color player2SetColor = color(0, 250, 250);

color backgroundColor = color(255);

int player1X;
int player1Y;
int player2X;
int player2Y;

players player1; 
players player2;

void setup() {
  size(600, 400);

  player2X = width - radius * 2;
  player2Y = height - radius * 2;

  player1X = radius * 2;
  player1Y = scoreBarHeight + radius * 2 + 3;

  if (random(2) >= 1) {
    player1Color = color(255, 0, 0);
    player2Color = color(30, 0, 0);
  } else {
    player2Color = color(255, 0, 0);
    player1Color = color(30, 0, 0);
  }
  player1 = new players(player1X, player1Y, radius, player1Color, player1SetColor, player1Keys, player1MoveBy);

  player2 = new players(player2X, player2Y, radius, player2Color, player2SetColor, player2Keys, player2MoveBy);

  beginGame();

  for (int i = 0; i < player1Keys.length; i++)
  {
    player1.movingKeys[i] = false;
    player2.movingKeys[i] = false;
  }
}

void draw() {

  background(backgroundColor);

  player1.display();
  player2.display();

  scoreBoard();

  if (gameStarted) {
    if (overRect(player1.playerX, player1.playerY, player2.playerX, player2.playerY)) {

      if (offShape) {
        offShape = false; 
        if (player1.drawingColor == (color(255, 0, 0)))
        {
          player1.drawingColor = color(30, 0, 0);
          player2.drawingColor = color(255, 0, 0);
          player2.tagged();
        } else {
          player1.drawingColor = color(255, 0, 0);
          player2.drawingColor = color(30, 0, 0);
          player1.tagged();
        }
      }
    } else {
      offShape = true;
    }
    player1.moving();
    player2.moving();
  } else {
    beginGame();
  }
  if(player1.score >= endScore*60 || player2.score >= endScore*60) {
    endGame();
  }
}


void keyPressed() {
  if (key == 'a')
  {
    player1. movingKeys[0] = true;
  }       
  if (key == 's')
  {
    player1. movingKeys[1] = true;
  }       
  if (key == 'w')
  {
    player1. movingKeys[2] = true;
  }       
  if (key == 'd')
  {
    player1. movingKeys[3] = true;
  }

  if (keyCode == LEFT)
  {
    player2. movingKeys[0] = true;
  }      
  if (keyCode == DOWN)
  {
    player2. movingKeys[1] = true;
  }       
  if (keyCode == UP)
  {
    player2. movingKeys[2] = true;
  }       
  if (keyCode == RIGHT)
  {
    player2. movingKeys[3] = true;
  }
}

void keyReleased()
{
  if (key == 'a')
  {
    player1. movingKeys[0] = false;
  }      
  if (key == 's')
  {
    player1. movingKeys[1] = false;
  }       
  if (key == 'w')
  {
    player1. movingKeys[2] = false;
  }       
  if (key == 'd')
  {
    player1. movingKeys[3] = false;
  }

  if (keyCode == LEFT)
  {
    player2. movingKeys[0] = false;
  }      
  if (keyCode == DOWN)
  {
    player2. movingKeys[1] = false;
  }       
  if (keyCode == UP)
  {
    player2. movingKeys[2] = false;
  }       
  if (keyCode == RIGHT)
  {
    player2. movingKeys[3] = false;
  }
}

void mousePressed() {
  if (mouseX >= (width/2) - 45 && mouseX <= (width/2) + 45 && mouseY >= height/2 + 20 && mouseY <= height/2 + 60 && !gameStarted)
  {
    gameStarted = true;
  }

  if (mouseX >= width - 95 && mouseX <= width - 5 && mouseY >= (scoreBarHeight/2) - 7 && mouseY <= (scoreBarHeight/2) + 7 && gameStarted) {
    gameStarted = false;
    if (random(2) >= 1) {
      player1.drawingColor = color(255, 0, 0);
      player2.drawingColor = color(30, 0, 0);
    } else {
      player2.drawingColor = color(255, 0, 0);
      player1.drawingColor = color(30, 0, 0);
    }
  }
}
