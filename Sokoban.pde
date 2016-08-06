ArrayList<Floor> FloorList;  //Declares an ArrayList for storing the ground/floor //<>//
ArrayList<MapObject> arraylistofwalls;
StringList coordlistwall;
StringList boxcoord;
StringList wintiles;
PImage floorimg; 
PImage playerimg; //General Image

Player newPlayer;  //Declares a player object for the player class
Box newBox;  //Declares a box object for the box class
Tile newTile; //Declares a tile object for the tile class
WinTile WinTile;


void setup() {

  int MapObjectx = 0;  //Declares a variable for the X Coord of Map Objects
  int MapObjecty = 0;  //Declares a variable for the Y Coord of Map Objects
  String totalline = genfunction();
  size(800, 550);
  wintiles = new StringList();
  coordlistwall = new StringList();
  boxcoord = new StringList();
  playerimg = loadImage("player-up.png");
  //Loads the image for the playerimg variable to be used later

  println(totalline);
  //Loads the text file for generating the map
  FloorList = new ArrayList<Floor>();
  //Allocates and creates a new arraylist for the FloorList variable

  int Playerx = 0;  //Declares and sets the Players Starting X Position
  int Playery = 0;  //Declares and sets the Players Starting Y Position


  //Adds a new player by calling the player class with these variables

  //Adds a new box object by calling the box class with these variables  
  try {

    floorimg = loadImage("floor.jpeg");
  }
  catch(NullPointerException i) {
    //This catches errors if the file is not found
    println("No File Found");
    //Writes in console that the file is missing
    fill(0);
    //Changes the color to black
    textSize(60);
    //Changes the text size to 60
    textAlign(CENTER);
    //Aligns the text to center
    text("FILE MISSING", width/2, height/2-50);
    //Writes text to the center top of the screen
    textSize(40);
    //Changes the text size to 40
    text("Please Close the Program", width/2, height/2+50);
    //Writes text to the center bottom of the screen
    stop();
    //Stops the programs from executing anymore code
  }

  try {
    //Starts a try for the file load, goes to catch if it fails  
    String[] pieces = (split(totalline, ','));    
    arraylistofwalls = new ArrayList<MapObject>();
    //Declares String Array and fills it with the split ground array. Spilting it by comma   
    for ( int tileindex = 0; tileindex < pieces.length; tileindex++) {
      //Starts a for loops for the map objects
      String MapObjectTile = "w";
      String WinTileChar = "d";
      String PlayerChar = "p";
      String BoxChar = "b";
      FloorList.add(new Floor(MapObjectx, MapObjecty, 50, 50, color(100, 100, 100)));
      if (pieces[tileindex].equals(MapObjectTile) == true) {
        arraylistofwalls.add(new MapObject(MapObjectx, MapObjecty, 50, 50, color(255, 200, 50)));
      }
      if (pieces[tileindex].equals(WinTileChar) == true) {
        WinTile = new WinTile(MapObjectx, MapObjecty, 50, 50, color(78, 145, 12));
      }
      if (pieces[tileindex].equals(PlayerChar) == true) {
        Playerx = MapObjectx;
        Playery = MapObjecty;
        newPlayer = new Player(Playerx, Playery, 50, 50, color(255, 0, 0));
      }
      if (pieces[tileindex].equals(BoxChar) == true) {
        newBox = new Box(MapObjectx, MapObjecty, 50, 50, color(0, 0, 255));
      }      
      MapObjectx = MapObjectx+50;
      if (MapObjectx == width) {
        MapObjectx = 0;
        MapObjecty = MapObjecty+50;
      }
    }
  }

  catch (NullPointerException errorLoadingRectanglePositionsInSetup) {
    //This catches errors if the file is not found
    println("No File Found");
    //Writes in console that the file is missing
    fill(0);
    //Changes the color to black
    textSize(60);
    //Changes the text size to 60
    textAlign(CENTER);
    //Aligns the text to center
    text("FILE MISSING", width/2, height/2-50);
    //Writes text to the center top of the screen
    textSize(40);
    //Changes the text size to 40
    text("Please Close the Program", width/2, height/2+50);
    //Writes text to the center bottom of the screen
    stop();
    //Stops the programs from executing anymore code
  }
}

void draw() {
  background(0); 
  //Puts a black background to refresh all the on-screen elements every frame
  for (int i =0; i < FloorList.size(); i++) {
    //Starts a for loop to display all the floor tiles
    Floor FloorInOurList = (Floor) FloorList.get(i);
    //Gets the floor object at a certain index and assigns it to the class variable
    FloorInOurList.display();
    //Calls the void inside the floor class to display/update the floor tile
  }

  for (int index = 0; index<arraylistofwalls.size(); index++) {
    MapObject referenceObject = (MapObject)arraylistofwalls.get(index);
    referenceObject.display();
  }

  newBox.display();
  //Calls the Box class to update the box position
  WinTile.display();
  newPlayer.display();
  //Calls the player class to update the player position
  if (wintiles.hasValue(newBox.getXPosition()+"/"+newBox.getYPosition())) {
    Win();
  }
}
void keyPressed() {

  String coordresult;
  int playerxfuture;
  int playeryfuture;
  if (key == 'y') {

    //println(blah);
  }
  if (!wintiles.hasValue(newBox.getXPosition()+"/"+newBox.getYPosition())) {

    //Void that is called whenever a key is pressed on the keyboard
    if (newPlayer.getYPosition() > 0) {
      //Checks if the players position is lower than the windows top
      if (keyCode == UP || key == 'w') {
        PImage playerimgup; 
        playerimgup = loadImage("player-up.png");
        playerimg = playerimgup;
        //Checks if the Up arrow or the W key is pressed   
        playerxfuture = newPlayer.getXPosition();
        playeryfuture = newPlayer.getYPosition()-50;
        coordresult = playerxfuture+"/"+playeryfuture;
        if (!coordlistwall.hasValue(coordresult)) {
          //if (!ycoordwall.hasValue(newPlayer.getYPosition() - 50) && !xcoordwall.hasValue(newPlayer.getXPosition())) {
          println("Player Moves");
          println(newPlayer.getYPosition());
          println(newPlayer.getXPosition());
          newPlayer.setYPos(-50);

          if (boxcoord.hasValue(coordresult)) {
            if (newBox.getYPosition()-50 > -1 && !coordlistwall.hasValue(newBox.getXPosition()+"/"+(newBox.getYPosition()-50))) {        
              newBox.setYPos(-50);
              int index = 0;

              while (!boxcoord.hasValue(coordresult)) {
                index = index + 1;
              }
              int boxXCoord = newBox.getXPosition();
              int boxYCoord = newBox.getYPosition();
              boxcoord.set(index, boxXCoord+"/"+boxYCoord);
            } else {
              newPlayer.setYPos(+50);
            }
          }
          //Updates the players Y position by 50
        } else {
          println("Wall in way");
        }
      }
    }

    if (newPlayer.getYPosition() < height-50) {
      //Checks if the players position is higher than the window bottom
      if (keyCode == DOWN || key == 's') {
        PImage playerimgdown;
        playerimgdown = loadImage("player-down.png");
        playerimg = playerimgdown;
        //Checks if the Down arrow or the S key is pressed
        playerxfuture = newPlayer.getXPosition();
        playeryfuture = newPlayer.getYPosition()+50;
        coordresult = playerxfuture+"/"+playeryfuture;
        if (!coordlistwall.hasValue(coordresult)) {
          println("Player Moves");
          newPlayer.setYPos(+50);
          if (boxcoord.hasValue(coordresult)) {
            if (newBox.getYPosition()+50 < height && !coordlistwall.hasValue(newBox.getXPosition()+"/"+(newBox.getYPosition()+50))) {        
              newBox.setYPos(+50);
              int index = 0;

              while (!boxcoord.hasValue(coordresult)) {
                index = index + 1;
              }
              int boxXCoord = newBox.getXPosition();
              int boxYCoord = newBox.getYPosition();
              boxcoord.set(index, boxXCoord+"/"+boxYCoord);
            } else {
              newPlayer.setYPos(-50);
            }
          }
          //Updates the players Y position by 50
        } else {
          println("Wall in way");
        }
      }
    }

    if (newPlayer.getXPosition() > 0) {
      //Checks if the players position is more than the windows left edge
      if (keyCode == LEFT || key == 'a') {
        PImage playerimgleft;

        playerimgleft = loadImage("player-left.png");

        playerimg = playerimgleft;
        //Checks if the left arrow or the A key is pressed
        playerxfuture = newPlayer.getXPosition()-50;
        playeryfuture = newPlayer.getYPosition();
        coordresult = playerxfuture+"/"+playeryfuture;
        if (!coordlistwall.hasValue(coordresult)) {
          println("Player Moves");
          newPlayer.setXPos(-50);
          if (boxcoord.hasValue(coordresult)) {
            if (newBox.getXPosition()-50 > -1 && !coordlistwall.hasValue((newBox.getXPosition()-50)+"/"+(newBox.getYPosition()))) {        
              newBox.setXPos(-50);
              int index = 0;

              while (!boxcoord.hasValue(coordresult)) {
                index = index + 1;
              }
              int boxXCoord = newBox.getXPosition();
              int boxYCoord = newBox.getYPosition();
              boxcoord.set(index, boxXCoord+"/"+boxYCoord);
            } else {
              newPlayer.setXPos(+50);
            }
          }
          //Updates the players X position by 50
        } else {
          println("Wall in way");
        }
      }
    }

    if (newPlayer.getXPosition() < width-50) {
      //Checks if the players position is less than the windows right edge
      if (keyCode == RIGHT || key == 'd') {

        PImage playerimgright;
        playerimgright = loadImage("player-right.png");
        playerimg = playerimgright;
        //Checks if the right arrow or the D key is pressed
        playerxfuture = newPlayer.getXPosition()+50;
        playeryfuture = newPlayer.getYPosition();
        coordresult = playerxfuture+"/"+playeryfuture;
        if (!coordlistwall.hasValue(coordresult)) {
          println("Player Moves");
          newPlayer.setXPos(+50);          
          if (boxcoord.hasValue(coordresult)) {
            if (newBox.getXPosition()+50 < width && !coordlistwall.hasValue((newBox.getXPosition()+50)+"/"+(newBox.getYPosition()))) {        
              newBox.setXPos(+50);
              int index = 0;

              while (!boxcoord.hasValue(coordresult)) {
                index = index + 1;
              }
              int boxXCoord = newBox.getXPosition();
              int boxYCoord = newBox.getYPosition();
              boxcoord.set(index, boxXCoord+"/"+boxYCoord);
            } else {
              newPlayer.setXPos(-50);
            }
          }
          //Updates the players X position by 50
        } else {
          println("Wall in way");
        }
      }
    }
  }
  if (wintiles.hasValue(newBox.getXPosition()+"/"+newBox.getYPosition()) && key == 'q') {
    exit();
  }
}