/*
  Divide the background into four parts.
  The size of the four parts will change with the movement of mouse.
  The colors of the four parts will change randomly.
*/
import java.util.*;

void setup(){
 size(1000,1000);
 frameRate(1000);
}

void draw(){
  //upper left
  fill(random(255),random(255),random(255));
  rect(0,0,mouseX,mouseY);
  //upeer right
  fill(random(255),random(255),random(255));
  rect(mouseX,0,width,mouseY);
  //bottom left
  fill(random(255),random(255),random(255));
  rect(0,mouseY,mouseX,height);
  //bottom right
  fill(random(255),random(255),random(255));
  rect(mouseX,mouseY,width,height);
  //hold for 0.3 second
  delay(300);
}
