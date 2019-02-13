/*
  Play with the bouncing ball with your right hand
  The color of the ball will change when the ball touch the wall
  If you don't hit the ball, it will slow down
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

ball ball;
float force;
float weak;

void setup(){
  size(1000,1000);
  ball=new ball();
  ball.initial();
  background(0);
  fill(255,0,0);
  force=500;
  weak=0.85;
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
      
      background(255);
      ball.update(joints[KinectPV2.JointType_HandRight]);
        
    }
  }
}

class ball{
  float x,y;//coordinate of center
  float r;//radius
  float u,v;//velocity u: horizontal velocity v: vertical velocity
  float dt;
  float dis;//distance between center of circle and mouse
  float distance(float x1,float y1){
    dis=sqrt((x1-x)*(x1-x)+(y1-y)*(y1-y));
    return dis;
  }
  void initial(){
    r=100;
    u=200;
    v=100;
    x=width/2;
    y=height/2;
    dt=0.01;
  }
  
  void bounce(float X1,float Y1){
    float dis=distance(X1,Y1);
    if(dis<=r){
      u+=(x-X1)/dis*force;
      v+=(y-Y1)/dis*force;
      fill(random(255),random(255),random(255));
    }
  }
  
  //see if ball hit the wall
  void wall(){
    if(x<=r&&u<0){
      u=-u*weak;
      fill(random(255),random(255),random(255));
    }
    if(x>=width-r&&u>0){
      u=-u*weak;
      fill(random(255),random(255),random(255));
    }
    if(y<=r&&v<0){
      v=-v*weak;
      fill(random(255),random(255),random(255));
    }
    if(y>=height-r&&v>0){
      v=-v*weak;
      fill(random(255),random(255),random(255));
    }
  }
  
  void update(KJoint joints){
    wall();
    bounce(joints.getX()*a+b,joints.getY()*c+d);
    //update the coordinate of center
    x+=u*dt;
    y+=v*dt;
    //draw the ball
    ellipse(x,y,r,r);
    ellipse(joints.getX()*a+b,joints.getY()*c+d,10,10);
  }
  
}




void calFactor(float maxX,float minX,float maxY,float minY){
  a=width/(maxX-minX);
  b=-minX*width/(maxX-minX);
  c=height/(maxY-minY);
  d=-minY*height/(maxY-minY);
}
