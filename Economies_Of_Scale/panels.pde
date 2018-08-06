class panels {
  float sBWidth, sBHeight;
  float speedUpX, speedUpY, speeddecisionButtonWidth, speeddecisionButtonHeight, speedDownX, speedDownY;
  float currentSpeed = 4;
  float currentTime;

  panels() {
    sBWidth = width - decisionButtonList.get(0).decisionButtonWidth - 40;
    //System.out.println(sBWidth);
    sBHeight = 75;
    currentTime = millis();
  }
  void displayScoreBoard() {
    //panels background

    //ScoreBoard (black)
    fill(0);
    rectMode(CORNER);
    rect(0, 0, sBWidth, sBHeight);
    //Menu panel background
    fill(100);
    rect(sBWidth, 0, width-sBWidth, height);


    rectMode(CORNER);
    fill(100, 0, 0);
    rect(sBWidth - 245, sBHeight/4, 120, 40);
    fill(0, 100, 0);
    rect(sBWidth - 125, sBHeight/4, 120, 40);

    fill(255);
    textSize(17); 
    textAlign(CENTER, CENTER);
    speedUpX = sBWidth - 60; 
    speedUpY = sBHeight/4 + 20;
    speedDownX = sBWidth - 180; 
    speedDownY = sBHeight/4 + 20;
    speeddecisionButtonWidth = 120; 
    speeddecisionButtonHeight = 40;
    text("Speed Up", speedUpX, speedUpY);
    text("Speed Down", speedDownX, speedDownY);
    text("Current Speed: " + abs(currentSpeed - 5), speedDownX - 150, speedDownY);

    textAlign(LEFT, CENTER);
    fill(255);
    textSize(23);   
    text("Economic Score: " + nfc(ecoScore, 2) + "  Decision Points: " + floor(globalDecisionPoints) + "  Growth Rate: " + nfc(globalGrowthRate, 2), 10, sBHeight/4);
    text("Capital Goods: " + round(globalCapital) + "  Consumer Goods: " + round(globalConsumer) + "  Happiness: " + nfc(globalHappiness, 2), 10, sBHeight*3/4);

    //Decisions background and title
    //fill(255);
    //textSize(30);
    //textAlign(CENTER);
    //text("Decisions", decisionButtonList.get(0).decisionButtonX, 45);

    //Count up ecoScore and DP
    if (millis() - currentTime > (1000*currentSpeed)) {
      globalTotalFactor = globalConsumer + globalCapital;
      relativeCap = globalCapital/globalTotalFactor;
      relativeCon = globalConsumer/globalTotalFactor;
      globalGrowthRate = globalGrowthRate + ((float)Math.cbrt((relativeCap) - .5))/10;
      ecoScore = globalGrowthRate + ecoScore;
      if (globalHappiness + 0.03 -(sq(relativeCon-1))/15 >= 0) {
        globalHappiness = globalHappiness + 0.03 -(sq(relativeCon-1))/15;
      } else {
        globalHappiness = 0;
      }
      globalDecisionPoints += globalHappiness/3;

      //scoreGraph.update();

      currentTime = millis();
    }
  }

  void accelerateTimeButton() {
    if (mouseX >= speedUpX - (speeddecisionButtonWidth/2) && mouseX <= speedUpX + (speeddecisionButtonWidth/2)  && mouseY >= speedUpY - (speeddecisionButtonHeight/2)
      && mouseY <= speedUpY + (speeddecisionButtonHeight/2)) {
      if (currentSpeed > 1) {
        currentSpeed --;
      } else {
      }
    }
  }
  void decelerateTimeButton() {
    if (mouseX >= speedDownX - (speeddecisionButtonWidth/2) && mouseX <= speedDownX + (speeddecisionButtonWidth/2)  && mouseY >= speedDownY - (speeddecisionButtonHeight/2)
      && mouseY <= speedDownY + (speeddecisionButtonHeight/2)) {
      if (currentSpeed < 4) {
        currentSpeed ++;
      } else {
      }
    }
  }
}
