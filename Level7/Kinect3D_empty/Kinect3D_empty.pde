import KinectPV2.*;
import java.util.*;

KinectPV2 kinect;
float a,b,c,d;//varied with circumstance
//run Kinect_testRange to get them
float maxX=1.92;
float minX=-0.84;
float maxY=1;
float minY=-0.899;

void setup(){
  background(0);
  kinect=new KinectPV2(this);
  frameRate(200);
  kinect.enableSkeleton3DMap(true);
  
  kinect.init();
  size(1000,1000,P3D);
  calFactor(maxX,minX,maxY,minY);
}

void draw(){
  background(0);
  ArrayList<KSkeleton> skeletonArray =kinect.getSkeleton3d();
  
  for(int i=0;i<skeletonArray.size();i++){
    KSkeleton skeleton =(KSkeleton) skeletonArray.get(i);
    
    if(skeleton.isTracked()){
      KJoint[] joints=skeleton.getJoints();
      
      KJoint handR=joints[KinectPV2.JointType_HandRight];
      ellipse(handR.getX()*a+b,handR.getY()*c+d,100,100);//y is in opposite direction
      
    }
  }
     
}
//3D: y is in opposite direction compared to 2D
void calFactor(float maxX,float minX,float maxY,float minY){
  a=width/(maxX-minX);
  b=-minX*width/(maxX-minX);
  c=-height/(maxY-minY);
  d=-minY*height/(maxY-minY);
}
