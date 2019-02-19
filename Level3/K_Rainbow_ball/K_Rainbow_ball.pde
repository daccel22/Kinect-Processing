/*
  Move the ball with your right hand 
  or you can move the ball with other parts of your body
  by modifying the code 
  (specifically the code in line 41, 
  i.e. drawHand(joints[KinectPV2.JointType_HandRight]); ) 
*/
import java.util.*;
import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 kinect;

int i=0;
float a,b,c,d;
//run Kinect_testRange to get them
float maxX=498.6;
float minX=75.45;
float maxY=396.2;
float minY=39.9;


void setup(){
 size(1000,1000); 
 frameRate(40);
 background(0);
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
      
      drawHand(joints[KinectPV2.JointType_HandRight]);  
      //drawHand(joints[KinectPV2.JointType_HandLeft]);
    }
  }
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
