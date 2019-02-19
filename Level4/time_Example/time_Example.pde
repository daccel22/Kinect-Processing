/*
  Use it as an example.
  !Program should conform to every requests of each animations
  ex. the size of the window...
  Combine Pointillist with rainbowBall.
  Add a timer to the program.
  Animation at first is Pointillist, after 30 seconds, change to rainbowBall.
*/

import java.util.*;
PImage img;
int minP,maxP;//the minimum and the maximum size of the ellipses
int i=0;

void setup(){
  size(800,446);
  frameRate(40);
  background(0);
  img =loadImage("ocean.jpg");
  minP=2;
  maxP=50;
  imageMode(CENTER);
  noStroke();
  background(255);
  
}

void draw(){
   if(millis()<30000){
     float size=map(mouseX,0,width,minP,maxP);//the size of the ellipses grows bigger when mouse moves to the right
  //float size=map(mouseY,0,heighgt,minP,maxP);
  int X=int(random(width));
  int Y=int(random(height));
  color px=img.get(X,Y);
  fill(px,128);
  ellipse(mouseX,mouseY,size,size);
   }
   else{
     background(0);
  //red
  if(i<100){
    fill(255,0,0);
  }
  //orange
  if(i>=100&&i<200){
   fill(250,180,50); 
  }
  //yellow
  if(i>=200&&i<300){
    fill(248,251,54);
  }
  //green
  if(i>=300&&i<400){
    fill(0,251,0);
  }
  //cyan
  if(i>=400&&i<500){
    fill(54,251,156);
  }
  //blue
  if(i>=500&&i<600){
    fill(0,0,255);
  }
  //purple
  if(i>=600){
    fill(156,54,251);
  }
  ellipse(mouseX,mouseY,50,50);
 i++;
 if(i>=700) //cyclical-transformation
   i-=700;
   }
  
  
}
