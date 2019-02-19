import java.util.*;

void setup(){
  size(1000,1000);
  background(255);
}
void draw(){
  rect(100,244,390,209);
  //triangle(20,30,42,324,123,23);
  //ellipse(230,340,300,300);//draw a circle
  //circle(220,360,230);//draw a circle
  //ellipse(230,340,100,300);//draw an ellipse
  //polygon(200,200,235,6);
  
}


//x,y: center of the polygon's cordinate
//radius: radius of the polygon
//npoints: the number of vertexs
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
