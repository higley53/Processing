/*
Economies of Scale
 */
ArrayList<decisionButton> decisionButtonList = new ArrayList<decisionButton>();
String[] decisionButtonNames = {"Create stone hammers", "Forage for berries", "Build huts", "Have a festival"};
float[] capGoodEffect = {1, 0, 2, -1 };
float[] conGoodEffect = {0, 1, -1, 3 };
float[] globalDecisionPointsCost = {3, 3, 7, 7};
float griddecisionButtonX, griddecisionButtonY;
float ecoScore = 1, globalDecisionPoints = 1, globalHappiness = 1, globalGrowthRate = 1, relativeCon, relativeCap, globalCapital = 1, globalConsumer = 1, globalTotalFactor;
float lastFrameY;
graph scoreGraph; 
animationArea animationArea;
panels panels;
menu menu;
ArrayList<menuButton> menuButtonList = new ArrayList<menuButton> ();
String[] menuButtonNames = {"Decisions", "Graph"};
boolean[] displayField;

void setup() {
  size(1600, 900);
  //fullScreen();
  scoreGraph = new graph();
  griddecisionButtonX = width-170;  
  griddecisionButtonY = 100;
  for (int i = 0; i < decisionButtonNames.length; i ++) {
    decisionButton b = new decisionButton(griddecisionButtonX, griddecisionButtonY, 300, 35, decisionButtonNames[i], color(0, 0, 0), 
      capGoodEffect[i], conGoodEffect[i], globalDecisionPointsCost[i]);
    decisionButtonList.add(b);
  }
  panels = new panels();
  menu = new menu();
  animationArea = new animationArea(0, panels.sBHeight, panels.sBWidth, height);
}

void draw() {
  background(255);
  panels.displayScoreBoard();
  animationArea.display();
  menu.display();
  stroke(0);
}

void mousePressed() {
  float mx = mouseX, my = mouseY;
  for (decisionButton b : decisionButtonList) {
    b.pressed();
  }
  menu.pressed();
  panels.accelerateTimeButton();
  panels.decelerateTimeButton();
  for (menuButton b : menuButtonList) {
    if (b.buttonPressed(mx, my)) {
      menu.displayMenu = false;
      for (int i = 0; i < menuButtonNames.length; i++) {
        if (b.display.equals(menuButtonNames[i])) {
          displayField[i] = true;
        }
      }
    }
  }
}

void keyPressed() {
  if (keyCode == UP) {
    for (decisionButton b : decisionButtonList) {
      b.scrollBy(-5);
    }
  }
  if (keyCode == DOWN) {
    for (decisionButton b : decisionButtonList) {
      b.scrollBy(5);
    }
  }
}
