import processing.serial.*;
import cc.arduino.*;

Arduino arduino;

void setup() {
size(600, 250);
arduino = new Arduino(this,"/dev/cu.usbserial-14P50081");
PFont myFont = loadFont("CourierNewPSMT-48.vlw");
textFont(myFont, 30);
frameRate(30);
}

void draw(){
  int input0 = arduino.analogRead(0);
// アナログ入力値の表示
background(120);
text("output : " + input0,150,30);
}
