/*
Economies of Scale
 */
ArrayList<button> buttonList = new ArrayList<button>();
String[] buttonNames = {"Create stone hammers", "Forage for berries", "Build huts", "Have a festival"};
float[] capGoodEffect = {1, 0, 2, -1 };
float[] conGoodEffect = {0, 1, -1, 3 };
float[] globalDecisionPointsCost = {3, 3, 7, 7};
float gridButtonX, gridButtonY;
float ecoScore, globalDecisionPoints;

void setup() {
  size(800,600);
  //fullScreen();
  gridButtonX = width-170;  
  gridButtonY = 100;
  for (int i = 0; i < buttonNames.length; i ++) {
    button b = new button(gridButtonX, gridButtonY, buttonNames[i], capGoodEffect[i], conGoodEffect[i], globalDecisionPointsCost[i]);
    buttonList.add(b);
  }
}

scoreBoard scoreBoard = new scoreBoard();

void draw() {
  background(255);
  scoreBoard.update();
  for (button b : buttonList) {
    b.update();
  }
  for (button b : buttonList) {
    b.mouseOver();
  }
}

void mousePressed() {
  for (button b : buttonList) {
    if (mouseX >= b.buttonX - (b.buttonWidth/2) && mouseX <= b.buttonX + (b.buttonWidth/2)  && mouseY >= b.buttonY - (b.buttonHeight/2)
      && mouseY <= b.buttonY + (b.buttonHeight/2) && b.enabled) {
      b.pressed();
    }
  }
}

void keyPressed() {
  if (keyCode == UP) {
    for (button b : buttonList) {
      b.scrollBy(-5);
    }
  }
  if (keyCode == DOWN) {
    for (button b : buttonList) {
      b.scrollBy(5);
    }
  }
}
