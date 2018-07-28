/*
Economies of Scale
 */
ArrayList<button> buttonList = new ArrayList<button>();
String[] buttonNames = {"Make stone hammers" , "find a mom and then"};
float[] capGoodEffect = {1, 0 };
float[] conGoodEffect = {-1, 1 };
float gridButtonX, gridButtonY;

void setup() {
  size(800, 600);
  gridButtonX = width/2;  gridButtonY = 50;
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
