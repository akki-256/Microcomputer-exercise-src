void draw() {
  if (mousePressed == true) {
    on += 8;
    if (on > 255) {
      on = 255;
    }
  } else {
    on -= 8;
    if (on < 0) {
      on = 0;
    }
  }
  if (on > 0) {
    background(255);
    fill(0);
    text("ON", 100, 120);
  } else {
    background(0);
    fill(255);
    text("OFF", 100, 120);
  }
  arduino.analogWrite(usePin, on);
}

