PShape bot;
int i=0;
int num=632;
void setup() {
  size(1000,1000);
  frameRate(40);
  
} 

void draw(){
  bot = loadShape("animation"+i+".svg");
  background(102);
  shape(bot, 0,0);  // Draw at coordinate (110, 90) at size 100 x 100
  i++;  
  if(i>num){
   noLoop(); 
  }
}
