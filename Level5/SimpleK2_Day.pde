/*
  Shift the background by moving your right hand to  the left 
  or move up your right hand
*/

import java.util.*;
import KinectPV2.KJoint;
import KinectPV2.*;

float threshold=30;
int flag=0;
PImage bg1,bg2,bg3;
int init=0;
float X,Y;
float pX,pY;

KinectPV2 kinect;

void setup(){
   frameRate(100);
   size(1000,1000);
   kinect =new KinectPV2(this);
   kinect.enableSkeletonDepthMap(true);
   kinect.init();
   bg1=loadImage("morning.jpg");
   bg2=loadImage("noon.jpg");
   bg3=loadImage("night.jpg");
   background(bg1);
}

void draw(){
  ArrayList<KSkeleton> skeletonArray =kinect.getSkeletonDepthMap();
  
  for(int i=0;i<skeletonArray.size();i++){
    KSkeleton skeleton =(KSkeleton) skeletonArray.get(i);
    
    if(skeleton.isTracked()){
      KJoint[] joints=skeleton.getJoints();
      
      shiftBackground(joints[KinectPV2.JointType_HandRight]);  
      
    }
  }
}

void shiftBackground(KJoint joints){
  X=(float)joints.getX();
  Y=(float)joints.getY();
  //initialize the pX, pY
  if(init==0){
    pX=(float)joints.getX();
    pY=(float)joints.getY();
  }
  init++;
  //if move right or move up
  //circulate the background
  if(pX-X>threshold||pY-Y>threshold){
    if(flag==0){
     background(bg1);
   }
   if(flag==1){
     background(bg2);
   }
   if(flag==2){
     background(bg3);
   }
   flag++;
   if(flag>2) flag-=3;
  }
  pX=X;
  pY=Y;
}
