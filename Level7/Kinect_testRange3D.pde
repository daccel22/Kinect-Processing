/*
  Run this program to get the maxX, minX, maxY, minY
  If you don't want to trace the range of right hand, 
  you should change the code in line 42
*/

import KinectPV2.*;
import java.util.*;

KinectPV2 kinect;
int count=0;
float a,b,c,d;//varied with circumstance
float maxX=-9999,maxY=-9999,maxZ=-9999;
float minX=9999,minY=9999,minZ=9999;

void setup(){
  background(255);
  kinect=new KinectPV2(this);
  frameRate(10);
  kinect.enableSkeleton3DMap(true);
  
  kinect.init();
  size(500,500);
  
}

void draw(){
  count++;
  fill(random(255),random(255),random(255));
  ellipse(width/6*count,height/2,50,50);
  if(count==6){
    background(255);
    count-=6;
  }
  ArrayList<KSkeleton> skeletonArray =kinect.getSkeleton3d();
  
  for(int i=0;i<skeletonArray.size();i++){
    KSkeleton skeleton =(KSkeleton) skeletonArray.get(i);
    
    if(skeleton.isTracked()){
      KJoint[] joints=skeleton.getJoints();     
      testRange3D(joints[KinectPV2.JointType_HandRight]);           
    }
  }
     
}

void testRange3D(KJoint joints){
  if(joints.getX()<minX)
    minX=joints.getX();
  if(joints.getX()>maxX)
    maxX=joints.getX();
  if(joints.getY()<minY)
    minY=joints.getY();
  if(joints.getY()>maxY)
    maxY=joints.getY();
  if(joints.getZ()<minZ)
    minZ=joints.getZ();
  if(joints.getZ()>maxZ)
    maxZ=joints.getZ();
  println("maxX: "+maxX+"  minX: "+minX+"  maxY: "+maxY+"  minY: "+minY+" maxZ: "+maxZ+" minZ: "+minZ);
}
