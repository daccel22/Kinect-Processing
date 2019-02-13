/*
 Play the pre-loaded sounds when move the mouse to the patterns
*/
import processing.sound.*;//import the library
SoundFile []files;


float x[];
float y[];
float r[];

void setup(){
  background(255);
  size(1000,1000);
  //you can add more sound by pre-load more sound files and add more patterns
  x=new float[6];
  y=new float[6];
  r=new float[6];
  files=new SoundFile[6];
  
  //draw patterns
  x[0]=width/4+40;y[0]=height/3+60;r[0]=85;
  x[1]=width*3/4-40;y[1]=height/3+60;r[1]=50;
  x[2]=width/4+40;y[2]=height*2/3-60;r[2]=50;
  x[3]=width/2;y[3]=height/3;r[3]=50;
  x[4]=width/2;y[4]=height*2/3;r[4]=50;
  x[5]=width*3/4-40;y[5]=height*2/3-60;r[5]=50;
  
  fill(random(255),random(255),random(255));
  ellipse(x[0],y[0],r[0],r[0]);
  for(int i=1;i<=5;i++){
    fill(random(255),random(255),random(255)); 
    polygon(x[i],y[i],r[i],i+2);
  }
  
  //load sound files
  files[0]=new SoundFile(this,"Sting.mp3");
  files[1]=new SoundFile(this,"Whistle.mp3");
  files[2]=new SoundFile(this,"Horn.mp3");
  files[3]=new SoundFile(this,"Dog.mp3");
  files[4]=new SoundFile(this,"SOS.mp3");
  files[5]=new SoundFile(this,"Bell.mp3");
  
}

void draw(){
  playSound();
}

void playSound(){
  for(int i=0;i<6;i++){
    //see if mouse is in the range of pattern
    if(((mouseX-x[i])*(mouseX-x[i])+(mouseY-y[i])*(mouseY-y[i]))<r[i]*r[i]){
    files[i].play();
    delay(500);
    files[i].stop();
  }
  }
}


void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
