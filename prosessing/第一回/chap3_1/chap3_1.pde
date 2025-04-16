//chap3_1
//omajinai
import processing.serial.*;
import cc.arduino.*;
//omajinai
Arduino arduino;

void setup(){
  //window size (width,height)
  size(200, 100);
  arduino = new Arduino(
  this,"/dev/cu.usbserial-14P50081");
}
void draw(){
  //backgroundcolor 0 is black,255 is white, background(0,128,255) R,G,B
  background(255);
}
