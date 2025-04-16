//chap3_5
import processing.serial.*;
//import arduinosim.*; //Simulator
import cc.arduino.*; //Actual

Arduino arduino;
PFont myFont;


int usePin0 = 3;
int usePin1 = 9;
int on0 = 0, on1 = 0;

void setup() {
  size(250, 250);
  arduino = new Arduino(
  this, "/dev/cu.usbserial-14P50081");
  myFont = loadFont(
  "CourierNewPSMT-48.vlw");
  textFont(myFont, 30);
}

void draw(){
  if (on0 == 1 || on1 == 1){
    background(255);
    fill(0);
    text("ON", 100, 120);
  } else {
    background(0);
    fill(255);
    text("OFF", 100, 120); 
  }
  arduino.analogWrite(usePin0, on0*255);
  arduino.analogWrite(usePin1, on1*255);
}

void mousePressed(){
    if(mouseButton == LEFT){
       on0 = 1; 
    }
    if(mouseButton == RIGHT){
      on1 = 1; 
    }
}

void mouseReleased(){
  if(mouseButton == LEFT){
    on0 = 0;
  } 
  if (mouseButton == RIGHT) {
    on1 = 0; 
  }
}
