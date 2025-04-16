// writeFile
import processing.serial.*;
import cc.arduino.*;

Arduino arduino;
PFont myFont;
int usePin0 = 0;
String label0 = "array0";
int[] array0 = new int[0];
int input0;
boolean isRecording = false;

void setup() {
  size(600, 250);
  arduino = new Arduino(this,"/dev/cu.usbserial-*******");
  myFont = loadFont("CourierNewPSMT-48.vlw");
  textFont(myFont, 30);
  frameRate(30);
}

void draw(){
  input0 = arduino.analogRead(usePin0);
  // アナログ入力値の表示
  background(120);
  fill(255);
  text("Ain-0␣=␣" + input0, 15, 30);
  noStroke();
  rect(235, 10, input0/4, 20);
  stroke(255, 0, 0);
  line(235, 5, 235, 125);
  line(490, 5, 490, 125);
  if(isRecording) {
    // 入力値の記録
    array0 = append(array0, input0);
    text("Recording...", 40, 180);
    text("Press␣any␣key␣to␣End␣Recording", 40, 210);
    if(second() % 2 == 1) {
      fill(255,0,0);
      ellipse(25,270,9,9);
    }else{
      // 記録中でないときは使い方を表示
      text("Press␣Esc␣key␣to␣Exit", 40,180);
      text("Press␣any␣key␣to␣Record",40, 210);
    }
  }
}

void keyPressed() {
  if (isRecording) {
    // CSV ファイルの内容を作成
    String[] lines = new String[array0.length + 1];
    lines[0] = "Steps," + label0;
    for (int i = 0; i < array0.length ; i++) {
      lines[i+1] = (i+1) + "," + array0[i];
    }
    // ファイル名の作成
    String filename = "Rec_" + 
                      year() + nf(month(), 2) + nf(day(),2) + "_" +
                      nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2) + ".csv";
    // ファイルの書き出し
    saveStrings(filename, lines);
          // 初期化
    array0 = expand(array0, 0);
    isRecording = false;
  }else{
    // 記録開始
    isRecording = true;
  }
}
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
