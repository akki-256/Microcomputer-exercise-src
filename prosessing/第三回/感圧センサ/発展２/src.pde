import processing.serial.*;
import cc.arduino.*;

Arduino arduino;
boolean status = true;
int lightThreshold = 700;
int forceThreshold = 200;
int Dead = 25;

void setup() {
  size(600, 250);
  arduino = new Arduino(this, "/dev/cu.usbserial-14P50081");
  PFont myFont = loadFont("CourierNewPSMT-48.vlw");
  textFont(myFont, 30);
  frameRate(30);
  arduino.pinMode(13, Arduino.OUTPUT); // 出力ピン初期化
}

void draw() {
  int input0 = arduino.analogRead(0);
  int input1 = arduino.analogRead(1);
  // アナログ入力値の表示
  background(120);

  // しきい値＋不感帯を考慮したLED制御
  boolean shouldTurnOn = input0 < lightThreshold + Dead && input1 > forceThreshold + Dead;
  boolean shouldTurnOff = input0 >= lightThreshold - Dead || input1 <= forceThreshold - Dead;

  if (!status && shouldTurnOn) {
    arduino.digitalWrite(13, Arduino.HIGH); // LED ON
    status = true;
  } else if (status && shouldTurnOff) {
    arduino.digitalWrite(13, Arduino.LOW); // LED ON
    status = false;
  }
  text("output : " + input0, 150, 30);
  text("output : " + input1, 150, 60);
}
