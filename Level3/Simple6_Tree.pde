/*
  Interesting transformation of the tree
  Reference to the example on the website of processing
*/

float theta;//radian of rotate angle
float treeSize;//how big the tree is
float factor;//pattern
float strong;//seedling height
float angle;//speed of rotation
void setup() {
  size(900,900);
  frameRate(100);
  treeSize=220;
  factor=0.55;
  strong=1.68;
  angle=130;
}

void draw() {
  background(0);
  stroke(255);
  if(mouseY>height*factor*strong){
    line(width/2,height,width/2,mouseY);
  }
  else{
  float a = (mouseY / (float) height) * angle;
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(width/2,height);
  // Draw a line 120 pixels
  line(0,0,0,-treeSize);
  // Move to the end of that line
  translate(0,-treeSize);
  // Start the recursive branching!
  branch(treeSize);
  }
}

void branch(float h) {
  // Each branch will be factor the size of the previous one
  h *= factor;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "middle" this time!
    pushMatrix();   
    rotate(0);  
    line(0, 0, 0, -h); 
    translate(0, -h); 
    branch(h);       
    popMatrix(); 
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}
