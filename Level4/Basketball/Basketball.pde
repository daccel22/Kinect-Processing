/*
  Move the loaded image with mouse
*/

import java.util.*;
PImage ball;

void setup(){
  size(4000,4000);
  frameRate(200);
  background(255);//background need to be 255 otherwise change the ball image
  ball=loadImage("basketball.jpg");
}
void draw(){
  background(255);
  image(ball,mouseX,mouseY);
  
}
