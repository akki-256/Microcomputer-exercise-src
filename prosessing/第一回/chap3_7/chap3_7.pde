//cha3_7
import processing.serial.*;
//import arduinosim.*; //Simulator
import cc.arduino.*; //Actual

Arduino arduino;
PFont myFont;

int usePin0 = 0;
int usePin1 = 2;

void setup() {
  size(400, 200);
  arduino = new Arduino(
  this, "/dev/cu.usbserial-14P50081");
  myFont = loadFont(
  "CourierNewPSMT-48.vlw");
  textFont(myFont, 30);
  
  arduino.pinMode(usePin0, Arduino.INPUT);
  arduino.pinMode(usePin1,Arduino.INPUT);
  
}
void draw(){
  background(120);
  String analog0 = "Analog0 = " + arduino.analogRead(usePin0);
  String digital0 = "Digital0 = " + arduino.digitalRead(usePin1);
  text(analog0, 15, 30);
  text(digital0, 15, 90);
}
