//chap3_2
//Required for serial communication
import processing.serial.*;
//Required for using Arduino variables
import cc.arduino.*;

//Declaration variables
Arduino arduino;
PFont myFont;

void setup() {
  //Window size (width,height)
  size(300, 100);
  //Serial port setting
  arduino = new Arduino(
  this, "/dev/cu.usbserial-14P50081");
  //Select to use font
  myFont = loadFont(
  "CourierNewPSMT-48.vlw");
  //Select font size
  textFont(myFont, 30);
}
void draw() {
  //Backgroundcolor 0 is black,255 is white, background(0,128,255) R,G,B
  background(120);
  //Display text and set up position(horizon,vertical)
  text("Hello World", 15, 50);
}
