class button {
  float decisionButtonX, decisionButtonY, decisionButtonWidth, decisionButtonHeight;
  color decisionButtonColor;
  String display;
  boolean enabled = false;
  button(float x, float y, float w, float h, String d, color c) {
    decisionButtonX = x;
    decisionButtonY= y;
    decisionButtonWidth= w;
    decisionButtonHeight = h;
    display= d;
    decisionButtonColor= c;
    if (display.length() > 20) {
      String temp = display.substring(0, 20);
      boolean spaced = false;
      decisionButtonHeight = 70;
      decisionButtonY = decisionButtonY + 20;
      for (int i = 20; i < display.length(); i++) {
        temp += display.substring(i, i + 1);
        if (display.substring(i, i + 1).equals(" ") && !spaced) {
          temp += "\n"; 
          spaced = true;
        }
      }
      display = temp;
    }
  }
  void drawButton() {
    rectMode(CORNER);
    fill(decisionButtonColor);
    rect(decisionButtonX, decisionButtonY, decisionButtonWidth, decisionButtonHeight);
    fill(255);
    textAlign(CENTER, CENTER);
    text(display, decisionButtonX + decisionButtonWidth/2, decisionButtonY + decisionButtonHeight/2 - 5);
    fill(color(255, 0, 0));
    rectMode(CORNERS);
    //rect(decisionButtonX, decisionButtonY, decisionButtonX + decisionButtonWidth, decisionButtonY + decisionButtonHeight);
  }
  boolean buttonPressed(float mx, float my) {
    if (mx >= decisionButtonX && mx <= decisionButtonX + decisionButtonWidth  && my <= decisionButtonY + decisionButtonHeight
      && my >= decisionButtonY && enabled) {
      enabled = false;
      return true;
    } else {
      return false;
    }
  }
}
