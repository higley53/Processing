class decisionButton extends button {
  float capGoodEffect, conGoodEffect, decisionPointsCost;
  boolean enabled = true;
  decisionButton(float x, float y, float w, float h, String d, color c, float cap, float con, float dp) {
    super(x, y, w, h, d, c);
    capGoodEffect = cap;
    conGoodEffect= con;
    decisionPointsCost= dp;
    griddecisionButtonY = griddecisionButtonY + decisionButtonHeight + 10;
  }

  void update() {
    fill(decisionButtonColor);
    rectMode(CENTER);
    rect(decisionButtonX, decisionButtonY, decisionButtonWidth, decisionButtonHeight);
    textAlign(CENTER, CENTER);
    textSize(20);
    fill(255);
    text(display, decisionButtonX, decisionButtonY);
  }
  void pressed() {
    if (mouseX >= decisionButtonX - (decisionButtonWidth/2) && mouseX <= decisionButtonX + (decisionButtonWidth/2)  
      && mouseY >= decisionButtonY - (decisionButtonHeight/2) && mouseY <= decisionButtonY + (decisionButtonHeight/2) 
      && enabled && globalDecisionPoints >= decisionPointsCost) {
      decisionButtonColor = 130;
      enabled = false;
      globalCapital +=capGoodEffect;
      globalConsumer +=conGoodEffect;
      globalDecisionPoints -= decisionPointsCost;
    }
  }

  void mouseOver() {
    if (mouseX >= decisionButtonX - (decisionButtonWidth/2) && mouseX <= decisionButtonX + (decisionButtonWidth/2)  && mouseY >= decisionButtonY - (decisionButtonHeight/2)
      && mouseY <= decisionButtonY + (decisionButtonHeight/2) && enabled) {

      if (capGoodEffect != 0 && conGoodEffect != 0) {
        fill(100);
        rectMode(CORNER);
        rect(mouseX-180, mouseY, 180, 63);
        textSize(13);
        textAlign(LEFT);
        fill(255);
        text("Consumer Good Effect " + conGoodEffect + " \nCapital Good Effect " + capGoodEffect + " \nDecision Points Cost: "
          + decisionPointsCost, mouseX - 175, mouseY + 15);
      } else if (capGoodEffect != 0) {
        fill(100);
        rectMode(CORNER);
        rect(mouseX-180, mouseY, 180, 42);
        textSize(13);
        textAlign(LEFT);
        fill(255);
        text("Capital Good Effect " + capGoodEffect + " \nDecision Points Cost: "
          + decisionPointsCost, mouseX - 175, mouseY + 15);
      } else if (conGoodEffect != 0) {
        fill(100);
        rectMode(CORNER);
        rect(mouseX-180, mouseY, 180, 42);
        textSize(13);
        textAlign(LEFT);
        fill(255);
        text("Consumer Good Effect " + conGoodEffect + " \nDecision Points Cost: "
          + decisionPointsCost, mouseX - 175, mouseY + 15);
      }
    }
  }
  void scrollBy(float scroll) {
    decisionButtonY += scroll;
  }
}
