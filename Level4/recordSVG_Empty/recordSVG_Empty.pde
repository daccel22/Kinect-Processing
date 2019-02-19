/*
  Empty program to help write record program for your animation
  After run this program, you should copy all the SVG file 
  in the /data folder to loadSVG's data folder and run loadSVG.
  then you will see the animation you recorded
  ! you should clean the data folder before you run it or
  you should create a seperate folder to save the SVG files and change the save path
  in line 36
  ! you should see (console or in the folder) how many svg files you saved and change the value of 
  variable num in loadSVG program
*/
import processing.svg.*;
import java.util.*;
import KinectPV2.KJoint;
import KinectPV2.*;

KinectPV2 kinect;

int i=0;
int num=0;
float a,b,c,d;
//run Kinect_testRange to get them
float maxX=498.6;
float minX=75.45;
float maxY=396.2;
float minY=39.9;


void setup() {
  frameRate(40);//it better to set the same frameRate in the record and load program
 
}

void draw() {
  
  beginRecord(SVG, "/data/animation"+num+".svg");
  
  /*
    Create your animation here!
  */
  
  endRecord();
  println("number of SVG files: "+num);//help figure how many SVG files you saved
}
