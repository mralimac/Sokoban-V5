public class Player {
//Declares a public class for the player
  private int xPosition;
  //Declares private variable for the X position of the player
  private int yPosition;
  //Declares private variable for the Y position of the player
  private int PlayerHeight;
  //Declares private variable for the height of the player
  private int PlayerWidth;
  //Declares private variable for the width of the player
  color PlayerColor;
  //Declares the players color NOTE: This value isn't really used if all the assets are here

  Player (int newXPosition, int newYPosition, int newWidth, int newHeight, int newcolor) {
    //This is the line called when a new player object is called
    xPosition = newXPosition;
    //Assigns newXPosition to the existing xPosition Value
    yPosition = newYPosition;
    //Assigns newYPosition to the existing yPosition Value
    PlayerHeight = newHeight;
    //Assigns newHeight to the existing PlayerHeight Value
    PlayerWidth = newWidth;
    //Assigns newWidth to the existing PlayerWidth Value
    PlayerColor = newcolor;
    //Assigns newcolor to the existing PlayerColor Value
  } 

  void display() {
    //Declares void display inside the player class
    ellipseMode(CORNER);
    //Sets the ellipse mode
    noStroke();
    //Gets rid of the stroke/border
    fill(PlayerColor);
    //Sets the fill color for the player
    ellipse(xPosition +  PlayerWidth/4, yPosition + PlayerHeight/4, PlayerWidth/2, PlayerHeight/2);
    //Draws an ellipse using the pre-determined players values 
    image(playerimg, xPosition, yPosition, PlayerWidth, PlayerHeight);
    //Draws an image on top of the ellipse
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

  public int getPlayerWidth() {
    //Declares a public int function
    return PlayerWidth;
    //Returns the players width
  }

  public int getPlayerHeight() {
    //Declares a public int function
    return PlayerHeight;
    //Returns the players height
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
}