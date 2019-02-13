/*
  When your right hand come close to the patterns, the pre-loaded sounds will play
  Sometimes the sounds won't play, you can just re-open the project
*/

import java.util.*;
import KinectPV2.*;
import processing.sound.*;
SoundFile []files;

float x[];
float y[];
float r[];

KinectPV2 kinect;
float a,b,c,d;
//run Kinect_testRange to get them
float maxX=498.6;
float minX=75.45;
float maxY=396.2;
float minY=39.9;

void setup(){
  frameRate(300);
  size(1000,1000);
  background(255);
  kinect =new KinectPV2(this);
  
  kinect.enableSkeletonDepthMap(true);
  
  kinect.init();
  calFactor(maxX,minX,maxY,minY);
  x=new float[6];
  y=new float[6];
  r=new float[6];
  files=new SoundFile[6];
  //draw pattern
  x[0]=width/4+40;y[0]=height/3+60;r[0]=85;
  x[1]=width*3/4-40;y[1]=height/3+60;r[1]=50;
  x[2]=width/4+40;y[2]=height*2/3-60;r[2]=50;
  x[3]=width/2;y[3]=height/3;r[3]=50;
  x[4]=width/2;y[4]=height*2/3;r[4]=50;
  x[5]=width*3/4-40;y[5]=height*2/3-60;r[5]=50;
  
 
  //sound load
  files[0]=new SoundFile(this,"Sting.mp3");
  files[1]=new SoundFile(this,"Whistle.mp3");
  files[2]=new SoundFile(this,"Horn.mp3");
  files[3]=new SoundFile(this,"Dog.mp3");
  files[4]=new SoundFile(this,"SOS.mp3");
  files[5]=new SoundFile(this,"Bell.mp3");
}

void draw(){
  ArrayList<KSkeleton> skeletonArray =kinect.getSkeletonDepthMap();
  
  for(int i=0;i<skeletonArray.size();i++){
    KSkeleton skeleton =(KSkeleton) skeletonArray.get(i);
    
    if(skeleton.isTracked()){
      KJoint[] joints=skeleton.getJoints();
      
      playSound(joints[KinectPV2.JointType_HandRight],joints[KinectPV2.JointType_HandLeft]);  
   
    }
  }
  
}

void playSound(KJoint handR,KJoint handL){
  float X1,Y1;//right hand
  float X2,Y2;//left hand
  X1=(float)handR.getX()*a+b;
  Y1=(float)handR.getY()*c+d;
  X2=(float)handL.getX()*a+b;
  Y2=(float)handL.getY()*c+d;
  
  background(255);
  drawBackground();
  fill(0,0,255);//blue
  ellipse(X1,Y1,30,30);//right hand
  fill(0,255,0);//green
  ellipse(X2,Y2,30,30);//left hand
  for(int i=0;i<6;i++){
    if((((X1-x[i])*(X1-x[i])+(Y1-y[i])*(Y1-y[i]))<r[i]*r[i])||(((X2-x[i])*(X2-x[i])+(Y2-y[i])*(Y2-y[i]))<r[i]*r[i])){
    files[i].play();
    delay(500);
    files[i].stop();
  }
  }
}

void calFactor(float maxX,float minX,float maxY,float minY){
  a=width/(maxX-minX);
  b=-minX*width/(maxX-minX);
  c=height/(maxY-minY);
  d=-minY*height/(maxY-minY);
}

void drawBackground(){
  fill(70,20,240);
  ellipse(x[0],y[0],r[0],r[0]);
  for(int i=1;i<=5;i++){
    fill(255*i/6,255*(6-i)/6,255*(abs(i*2-6))/6); 
    polygon(x[i],y[i],r[i],i+2);
  }
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
