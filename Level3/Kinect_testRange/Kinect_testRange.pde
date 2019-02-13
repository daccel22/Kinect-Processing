/*
  Run this program to get the maxX, minX, maxY, minY
  If you don't want to trace the range of right hand, 
  you should change the code in line 42
*/
import java.util.*;
import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 kinect;
int count=0;
float maxX=-9999,maxY=-9999;
float minX=9999,minY=9999;

void setup(){
  frameRate(10);
  size(500,500);
  background(255);
  kinect =new KinectPV2(this);
  
  kinect.enableSkeletonDepthMap(true);
  
  kinect.init();
  
}
void draw(){
  count++;
  fill(random(255),random(255),random(255));
  ellipse(width/6*count,height/2,50,50);
  if(count==6){
    background(255);
    count-=6;
  }
  ArrayList<KSkeleton> skeletonArray =kinect.getSkeletonDepthMap();
  
  for(int i=0;i<skeletonArray.size();i++){
    KSkeleton skeleton =(KSkeleton) skeletonArray.get(i);
    
    if(skeleton.isTracked()){
      KJoint[] joints=skeleton.getJoints();
      
      testRange(joints[KinectPV2.JointType_HandRight]);
    }
  }
  
}

void testRange(KJoint joints){
  
  if(joints.getX()<minX)
    minX=joints.getX();
  if(joints.getX()>maxX)
    maxX=joints.getX();
  if(joints.getY()<minY)
    minY=joints.getY();
  if(joints.getY()>maxY)
    maxY=joints.getY();
  println("maxX: "+maxX+"  minX: "+minX+"  maxY: "+maxY+"  minY: "+minY);
}
