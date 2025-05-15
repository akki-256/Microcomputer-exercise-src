import processing.serial.*;
import cc.arduino.*;

Arduino arduino;
String status = "0";
int boltWeight = 370;
int Threshold = 70;
int Dead = 10;

void setup() {
  size(600, 250);
  arduino = new Arduino(this, "/dev/cu.usbserial-14P50081");
  PFont myFont = loadFont("CourierNewPSMT-48.vlw");
  textFont(myFont, 30);
  frameRate(30);
}

void draw() {
  int input0 = arduino.analogRead(0);
  background(120);
  text("output : " + input0, 150, 30);
  int count = round((float)(input0  - boltWeight + Dead / 2) / Threshold);
  if (input0 < Dead) {
    count = 0; 
  }
  status = str(count); 
  text("Status : " + status, 150, 80);
}
