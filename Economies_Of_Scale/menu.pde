class menu {

  float menuBackgroundY = 45, menuBackgroundWidth = 75, menuBackgroundHeight = 40, 
    menuBackgroundX = decisionButtonList.get(0).decisionButtonX  + decisionButtonList.get(0).decisionButtonWidth/2 - menuBackgroundWidth/2;
  float buttonSpacing = 5, menuButtonY = menuBackgroundY + menuBackgroundHeight/2 + 5;
  boolean displayDecisionTab = false, displayMenu = false;

  menu() {
    for (int i = 0; i < menuButtonNames.length; i++) {
      menuButton b = new menuButton(menuBackgroundX-265, menuButtonY, 260, menuBackgroundHeight, 
        menuButtonNames[i], color(0, 0, 0));
      menuButtonY += menuBackgroundHeight + buttonSpacing;
      menuButtonList.add(b);
    }
    displayField = new boolean[menuButtonNames.length];
  }

  void display() {
    fill(0);
    rectMode(CENTER);
    rect(menuBackgroundX, menuBackgroundY, menuBackgroundWidth, menuBackgroundHeight);
    fill(255);
    textAlign(CENTER);
    text("Menu", menuBackgroundX, menuBackgroundY +7);

    if (displayMenu) {
      fill(150);
      rectMode(CORNER);
      rect(menuBackgroundX-270, menuBackgroundY+menuBackgroundHeight/2, 270, 600);
      for (menuButton b : menuButtonList) {
        b.drawButton();
      }
    }

    if (displayField[0]) {
      //Draw decision Buttons and set them to enabled
      for (decisionButton b : decisionButtonList) {
        b.update();
        b.enabled = true;
      }
      for (decisionButton b : decisionButtonList) {
        b.mouseOver();
      }
      disableMenuButtons();
    } else {     //Otherwise disable the decision buttons and they won't be drawn
      for (decisionButton b : decisionButtonList) {
        b.enabled = false;
      }
    }
    if (displayField[1]) {
      scoreGraph.display();
      scoreGraph.update();
      disableMenuButtons();
    }
  }

  void pressed() {
    if (mouseX >= menuBackgroundX - (menuBackgroundWidth/2) && mouseX <= menuBackgroundX + (menuBackgroundWidth/2)  && mouseY >= menuBackgroundY - (menuBackgroundHeight/2)
      && mouseY <= menuBackgroundY + (menuBackgroundHeight/2)) {
      if (displayMenu) {
        displayMenu = false;
        for (menuButton b : menuButtonList) {
          b.enabled = false;
        }
      } else {
        displayMenu = true;
        for (int i = 0; i < displayField.length; i ++) {
          displayField[i] = false;
        }
        for (menuButton b : menuButtonList) {
          b.enabled = true;
        }
      }
    }
  }
  void disableMenuButtons() {
    for (button mb : menuButtonList) {
      mb.enabled = false;
    }
  }
}

class menuButton extends button {
  menuButton(float x, float y, float w, float h, String d, color c) {
    super(x, y, w, h, d, c);
  }
}
