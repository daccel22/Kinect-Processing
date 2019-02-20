/*
  Shake the text with your right hand
  Background music: Freedom - Beyonce
  When your right hand comes close to the text, it will shake
*/

import java.util.*;
import KinectPV2.KJoint;
import KinectPV2.*;
import processing.sound.*;

SoundFile freedom;
String str="Shaking!";
float x,y;//coordinate of the left-most and up-most of the text
float hx,vy;//half width and half heihgt of the text
float keyB;//width of the key
float shakeRange;

KinectPV2 kinect;
float a,b,c,d;
//run Kinect_testRange to get them
float maxX=498.6;
float minX=75.45;
float maxY=396.2;
float minY=39.9;

void setup(){
  size(1000,1000);
  textFont(createFont("Eden Mills Italic.ttf",180));
  textAlign(CENTER,CENTER);
  
  hx=textWidth(str)/2;
  vy=(textAscent()+textDescent())/2;
  noStroke();
  x=width/2;
  y=height/2;
  keyB=width/12;
  shakeRange=8;
  
  kinect =new KinectPV2(this);
  
  kinect.enableSkeletonDepthMap(true);
  
  kinect.init();
  calFactor(maxX,minX,maxY,minY);
  freedom =new SoundFile(this,"Freedom.wav");
  freedom.play();
}

void draw(){
  if(millis()>30000)
    freedom.stop();
  ArrayList<KSkeleton> skeletonArray =kinect.getSkeletonDepthMap();
  
  for(int i=0;i<skeletonArray.size();i++){
    KSkeleton skeleton =(KSkeleton) skeletonArray.get(i);
    
    if(skeleton.isTracked()){
      KJoint[] joints=skeleton.getJoints();
      
      drawHand(joints[KinectPV2.JointType_HandRight]);  
      
    }
  }
}


void drawHand(KJoint joints){
  float X,Y;
  X=(float)joints.getX()*a+b;
  Y=(float)joints.getY()*c+d;
  
  drawPiano();//background
  textShake(X,Y,x,y);
  fill(0,255,0);
  ellipse(X,Y,20,20);//know where the hand is
}

//draw the background
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


void calFactor(float maxX,float minX,float maxY,float minY){
  a=width/(maxX-minX);
  b=-minX*width/(maxX-minX);
  c=height/(maxY-minY);
  d=-minY*height/(maxY-minY);
}
