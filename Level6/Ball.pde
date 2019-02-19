/*
  Play with the bouncing ball with your mouse
  The color of the ball will change when the ball touch the wall
  If you don't hit the ball, it will slow down
*/
import java.util.*;
ball ball;
float force;
float weak;

void setup(){
  size(800,800);
  ball=new ball();
  ball.initial();
  background(0);
  fill(255,0,0);
  force=100;
  weak=0.85;
  noStroke();
}
void draw(){
  background(255);
  ball.update();
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
  
  void bounce(){
    float dis=distance(mouseX,mouseY);
    if(dis<=r){
      u+=(x-mouseX)/dis*force;
      v+=(y-mouseY)/dis*force;
      //fill(random(255),random(255),random(255));
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
  
  void update(){
    wall();
    bounce();
    //update the coordinate of center
    x+=u*dt;
    y+=v*dt;
    //draw the ball
    ellipse(x,y,r,r);
  }
  
}
