/*
  Example about how to record animation
  After run this program, you should copy all the SVG file 
  in the /data folder to loadSVG's data folder and run loadSVG.
  then you will see the animation you recorded
  ! you should clean the data folder before you run it or
  you should create a seperate folder to save the SVG files and change the save path
  in line 41
  ! you should see (console or in the folder) how many svg files you saved and change the value of 
  variable num in loadSVG program
*/
import processing.svg.*;
import java.util.*;
import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 kinect;

int i=0;
int num=0;
float a,b,c,d;
//run Kinect_testRange to get them
float maxX=498.6;
float minX=75.45;
float maxY=396.2;
float minY=39.9;


void setup() {
  size(1000,1000); 
 frameRate(40);
 background(0);
 kinect =new KinectPV2(this);
 kinect.enableSkeletonDepthMap(true);
 kinect.init();
 calFactor(maxX,minX,maxY,minY);
}

void draw() {
  // Draw something good here
  beginRecord(SVG, "/data/animation"+num+".svg");
  ArrayList<KSkeleton> skeletonArray =kinect.getSkeletonDepthMap();
  
  for(int i=0;i<skeletonArray.size();i++){
    KSkeleton skeleton =(KSkeleton) skeletonArray.get(i);
    
    if(skeleton.isTracked()){
      KJoint[] joints=skeleton.getJoints();
      
      drawHand(joints[KinectPV2.JointType_HandRight]);  
      //drawHand(joints[KinectPV2.JointType_HandLeft]);
    }
  }
 
  endRecord();
  println("number of SVG files: "+num);//help figure how many SVG files you saved
}
void drawHand(KJoint joints){
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
  if(i>=600&&i<700){
    fill(156,54,251);
  }
  ellipse(joints.getX()*a+b,joints.getY()*c+d,50,50);
  
  i++;
  num++;
  if(i>=700)
    i-=700;
}

//calculate the factors to make the movement in window match the movement in reality.
//i.e. make full use of window's size 
void calFactor(float maxX,float minX,float maxY,float minY){
  a=width/(maxX-minX);
  b=-minX*width/(maxX-minX);
  c=height/(maxY-minY);
  d=-minY*height/(maxY-minY);
}
