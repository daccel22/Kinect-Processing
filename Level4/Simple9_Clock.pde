/*
  Move the minute hand with your mouse and trigger the ring when it moves to 12
  Hour hand will move with minute hand but limited to 3 to 4, you can change it if you want
*/
import processing.sound.*;
import java.util.*;

SoundFile file;

String one="I";
String two="II";
String three="III";
String four="IV";
String five="V";
String six="VI";
String seven="VII";
String eight="VIII";
String nine="IX";
String ten="X";
String eleven="XI";
String twelve="XII";
float hH;//half height of text
float rectH,rectW;//Height and Width of the minute pointer
float recth,rectw;//height and width of the hour pointer
float offSet;//away from circle
float angle;//angle of rotatoin
float disp;

void setup(){
  size(1000,1000);
  background(0);
  textFont(createFont("Eden Mills Italic.ttf",90));
  textAlign(CENTER,CENTER);
  hH=(textAscent()+textDescent())/2;
  rectW=300;
  rectH=10;
  rectw=200;
  recth=25;
  //rectMode(CENTER);
  offSet=7;
  disp=20;
  file=new SoundFile(this,"clock.mp3");
}

void draw(){
  drawClock();
  drawPointer();             
  nowTime();
}

//Trigger the ring when the minute hand reach 12
void nowTime(){
  if(angle>-PI/2-0.05&&angle<-PI/2+0.05){
    file.play();
    delay(1000);
    file.stop();
    }
   
}

//Draw minute hand and hour hand
void drawPointer(){
  angle=-atan2(mouseX-width/2,mouseY-height/2)+PI/2;
  translate(width/2,height/2);
  rotate(angle/12+PI/24);
  rect(-recth/2,-recth/2,rectw,recth);
  rotate(-PI/24);
  rotate(11*angle/12);
  translate(abs(sin(-angle)*disp/2),cos(-angle)*disp/2);
  rect(-rectH/2,-rectH/2,rectW,rectH);
  
  
}

void drawClock(){
  noStroke();
  //draw background of the clock
  fill(255);
  ellipse(width/2,height/2,745,745);
  fill(0);
  ellipse(width/2,height/2,730,730);
  fill(255);
  ellipse(width/2,height/2,700,700);
  fill(0);
  ellipse(width/2,height/2,480,480);
  fill(255);
  ellipse(width/2,height/2,350,350);
  fill(0);
  ellipse(width/2,height/2,330,330);
  fill(255);
  ellipse(width/2,height/2,270,270);
  fill(0);
  ellipse(width/2,height/2,160,160);
  fill(255);
  ellipse(width/2,height/2,120,120);
  fill(0);
  ellipse(width/2,height/2,70,70);
  
  //draw number
  fill(0);
  text(one,width/2+175-textWidth(one)/2,240);
  text(two,width/2+300-textWidth(two),height/2-150);
  text(three,width/2+350-textWidth(three),height/2);
  text(four,width/2+303.1-textWidth(four)/2-offSet,height/2+175-offSet);
  text(five,width/2+175-textWidth(five)/2-offSet,height/2+303.1-hH/2-offSet);
  text(six,width/2,height/2+350-hH);
  text(seven,width/2-175+textWidth(seven)/2,height/2+303.1-hH/2-offSet);
  text(eight,width/2-303+textWidth(eight)/2,height/2+175-offSet);
  text(nine,width/2-365+textWidth(nine),height/2);
  text(ten,width/2-300+textWidth(ten)/2,height/2-150);
  text(eleven,width/2-200+textWidth(eleven)/2,240);
  text(twelve,width/2,190);
}
