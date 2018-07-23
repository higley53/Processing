boolean[] player1Keys = new boolean[4];
boolean[] player2Keys = new boolean[4];

int moveBy = 3;
boolean offShape = true;
int time; 

int player1X = 30;
int player1Y = 30;

int player2X = 70;
int player2Y = 70;

int radius = 12;
color player1Color = color(255, 0, 0);
color player2Color = color(30, 0, 0);

color player1SetColor = color(0, 250, 0);
color player2SetColor = color(0, 250, 250);

color backgroundColor = color(255);

players player1 = new players(player1X, player1Y, radius, player1Color, player1SetColor);

players player2 = new players(player2X, player2Y, radius, player2Color, player2SetColor);


void setup() {
  size(400, 400);

  for (int i = 0; i < player1Keys.length; i++)
  {
    player1Keys[i] = false;
    player2Keys[i] = false;
  }
}

void draw() {
  background(backgroundColor);

  player1.display();
  player2.display();

  if (overRect(player1.playerX, player1.playerY, player2.playerX, player2.playerY)) {

    if (offShape) {
      offShape = false; 
      if (player1.drawingColor == (color(255, 0, 0)))
      {
        player1.drawingColor = color(30, 0, 0);
        player2.drawingColor = color(255, 0, 0);
        player2.tagged();
        System.out.println(2);
      } else {
        player1.drawingColor = color(255, 0, 0);
        player2.drawingColor = color(30, 0, 0);
        player1.tagged();
        System.out.println(1);
      }
      System.out.println("===========");
    }
  } else {
    offShape = true;
  }

  if (player1Keys[0])
  {
    player1.move(-moveBy, 0);
  }
  if (player1Keys[1])
  {
    player1.move(0, moveBy);
  }
  if (player1Keys[2])
  {
    player1.move(0, -moveBy);
  }
  if (player1Keys[3])
  {
    player1.move(moveBy, 0);
  }

  if (player2Keys[0])
  {
    player2.move(-moveBy, 0);
  }
  if (player2Keys[1])
  {
    player2.move(0, moveBy);
  }
  if (player2Keys[2])
  {
    player2.move(0, -moveBy);
  }
  if (player2Keys[3])
  {
    player2.move(moveBy, 0);
  }
}

void keyPressed() {
  if (key == 'a')
  {
    player1Keys[0] = true;
  }       
  if (key == 's')
  {
    player1Keys[1] = true;
  }       
  if (key == 'w')
  {
    player1Keys[2] = true;
  }       
  if (key == 'd')
  {
    player1Keys[3] = true;
  }

  if (keyCode == LEFT)
  {
    player2Keys[0] = true;
  }      
  if (keyCode == DOWN)
  {
    player2Keys[1] = true;
  }       
  if (keyCode == UP)
  {
    player2Keys[2] = true;
  }       
  if (keyCode == RIGHT)
  {
    player2Keys[3] = true;
  }
}

void keyReleased()
{
  if (key == 'a')
  {
    player1Keys[0] = false;
  }      
  if (key == 's')
  {
    player1Keys[1] = false;
  }       
  if (key == 'w')
  {
    player1Keys[2] = false;
  }       
  if (key == 'd')
  {
    player1Keys[3] = false;
  }

  if (keyCode == LEFT)
  {
    player2Keys[0] = false;
  }      
  if (keyCode == DOWN)
  {
    player2Keys[1] = false;
  }       
  if (keyCode == UP)
  {
    player2Keys[2] = false;
  }       
  if (keyCode == RIGHT)
  {
    player2Keys[3] = false;
  }
}

boolean overRect(int x1, int y1, int x2, int y2) {
  if (dist(x1, y1, x2, y2) <= radius) {
    return true;
  } else {
    return false;
  }
}
