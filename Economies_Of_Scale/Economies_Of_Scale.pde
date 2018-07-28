/*
Economies of Scale
 */
ArrayList<button> buttonList = new ArrayList<button>();
String[] buttonNames = {"Make stone hammers", "find a mom and then go eat a bunch of candy"};
float[] capGoodEffect = {1, 0 };
float[] conGoodEffect = {-1, 1 };
float gridButtonX, gridButtonY;


void setup() {
  size(800, 600);
  gridButtonX = width-170;  
  gridButtonY = 50;
  for (int i = 0; i < buttonNames.length; i ++) {
    button b = new button(gridButtonX, gridButtonY, buttonNames[i], capGoodEffect[i], conGoodEffect[i]);
    System.out.println(gridButtonY);
    //buttonY = buttonY + b.buttonHeight;
    buttonList.add(b);
  }
}

void draw() {
  background(255);
  for (button b : buttonList) {
    b.update();
  }
}

void mousePressed() {
  for (button b : buttonList) {
    if (mouseX >= b.buttonX - (b.buttonWidth/2) && mouseX <= b.buttonX + (b.buttonWidth/2)  && mouseY >= b.buttonY - (b.buttonHeight/2)
      && mouseY <= b.buttonY + (b.buttonHeight/2) && b.enabled) {
      b.pressed();
    }
  }
}

void keyPressed() {
   if(keyCode == UP) {
     for(button b: buttonList) {
      b.scrollBy(-5); 
     }
   }
   if(keyCode == DOWN) {
     for(button b: buttonList) {
      b.scrollBy(5); 
     }
   }
}
