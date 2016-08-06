public class Tile {
  //Declares a public class for tiles
  private int xPosition;
  //Declares private variable for the X position of the tile
  private int yPosition;
  //Declares private variable for the Y position of the tile
  private int tileHeight;
  //Declares private variable for the height of the tile
  private int tileWidth;
  //Declares private variable for the width of the tile 
  private color tileColor;
  //Declares private variable for the color value
  //Declares an image for the floor  NOTE: THIS IS NOT USED


  Tile (int newXPosition, int newYPosition, int newWidth, int newHeight, color newcolor) {
    //This is the line called when a new tile object is created
    xPosition = newXPosition;
    //Assigns newXPosition to the existing xPosition Value
    yPosition = newYPosition;
    //Assigns newYPosition to the existing yPosition Value
    tileHeight = newHeight;
    //Assigns newHeight to the existing tileHeight Value
    tileWidth = newWidth;
    //Assigns newWidth to the existing tileWidth Value
    tileColor = newcolor;
    //Assigns newcolor to the existing tileColor Value
  }

  void display() {
    //Declares void display inside the tile class

    //Sets the stroke color to red
    strokeWeight(1);
    //Sets the stroke size to 1
    fill(tileColor);
    //Sets the color using the tileColor value
    //floorimg;
    //rect(xPosition, yPosition, tileWidth, tileHeight);
    image(floorimg, xPosition, yPosition, tileWidth, tileHeight);
    //Draws an image on to the floor tile NOTE: This is commented out to increase performance

    //Draws an rectangle using the tile coords and size values
  }

  public int getXPositionition() {
    //Declares a public int function
    return xPosition;
    //Returns the tiles X coord
  }

  public int getYPositionition() {
    //Declares a public int function
    return yPosition;
    //Returns the tiles Y coord
  }

  public int getTileWidth() {
    //Declares a public int function
    return tileWidth;
    //Returns the tiles width
  }

  public int getTileHeight() {
    //Declares a public int function
    return tileHeight;
    //Returns the tiles height
  }
}