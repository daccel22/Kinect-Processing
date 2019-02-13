/*
  The background image will change randomly or you can make it change 
  with mouse-click or mouse-move by modifying the code(maybe do it as an exercise).
*/


int flag;
PImage bg1,bg2,bg3;
int pFlag;//previous  flag
void setup(){
  size(1000,1000);
  //the size of pictures shoud be the same and also match the size of window
  bg1=loadImage("morning.jpg");
  bg2=loadImage("noon.jpg");
  bg3=loadImage("night.jpg");
  background(bg1);//give an initial background image instead of a grey background at the beginning
  pFlag=0;
}

void draw(){
  //make the background change every time
  do{
   flag=(int)random(3);
  }while(flag==pFlag);
  
  //println(flag);
   if(flag==0){
     background(bg1);
   }
   if(flag==1){
     background(bg2);
   }
   if(flag==2){
     background(bg3);
   }
   pFlag=flag;
   delay(1000);//hold for one second
}
