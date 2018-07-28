class button {
  float buttonX, buttonY, buttonWidth, buttonHeight, capGoodEffect, conGoodEffect, buttonColor;
  String display;
  boolean enabled = true;
  button(float x, float y, String d, float cap, float con) {
    buttonX = x;
    buttonY = y;
    buttonWidth = 300;
    buttonHeight = 35;
    display = d;
    capGoodEffect = cap;
    conGoodEffect = con;
    buttonColor = 0;

    if (display.length() > 20) {
      String temp = display.substring(0, 20);
      boolean spaced = false;
      buttonHeight = 70;
      buttonY = buttonY + 20;
      for (int i = 20; i < display.length(); i++) {
        temp += display.substring(i, i + 1);
        if (display.substring(i, i + 1).equals(" ") && !spaced) {
          temp += "\n"; 
          spaced = true;
        }
      }
      display = temp;
    }
    gridButtonY = gridButtonY + buttonHeight + 10;
  }


  void update() {
    fill(buttonColor);
    rectMode(CENTER);
    rect(buttonX, buttonY, buttonWidth, buttonHeight);
    textAlign(CENTER, CENTER);
    textSize(20);
    fill(255);
    text(display, buttonX, buttonY);
  }
  void pressed() {
    buttonColor = 130;
    enabled = false;
  }


  void scrollBy(float scroll) {
    buttonY += scroll;
  }
}
