// Open Sound Control Introduction by linking PureData with Processing
// Library used: oscP5 by Andreas Schlegel
// Date of creation: 05th February 2023

import netP5.*;
import oscP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;
float value;
int circle_color;
float volume;

void setup() {
  size(400,400);
  frameRate(30);
  // start oscP5, listening for incoming messages at port 12000
  oscP5 = new OscP5(this, 8000);
  value = 0.0;
  circle_color = 0;
  volume = 0.0;
}

void draw() {
  smooth();
  background(0);
  fill(100,200, circle_color);
  ellipse(200,200,value*50*volume, value*50*volume);
}

void mousePressed() {
}

// incoming osc messages are forwarded to the oscEvent methos
void oscEvent(OscMessage theOscMessage) {
  
  if(theOscMessage.checkAddrPattern("/sinosc") == true)
  {
  value = theOscMessage.get(0).floatValue();
  
  print(value);
  } 
  if(theOscMessage.checkAddrPattern("/color") == true)
  {
  circle_color = theOscMessage.get(0).intValue();
  
  print(value);
  }
  if(theOscMessage.checkAddrPattern("/volume") == true)
  {
  volume = theOscMessage.get(0).floatValue();
  
  print(value);
  }
}
