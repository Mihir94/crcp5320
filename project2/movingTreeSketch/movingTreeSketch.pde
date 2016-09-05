void setup() {
  background(255); 
  size(1440, 900); 
}

void draw() {
  trunk1();
  branch();
  noLoop(); 
}

void trunk1() {
  translate(width - 300, height); 
  line(0, 0, 0, -300); 
  translate(0, -300); 
}

void branch(/*float branchLength*/) {
  //branchLength = branchLength * .6; 
  
  pushMatrix(); 
  rotate(PI / 3); 
  line(0, 0, 0, 250); 
  //translate(0, 250); 
  popMatrix(); 
    
  pushMatrix(); 
  rotate(PI/2.2); 
  line(0, 0, 0, 200); 
  popMatrix(); 
  
}