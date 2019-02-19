/*
  Grow the tree with the upward movement of your right hand
*/

import java.util.*;
import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 kinect;
float a,b,c,d;
//run Kinect_testRange to get them
float maxX=498.6;
float minX=75.45;
float maxY=400;
float minY=30;
float theta;//radian of rotate angle
float treeSize;//how big the tree is
float factor;//pattern
float strong;//seedling height
float angle;//speed of rotation
void setup(){
  size(900,900);
  frameRate(100);
  treeSize=220;
  factor=0.55;
  strong=1.68;
  angle=130;
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
      
      drawTree(joints[KinectPV2.JointType_HandRight]);  
      
    }
  }
}
void drawTree(KJoint joints){
  background(0);
  stroke(255);
  float Y;
  Y=(float)joints.getY()*c+d;
  if(Y>height*factor*strong){
    line(width/2,height,width/2,Y);
  }
  else{
  float a = (Y / (float) height) * angle;
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(width/2,height);
  // Draw a line 120 pixels
  line(0,0,0,-treeSize);
  // Move to the end of that line
  translate(0,-treeSize);
  // Start the recursive branching!
  branch(treeSize);
  }
}
void calFactor(float maxX,float minX,float maxY,float minY){
  a=width/(maxX-minX);
  b=-minX*width/(maxX-minX);
  c=height/(maxY-minY);
  d=-minY*height/(maxY-minY);
}
void branch(float h) {
  // Each branch will be factor the size of the previous one
  h *= factor;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "middle" this time!
    pushMatrix();    
    rotate(0);   
    line(0, 0, 0, -h);  
    translate(0, -h); 
    branch(h);      
    popMatrix();
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}
