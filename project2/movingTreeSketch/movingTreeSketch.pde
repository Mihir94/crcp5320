float angle; 
float bLength; 
int counter = 5; 
float weight = 5.0; 

void setup() {
  background(255); 
  size(1440, 900); 
}

void draw() {
  trunk1();
  weight = 4.5; 
  branch1(300);
  //branch1(bLength); 
  //branch1(290); 
  noLoop(); 
}

void trunk1() {
  strokeWeight(weight); 
  translate(width - 300, height); 
  line(0, 0, 0, -300); 
  translate(0, -300); 
}

void branch1(float branchLength) {
  if(weight < .1) {
    weight = .1; 
  }

  angle = random(0, PI/3);
  //line(0, 0, 0, -branchLength); 
  //translate(0, -branchLength); 
  branchLength = branchLength * .6; 

  if(branchLength > 2) {
    if(weight < .1) {
      weight = .1; 
    } else { 
      weight -= .1; 
      strokeWeight(weight); 
    }
    pushMatrix(); 
    //rotate(PI/6);
    rotate(angle); 
    line(0, 0, 0, -branchLength); 
    translate(0, -branchLength); 
    branch1(branchLength); 
    popMatrix(); 
    
    weight = 4.5; 
    if(weight < .1) {
      weight = .1; 
    } else { 
      weight -= .1; 
      strokeWeight(weight); 
    }
    pushMatrix(); 
    //rotate(-(PI/6));
    rotate(-angle); 
    line(0, 0, 0, -branchLength); 
    translate(0, -branchLength); 
    branch1(branchLength); 
    popMatrix(); 
    
    
  }  
  /*pushMatrix(); 
  rotate(PI / 3); 
  line(0, 0, 0, 250); 
  //translate(0, 250); 
  popMatrix();  
   
  pushMatrix(); 
  rotate(PI/2.1); 
  line(0, 0, 0, 200); 
  popMatrix(); 
  
  pushMatrix(); 
  rotate(PI/1.54); 
  line(0, 0, 0, 230); 
  popMatrix(); 
  
  pushMatrix(); 
  rotate(PI/1.2); 
  line(0, 0, 0, 100); 
  popMatrix(); */
}





/*void branch1(float bLength) {
  bLength *= .7; 
  if(bLength > 2) {  
    pushMatrix(); 
    rotate(PI/3); 
    line(0, 0, 0, bLength); 
    translate(0, bLength); 
    branch1(bLength); 
    popMatrix(); 
  }
}*/

/*void branch1(float bLength) {
  angle = random(2, 5); 
  //bLength = random(30, 100); 
  bLength *= .66; 
  
  //counter--; 
  
  if (bLength > 2) {
    pushMatrix(); 
    rotate(PI / angle); 
    line(0, 0, 0, bLength); 
    translate(0, bLength); 
    //branch1(angle, bLength); 
    branch1(bLength); 
    popMatrix(); 
    
    pushMatrix(); 
    rotate(PI / angle); 
    line(0, 0, 0, bLength); 
    translate(0, bLength); 
    //branch1(angle, bLength); 
    branch1(bLength); 
    popMatrix(); 
    
    pushMatrix(); 
    rotate(-(PI / angle)); 
    line(0, 0, 0, -bLength); 
    translate(0, -bLength); 
    //branch1(angle, -bLength); 
    branch1(-bLength); 
    popMatrix(); 
  }
}*/