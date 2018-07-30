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
    textSize(25);
    text("Economic Score: " + ecoScore + "   Decsion Points: " + globalDecisionPoints, 10, sBHeight/2);


    //Decisions background and title
    fill(255);
    textSize(30);
    textAlign(CENTER);
    text("Decisions", buttonList.get(0).buttonX, 45);

    //Count up ecoScore and DP
    if (millis()%1000 < 16.7) {
      globalDecisionPoints++;
      System.out.println(millis());
    }
    //globalDecisionPoints++;
  }
}
