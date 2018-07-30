class scoreBoard {
  float sBWidth, sBHeight;

  void update() {
    //ScoreBoard background
    fill(0);
    rectMode(CORNER);
    sBWidth = width- buttonList.get(0).buttonWidth -40;
    sBHeight = 75;
    rect(0, 0, sBWidth, sBHeight);
    fill(100);
    rect(sBWidth, 0, sBWidth, height);
    textAlign(LEFT, CENTER);
    fill(255);
    textSize(23);
    text("Economic Score: " + nfc(ecoScore, 2) + "  Decsion Points: " + round(globalDecisionPoints) + "  Growth Rate: " + nfc(globalGrowthRate, 2), 10, sBHeight/4);
    text("Capital Goods: " + round(globalCapital) + "  Consumer Goods: " + round(globalConsumer) + "  Happiness: " + nfc(globalHappiness, 2), 10, sBHeight*3/4);


    //Decisions background and title
    fill(255);
    textSize(30);
    textAlign(CENTER);
    text("Decisions", buttonList.get(0).buttonX, 45);

    //Count up ecoScore and DP
    if (millis()%1000 < 16.7) {
      globalTotalFactor = globalConsumer + globalCapital;
      relativeCap = globalCapital/globalTotalFactor;
      relativeCon = globalConsumer/globalTotalFactor;
      globalGrowthRate = globalGrowthRate + ((float)Math.cbrt((relativeCap) - .5))/10;
      ecoScore = globalGrowthRate + ecoScore;
      globalHappiness = globalHappiness + ((float)Math.cbrt((relativeCon) - .5))/10;
      globalDecisionPoints += globalHappiness;
      
      scoreGraph.update();
    }
    //globalDecisionPoints++;
  }
}
