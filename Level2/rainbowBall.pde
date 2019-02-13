/*
  The ball will move with mouse and change color as well
*/


int i=0;
void setup(){
 size(1000,1000); 
 frameRate(40);
 background(0);
}
void draw(){
  
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
  if(i>=600){
    fill(156,54,251);
  }
  ellipse(mouseX,mouseY,50,50);
 i++;
 if(i>=700) //cyclical-transformation
   i-=700;
}
