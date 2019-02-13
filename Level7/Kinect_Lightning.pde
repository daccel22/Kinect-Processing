/*
  Play with the lightnings with your right hand
*/

import java.util.*;
import KinectPV2.KJoint;
import KinectPV2.*;

int sizeX,sizeY;
float bX,bY;
lightningSystem system;

KinectPV2 kinect;

void setup(){
  //frameRate(10);
  size(1000,1000);
  sizeX=1000;
  sizeY=1000;
  kinect =new KinectPV2(this);
  
  kinect.enableSkeletonDepthMap(true);
  
  kinect.init();
  system=new lightningSystem();
}
void draw(){
  background(0);
  
  //get the skeleton as an arraylist
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
  system.update(joints);
  system.addLightning();
  system.run();
}


class lightning{
  float hx,hy,tx,ty,num,wid;
  float angle;
  float ranX,ranY;
  float offsetX,offsetY;
  float a,b;
  float myX1,myY1,myX2,myY2;
  int lifeSpan=255;
  lightning(float Hx,float Hy,float Tx,float Ty,int Num){
    hx=Hx;
    hy=Hy;
    tx=Tx;
    ty=Ty;
    num=Num;
  }
  void update(){
   angle=atan2(ty-hy,tx-hx);
   a=(ty-hy)/(tx-hx);
   b=hy-a*hx;   
   //----------------------Speed of Life---------------------------
   lifeSpan-=30;
   //--------------------------------------------------------------
  }
  // if lighting is dead, remove it
  boolean isDead(){
    if(lifeSpan<0){
      return true;
    }
    else{
     return false; 
    }
  }
  void ramCor(){
    wid=random(2)+1;
    float ranlenX=random(((tx-hx)/num));
    float ranlenY=random(((tx-hx)/num));
    ranX=random((tx-hx)/num)+ranX;
     ranY=a*ranX+b;
     offsetX=random((int)ranlenX)+random(5);
     offsetY=random((int)ranlenY)+random(5);
     myX2=ranX+offsetX;
     myY2=ranY+offsetY;
  }
  void display(){
   int lucky=(int)random(num);
   
   //---------------------------color-------------------------------
   stroke(215,130,255,lifeSpan);
   //---------------------------------------------------------------
   ranX=hx+2;
   ramCor();
   //println("BEGIN myX2: "+myX2+" myY2: "+myY2);
   tLine l0=new tLine(hx,hy,myX2,myY2,wid);
   l0.update();
   l0.display();
   myX1=myX2;
   myY1=myY2;
   int i;
   for(i=0;i<num;i++){
     ramCor();
     //println("myX1: "+myX1+" myY1: "+myY1);
     //println("myX2: "+myX2+" myY2: "+myY2);
     if(i==lucky){
       bX=myX1;
       //println("bx: "+bX);
       bY=myY1;
     }
     tLine l=new tLine(myX1,myY1,myX2,myY2,wid);
     l.update();
     l.display();
     myX1=myX2;
     myY1=myY2;
   }
   myX2=tx;
   myY2=ty;
   //println("fINAL myX1: "+myX1+" myY1: "+myY1);
   //println("fINAL myX2: "+myX2+" myY2: "+myY2);
   tLine l9=new tLine(myX1,myY1,myX2,myY2,wid);
   l9.update();
   l9.display();
   
  }
  
  void run(){
   update();
   display();
  }
}

//line to form small lightning
class tLine{
  float hx,tx;//true headX, tailX
  float hy,ty;//true headY, tailY
  float dhx,dtx;//draw
  float dhy,dty;//draw
  float width_l;
  
  tLine(float h1X,float h1Y,float t1X,float t1Y,float Width1){
    hx=h1X;
    hy=h1Y;
    tx=t1X;
    ty=t1Y;
    width_l=Width1;
  }
  void update(){
     dhx=hx/width_l;
     dhy=hy/width_l;
     dtx=tx/width_l;
     dty=ty/width_l;
  }
  void display(){
    scale(width_l);
    line(dhx,dhy,dtx,dty);
    scale(1/width_l);//scale function forever
  }
  
}


//lighting family
class lightningSystem{
  ArrayList<lightning> lightnings;
  float X,Y;
  lightningSystem(){
    lightnings=new ArrayList<lightning>();
  }
  //find where new lightning is
  void update(KJoint joints){
    X=(float)joints.getX()*2;
    Y=(float)joints.getY()*2;
  }
  //new lightning join in the family
  void addLightning(){
    lightning l=new lightning(X,Y,random(sizeX),random(sizeY-Y)+1.5*Y,(int)random(10)+20);
    lightnings.add(l);    
    
    lightning l1;
    //add lightning branch
    for(int i=0;i<=(int)random(6)+1;i++){ 
      //println("i: "+i);
      l1=new lightning(bX,bY,random(sizeX),random(sizeY-bY)+1.5*bY,(int)random(10)+20);
      lightnings.add(l1);
    }
  }
  //see wihch lightning is dead
  void run(){
    Iterator<lightning> it =lightnings.iterator();
    while(it.hasNext()){
      lightning l=it.next();
      l.run();
      if(l.isDead()){
        it.remove();
      }
    }    
  }
}
