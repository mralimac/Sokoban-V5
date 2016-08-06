class MapObject extends Tile {
  //Declares the MapObject class using values from the Tile Class 
  private int xpos;
  private int ypos;
  private int xsize;
  private int ysize;
  private String coordstring;

  
  MapObject(int newXPosition, int newYPosition, int newWidth, int newHeight, int newcolor) {
    //This is the line called when a new map object is called    
    super(newXPosition, newYPosition, newWidth, newHeight, newcolor);
    
    coordstring = newXPosition+"/"+newYPosition;
    coordlistwall.append(coordstring);
    //Draws a new mapobject/wall using these values
    xpos = newXPosition;
    ypos = newYPosition;
    xsize = newWidth;
    ysize = newHeight;
  }
  void display() {
    PImage wallimage = loadImage("wall.png");
    image(wallimage, xpos, ypos, xsize, ysize);
  }
}