String genfunction() {
  String[] ground;  //Declares String Array for the ground
  String finalvalue ="";
  ground = loadStrings("generator.txt");
  for (int i = 0; i < ground.length; i++) {
    finalvalue += ground[i] + "";
  }
  return finalvalue;
}