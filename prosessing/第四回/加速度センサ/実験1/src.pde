//焦電センサ/発展1

import processing.serial.*;
import cc.arduino.*;
import java.util.ArrayList;
import java.io.PrintWriter;

Arduino arduino;
ArrayList<int[]> dataList = new ArrayList<>();
int[] input;

void setup() {
  size(600, 250);
  arduino = new Arduino(this, "/dev/cu.usbserial-14P50081");
  PFont myFont = loadFont("CourierNewPSMT-48.vlw");
  textFont(myFont, 30);
  frameRate(30);
}

void draw() {
  saveData();
  background(120);
  text("output : " + input[0], 150, 30);
  text("output : " + input[1], 150, 60);
  text("output : " + input[2], 150, 90);
  text("data size: " + dataList.size(), 150, 120); // 保存されたデータ数も表示
}


void saveData() {
  input = new int[] {
    arduino.analogRead(0),
    arduino.analogRead(1),
    arduino.analogRead(2)
  };
  dataList.add(input);
}

// エスケープキーでCSV書き出し＆終了
void keyPressed() {
  if (key == ESC) {
    key = 0; // ESCによるスケッチ終了を抑制
    saveDataToCSV();
    exit();
  }
}

void saveDataToCSV() {
  PrintWriter output = createWriter("outPut.csv");
  output.println("Index,Input0,Input1,Input2"); // ヘッダー

  for (int i = 0; i < dataList.size(); i++) {
    int[] vals = dataList.get(i);
    output.println(i + "," + vals[0] + "," + vals[1] + "," + vals[2]);
  }
  output.flush();
  output.close();
}
