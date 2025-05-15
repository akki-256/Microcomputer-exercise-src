import processing.serial.*;
import cc.arduino.*;
import java.util.ArrayList;
import java.io.PrintWriter;

Arduino arduino;
int Threshold = 800;
int animeState = 0;
int keep = 0;

void setup() {
  size(600, 250);
  arduino = new Arduino(this, "/dev/cu.usbserial-14P50081");
  PFont myFont = loadFont("CourierNewPSMT-48.vlw");
  textFont(myFont, 30);
  frameRate(30);
}

void draw() {
  int input0 = arduino.analogRead(0);
  if (input0 > Threshold) {
    animeState++;
    keep = 15;
  }else if(keep > 0){
    keep--;
  }
  background(120);
  text("output : " + input0, 150, 30);
  switch(animeState/6) {
  case 0:
    text("." + input0, 150, 60);
    break;
  case 1:
    text("o" + input0, 150, 60);
    break;
  case 2:
    text("O" + input0, 150, 60);
    animeState=0;
  }
}
