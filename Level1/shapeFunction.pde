import java.util.*;

void setup(){
  size(1000,1000);
  background(255,255,255);
}

void draw(){
  stroke(255,0,0);
  rect(120,302,120,430);
  noStroke();
  rect(320,302,230,430);
  fill(0,255,0);
  ellipse(700,430,560,560);
  noFill();
  fill(0,0,255);
  beginShape();
  vertex(720,230);
  vertex(120,389);
  vertex(302,502);
  vertex(204,23);
  endShape();
  noFill();
}
