//chap3_4
import processing.serial.*;
//import arduinosim.*; //Simulator
import cc.arduino.*; //Actual

Arduino arduino;
PFont myFont;

//output light value
int on = 0;
//use pin number
int usePin = 3;

void setup() {
  size(250, 250);
  arduino = new Arduino(
  this, "/dev/cu.usbserial-14P50081");
  myFont = loadFont(
  "CourierNewPSMT-48.vlw");
  textFont(myFont, 30);
}
