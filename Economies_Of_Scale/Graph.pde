class graph {
  float graphBackgroundX = 0;
  float graphBackgroundWidth = 400;
  float graphBackgroundHeight = 250;
  float graphBackgroundY = height - graphBackgroundHeight;
  float lineX =5;
  float lastEcoScore = 0;
  ArrayList<lineStorage> lineList = new ArrayList<lineStorage>();
  boolean offGraph = false;
  graph() {
  }
  void display() {
    rectMode(CORNER);
    stroke(200);
    fill(200);
    rect(graphBackgroundX, graphBackgroundY, graphBackgroundWidth, graphBackgroundHeight);
    for (lineStorage l : lineList) {
      stroke(0);
      if(offGraph) {
         l.x1 = l.x1 -5;
         l.x2 = l.x2 -5;
         offGraph = false;
      }
      strokeWeight(4);
      line(l.x1, l.y1, l.x2, l.y2); 
      strokeWeight(1);
    }
  }
  void update() {
    stroke(0);
    lineStorage l = new lineStorage(lineX, height - lastEcoScore, lineX+3, height - ecoScore);
    lineList.add(l);
    lineX = lineX + 5;
    lastEcoScore = ecoScore;
    if(lineList.size() >= 79) {
      lineList.remove(0);
      offGraph = true;
    }
  }
}

class lineStorage {
  float x1, y1, x2, y2;
  lineStorage(float x1a, float y1a, float x2a, float y2a) {
    x1 = x1a;
    y1 = y1a;
    x2 = x2a;
    y2 = y2a;
  }
}
