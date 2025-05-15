import processing.serial.*;
import cc.arduino.*;
import java.util.ArrayList;
import java.io.PrintWriter;

Arduino arduino;
int LEDState = 0;
int Threshold = 800;

void setup() {
  size(600, 250);
  arduino = new Arduino(this, "/dev/cu.usbserial-14P50081");
  PFont myFont = loadFont("CourierNewPSMT-48.vlw");
  textFont(myFont, 30);
  frameRate(30);
  arduino.pinMode(16, Arduino.OUTPUT); // 出力ピン初期化
}

void draw() {
  int input0 = arduino.analogRead(0);
  if (input0 > Threshold)LEDState = 30;
  background(120);
  //text("output : " + input0, 150, 30);
  text("output : " + LEDState, 150, 30);

  if (LEDState > 0) {
    LEDState--;
    arduino.digitalWrite(16,Arduino.HIGH);
  }
  if(LEDState == 0){
    arduino.digitalWrite(16,Arduino.LOW);
  }
}
