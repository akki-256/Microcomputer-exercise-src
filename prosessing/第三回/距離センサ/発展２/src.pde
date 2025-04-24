import processing.serial.*;
import cc.arduino.*;

Arduino arduino;
String status = "distant";
int Threshold = 200;
int Dead = 50;

void setup() {
  size(600, 250);
  arduino = new Arduino(this, "/dev/cu.usbserial-14P50081");
  PFont myFont = loadFont("CourierNewPSMT-48.vlw");
  textFont(myFont, 30);
  frameRate(30);
  arduino.pinMode(13, Arduino.OUTPUT);  // 内蔵LEDピンを出力モードに設定
}

void draw() {
  int input0 = arduino.analogRead(0);
  // アナログ入力値の表示
  background(120);
  text("output : " + input0, 150, 30);
  if (status.equals("close") && input0 < Threshold - Dead) {
        arduino.digitalWrite(13, Arduino.LOW);  // 消灯
    status = "distant";
  } else if (status.equals("distant") && input0 >=Threshold + Dead) {
    arduino.digitalWrite(13, Arduino.HIGH); // 点灯
    status = "close";
  }
  text("Status : " + status, 150, 80);
}
