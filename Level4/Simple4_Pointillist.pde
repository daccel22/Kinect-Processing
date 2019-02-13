/*
  Use the colors from the loaded image to draw your own brilliant paintings
  in pointillism
  Reference to the example on the website of processing
*/
import java.util.*;
PImage img;
int minP,maxP;//the minimum and the maximum size of the ellipses

void setup(){
  size(800,446);//shoud match the size of image
  img =loadImage("ocean.jpg");
  minP=2;
  maxP=50;
  imageMode(CENTER);
  noStroke();
  background(255);
}
void draw(){
  float size=map(mouseX,0,width,minP,maxP);//the size of the ellipses grows bigger when mouse moves to the right
  //float size=map(mouseY,0,heighgt,minP,maxP);
  int X=int(random(width));
  int Y=int(random(height));
  color px=img.get(X,Y);
  fill(px,128);
  ellipse(mouseX,mouseY,size,size);
}
