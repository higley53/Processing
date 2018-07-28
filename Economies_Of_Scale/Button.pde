class button {
  float buttonX, buttonY, buttonWidth, buttonHeight;
  String display;
  button(float x, float y, String d) {
    buttonX = x;
    buttonY = y;
    buttonWidth = 300;
    buttonHeight = 35;
    display = d;

    if (display.length() > 20) {
      String temp = display.substring(0, 20);
      boolean spaced = false;
      buttonHeight = 70;
      for (int i = 20; i < display.length(); i++) {
        temp += display.substring(i, i + 1);
        if (display.substring(i, i + 1).equals(" ") && !spaced) {
          temp += "\n"; 
          spaced = true;
        }
      }
      display = temp;
      System.out.println(display);
    }
  }


  void update() {
    fill(0);
    rect(buttonX, buttonY, buttonWidth, buttonHeight);
    textAlign(CENTER, CENTER);
    textSize(20);
    fill(255);

    text(display, buttonX + (buttonWidth/2), buttonY + (buttonHeight/2));
  }
}
