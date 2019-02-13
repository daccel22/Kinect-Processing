/*
  Reference to the website of processing
  Draw the background with the color in the pre-loaded picture
  The size of ellipse will become bigger when your right hand move to the right
*/
import java.util.*;
import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 kinect;
PImage img;
int minP,maxP;

float a,b,c,d;
//run Kinect_testRange to get them
float maxX=498.6;
float minX=75.45;
float maxY=396.2;
float minY=39.9;

void setup(){
  size(800,446);//shoud match the size of image
  img =loadImage("ocean.jpg");
  minP=2;
  maxP=50;
  imageMode(CENTER);
  noStroke();
  background(255);
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
      
      drawPoint(joints[KinectPV2.JointType_HandRight]);  
      //drawPoint(joints[KinectPV2.JointType_HandLeft]);
    }
  }
}
void drawPoint(KJoint joints){
  //change the size of ellipse with X
  float size=map(joints.getX(),0,width,minP,maxP);
  //float size=map(joints.getY(),0,heighgt,minP,maxP);
  int X=int(random(width));
  int Y=int(random(height));
  //get the color from the image randomly
  color px=img.get(X,Y);
  fill(px,128);
  ellipse(joints.getX(),joints.getY(),size,size);
}


void calFactor(float maxX,float minX,float maxY,float minY){
  a=width/(maxX-minX);
  b=-minX*width/(maxX-minX);
  c=height/(maxY-minY);
  d=-minY*height/(maxY-minY);
}
