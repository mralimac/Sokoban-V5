class WinTile extends Tile {
  private int xpos;
  private int ypos;
  private int xsize;
  private int ysize;
  private color tilecolor;

  //Declares the WinTile class using values from the Tile Class 
  WinTile(int newXPosition, int newYPosition, int newWidth, int newHeight, int newcolor) {
    //This is the line called when a new win tile object is called

    super(newXPosition, newYPosition, newWidth, newHeight, newcolor);
    //Draws a new WinTile using these values

    wintiles.append(newXPosition + "/" + newYPosition);
    xpos = newXPosition;
    ypos = newYPosition;
    xsize = newWidth;
    ysize = newHeight;
    tilecolor = newcolor;
  }

  void display() {
    PImage tileimg;  //Declares an image for one of the ground tiles
    tileimg = loadImage("tile.png");
    fill(tilecolor);
    rect(50, 50, 50, 50);
    image(tileimg, xpos, ypos, xsize, ysize);
  }
}
void Win() {
  background(0);
  fill(255);
  textAlign(CENTER);
  textSize(30);
  text("GAME OVER", width/2, height/2-height/8);
  textSize(20);
  text("Press Q to quit", width/2, height/2+height/8);
}