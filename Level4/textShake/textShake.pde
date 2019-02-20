/*
  Make the text shake with your mouse
  Background music: Freedom -Beyonce
  Reference to the example on the website of processing
*/

import java.util.*;
import processing.sound.*;

SoundFile freedom;
String str="Shaking!";
float x,y;//coordinate of the text
float hx,vy;//half width and half heihgt of the text
float keyB;//width of the key
float shakeRange;//The farthest text could go
void setup(){
  size(1000,1000);
  
  //load the textFont
  //you could download whatever you want
  textFont(createFont("Eden Mills Italic.ttf",180));
  textAlign(CENTER,CENTER);
  
  hx=textWidth(str)/2;
  vy=(textAscent()+textDescent())/2;
  noStroke();
  x=width/2;
  y=height/2;
  keyB=width/12;
  shakeRange=8;
  freedom =new SoundFile(this,"Freedom.wav");
  freedom.play();
}
void draw(){
  drawPiano();//background
  textShake(mouseX,mouseY,x,y);
  if(millis()>30000)
    freedom.stop();
}

//draw the backgronud
void drawPiano(){
 for(int i=0;i<(int)width/keyB;i++){
   if(i%2==0){
     fill(255);
   }
   else{
     fill(0);
   }
   rect(i*keyB,0,(i+1)*keyB,height);
 }
}

void textShake(float x,float y,float x1,float y1){
  if(abs(x-x1)<hx&&abs(y-y1)<vy){
    x1+=random(-shakeRange,shakeRange);
    y1+=random(-shakeRange,shakeRange);
  }
  //Constrain the range of the shake or text could be shaked out of the screen
  if(x1>width/2+hx){
    x1-=shakeRange;
  }
  if(x1<width/2-hx){
    x1+=shakeRange;
  }
  if(y1<height/2-vy){
   y1+=shakeRange; 
  }
  if(y1>height/2+vy){
    y1-=shakeRange;
  }
  fill(250,35,53);
  text(str,x1,y1);
}
