import processing.serial.*;
import cc.arduino.*;
import java.util.ArrayList;
import java.io.PrintWriter;

Arduino arduino;
ArrayList<Object> dataList = new ArrayList<Object>(); // 値を保存するリスト

void setup() {
  size(600, 250);
  arduino = new Arduino(this, "/dev/cu.usbserial-14P50081");
  PFont myFont = loadFont("CourierNewPSMT-48.vlw");
  textFont(myFont, 30);
  frameRate(30);
}

void draw() {
  int input0 = arduino.analogRead(0);
  background(120);
  text("output : " + input0, 150, 30);
  text("data size: " + dataList.size(), 150, 80); // 保存されたデータ数も表示
}

// マウスクリック時に値を保存
void mousePressed() {
  int input0 = arduino.analogRead(0);
  dataList.add(input0);
}

// エスケープキーでCSV書き出し＆終了
void keyPressed() {
  if(key == ' '){
    dataList.add(" ");
  }
  if (key == ESC) {
    key = 0; // ESCによるスケッチ終了を抑制
    saveDataToCSV();
    exit();
  }
}

// CSVファイルとして保存
void saveDataToCSV() {
  PrintWriter output = createWriter("data_output.csv");
  output.println("Input0");
  for (Object val : dataList) {
    output.println(val);
  }
  output.flush();
  output.close();
}
