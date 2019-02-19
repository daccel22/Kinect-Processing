/*
  The background is divided into four parts
  Change the arrangement of the four parts with the movement of your head
*/

import java.util.*;
import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 kinect;
float a,b,c,d;
//run Kinect_testRange to get them
float maxX=498.6;
float minX=75.45;
float maxY=396.2;
float minY=39.9;

void setup(){
  size(1000,1000);
  frameRate(1000);
  kinect =new KinectPV2(this);
  
  kinect.enableSkeletonDepthMap(true);
  
  kinect.init();
  calFactor(maxX,minX,maxY,minY);
}
void draw(){
  ArrayList<KSkeleton> skeletonArray =kinect.getSkeletonDepthMap();
  
  for(int i=0;i<skeletonArray.size();i++){
    KSkeleton skeleton =(KSkeleton) skeletonArray.get(i);
    
    if(skeleton.isTracked()){
      KJoint[] joints=skeleton.getJoints();
      
      background(joints[KinectPV2.JointType_Head]);  
      
    }
  }
}

void background(KJoint joints){
  float X=joints.getX()*a+b;
  float Y=joints.getY()*c+d;
  fill(random(255),random(255),random(255));
  rect(0,0,X,Y);
  fill(random(255),random(255),random(255));
  rect(X,0,width,Y);
  fill(random(255),random(255),random(255));
  rect(0,Y,X,height);
  fill(random(255),random(255),random(255));
  rect(X,Y,width,height);
  delay(300);
}

void calFactor(float maxX,float minX,float maxY,float minY){
  a=width/(maxX-minX);
  b=-minX*width/(maxX-minX);
  c=height/(maxY-minY);
  d=-minY*height/(maxY-minY);
}
