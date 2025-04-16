//chap3_3
//omajinai
import processing.serial.*;
import cc.arduino.*;
//omajinai
Arduino arduino;
PFont myFont;

//set up for using Pin number
int ledPin = 13;
//color 0 is black,255 is white, color(0,128,255) R,G,B
color bgColor = color(0);

void setup() {
  //window size (width,height)
  size(250, 150);
  arduino = new Arduino(
  this, "/dev/cu.usbserial-14P50081", 57600);
  //select to use font
  myFont = loadFont(
  "CourierNewPSMT-48.vlw");
  //select font size
  textFont(myFont, 30);
  //pin set up for OUTPUT
  arduino.pinMode(ledPin, Arduino.OUTPUT);
}

void draw() {
  //backgroundcolor 0 is black,255 is white, background(0,128,255) R,G,B
  background(bgColor);
}

void mousePressed(){
  //turn on LED
  arduino.digitalWrite(ledPin, Arduino.HIGH);
  
  bgColor = color(255, 0, 0);
}

void mouseReleased(){
  //turn off LED
  arduino.digitalWrite(ledPin, Arduino.LOW);
  
  bgColor = color(0);
}
