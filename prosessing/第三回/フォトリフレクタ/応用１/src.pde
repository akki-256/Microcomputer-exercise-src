import processing.serial.*;
import cc.arduino.*;

Arduino arduino;
String status = "";
String tmp = "gray";
int flg = 0;
boolean led = false;


void setup() {
  size(600, 250);
  arduino = new Arduino(this, "/dev/cu.usbserial-14P50081");
  arduino.pinMode(13, Arduino.OUTPUT); // 出力ピン初期化
  PFont myFont = loadFont("CourierNewPSMT-48.vlw");
  textFont(myFont, 30);
  frameRate(30);
}

void draw() {
  background(0); // ← ここで背景を白く塗り直す（毎フレームクリア）
  int input0 = arduino.analogRead(0);

  // アナログ入力値の表示
  if (input0 < 1000) {
    status = "white";
  } else if (input0 > 1014) {
    status = "black";
  } else {
    status = "gray";
  }

  if (led) {
    flg++;
  }

  if (status != tmp && flg <= 30) {
    arduino.digitalWrite(13, 255);
    led = true;
    tmp = status;
  }
  if (flg > 30) {
    arduino.digitalWrite(13, 0);
    led = false;
    flg = 0;
  }

  text("output : " + input0, 150, 30);
  text("output : " + status, 150, 60);
}
