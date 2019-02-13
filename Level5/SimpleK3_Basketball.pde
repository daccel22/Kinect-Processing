/*
  Move the pre-loaded picture of basketball with your right hand
*/
import java.util.*;
import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 kinect;
PImage ball;
float a,b,c,d;
//run Kinect_testRange to get them
float maxX=498.6;
float minX=75.45;
float maxY=396.2;
float minY=39.9;


void setup(){
  frameRate(200);
  size(2000,2000);
  background(255);
  kinect =new KinectPV2(this);
  
  kinect.enableSkeletonDepthMap(true);
  
  kinect.init();
  //load the basketball image
  ball=loadImage("basketball.jpg");
  calFactor(maxX,minX,maxY,minY);
}

void draw(){
  ArrayList<KSkeleton> skeletonArray =kinect.getSkeletonDepthMap();
  
  for(int i=0;i<skeletonArray.size();i++){
    KSkeleton skeleton =(KSkeleton) skeletonArray.get(i);
    
    if(skeleton.isTracked()){
      KJoint[] joints=skeleton.getJoints();
      
      drawBall(joints[KinectPV2.JointType_HandRight]);        
    }
  }
}

void drawBall(KJoint joints){
  background(255);
  float X,Y;
  X=(float)joints.getX()*a+b;
  Y=(float)joints.getY()*c+d;
  image(ball,X,Y);
  
}

void calFactor(float maxX,float minX,float maxY,float minY){
  a=width/(maxX-minX);
  b=-minX*width/(maxX-minX);
  c=height/(maxY-minY);
  d=-minY*height/(maxY-minY);
}
