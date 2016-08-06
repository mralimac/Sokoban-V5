public class Box extends Tile {
  //Declares a public class for the player
  private int xPosition;
  //Declares private variable for the X position of the player
  private int yPosition;
  //Declares private variable for the Y position of the player
  private int xsize;
  private int ysize;
  private color tilecolor;

  //Declares the Box class using values from the Tile Class  
  Box(int newXPosition, int newYPosition, int newWidth, int newHeight, int newcolor) {    
    //This is the line called when a new box object is called
    super(newXPosition, newYPosition, newWidth, newHeight, newcolor);
    //Draws a new object using these values and color    
    //This is the line called when a new player object is called
    xPosition = newXPosition;
    //Assigns newXPosition to the existing xPosition Value
    yPosition = newYPosition;
    //Assigns newYPosition to the existing yPosition Value
    xsize = newWidth;
    ysize = newHeight;
    boxcoord.append(xPosition+"/"+yPosition);
    tilecolor = newcolor;
  }
  void display() {   
    fill(tilecolor);
    rect(xPosition, yPosition, xsize, ysize);
    PImage boximage = loadImage("box.jpg");
    image(boximage, xPosition, yPosition, xsize, ysize);
  }
  void setXPos(int newX) {
    //Declares a new void with a value newX passed in
    xPosition = xPosition + newX;
    //Updates the xPosition by adding the existing xPosition and newX together
  }

  void setYPos(int newY) {
    //Declares a new void with a value newY passed in
    yPosition = yPosition + newY;
    //Updates the yPosition by adding the existing yPosition and newY together
  }
  public int getXPosition() {
    //Declares a public int function
    return xPosition;
    //Returns the players X coord
  }

  public int getYPosition() {
    //Declares a public int function 
    return yPosition;
    //Returns the players Y coord
  }
}