//cha3_6
import processing.serial.*;
//import arduinosim.*; //Simulator
import cc.arduino.*; //Actual

Arduino arduino;
PFont myFont;

int usePin0 = 3;
int usePin1 = 9;

void setup() {
  size(350, 100);
  arduino = new Arduino(
  this, "/dev/cu.usbserial-14P50081");
  myFont = loadFont(
  "CourierNewPSMT-48.vlw");
  textFont(myFont, 30);
}
void draw(){
  background(120);
  int sec = second();
  String secString = "sec" + sec;
  float amt = float(sec) / 59; //0~59sec to 0~1 value
  float value = lerp(0, 255, amt); //amt to 0~255 value
  String valString = "value" + value;
  int outValue = round(value); //sishagonyu
  arduino.analogWrite(usePin0, outValue);
  if(sec%2 == 0){
   arduino.digitalWrite(
  usePin1, Arduino.LOW); 
  } else {
   arduino.digitalWrite(
  usePin1, Arduino.HIGH); 
  }
  text(secString, 15, 50);
  text(valString, 15, 80);
}
void exit() {
  arduino.analogWrite(usePin0, 0);
  arduino.digitalWrite(
  usePin1, Arduino.LOW);
  super.exit();
}
