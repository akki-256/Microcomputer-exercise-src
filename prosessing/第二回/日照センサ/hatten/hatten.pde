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
    // アナログ入力値の表示
    background(120);
    text("Ain-0 = " + arduino.analogRead(0), 15, 30);
}
