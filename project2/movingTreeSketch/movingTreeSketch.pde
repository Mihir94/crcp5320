float angle; 
float bLength; 
//int counter = 35; 
float weight = 7.0; 

void setup() {
  background(255); 
  size(1440, 900); 
}

void draw() {
  trunk1();
  weight = 6; 
  branch1(300, weight-1,"l");
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

float randNum; 
void branch1(float branchLength, float weight, String str) {
  randNum = random(0, 1); 
  println("str:" + str + " " + weight); 
  /*
  if(weight < 1) {
    weight = 1.0; 
  } else {
    strokeWeight(weight); 
    weight -= 1.0; 
  } */

  angle = random(0, PI/3);
  //line(0, 0, 0, -branchLength); 
  //translate(0, -branchLength); 
  branchLength = branchLength * .6; 
  //branchLength = random(30, 300); 

  if(branchLength > 20) {
    //counter--; 
    if(weight < 1)
      weight = 1; 
      
    /*if(weight < .1) {
      weight = .1; 
    } else { 
      weight -= .1; 
      strokeWeight(weight); 
    }*/
    strokeWeight(weight); 
    pushMatrix(); 
    //rotate(PI/6);
    rotate(angle); 
    line(0, 0, 0, -branchLength); 
    translate(0, -branchLength); 
    
    /*for(int i = 0; i < 100; i++) {
      bezier(0, 0, random(width/2, width/2 + 40), random(width/2, width/2 -40), random(0, -40), random(0, 40), 0, 0); 
    }*/
    
    if(branchLength < 24 && branchLength > 21) {
      stroke(200, 0, 0); 
      fill(200, 0, 0); 
      ellipse(0, 0, 30, 30); 
    }
    stroke(0);
    fill(0); 
    branch1(branchLength, weight-1.0,"l"); 
    popMatrix(); 
    
    
    strokeWeight(weight); 
    pushMatrix(); 
    //rotate(-(PI/6));
    rotate(-angle); 
    line(0, 0, 0, -branchLength); 
    translate(0, -branchLength); 
    if(branchLength < 24 && branchLength > 21) {
      stroke(200, 0, 0); 
      fill(200, 0, 0); 
      ellipse(0, 0, 30, 30); 
    }
    stroke(0); 
    fill(0); 
    branch1(branchLength, weight-1.0,"r"); 
    popMatrix(); 
    
    strokeWeight(weight); 
    pushMatrix(); 
    //rotate(-(PI/6));
    rotate(-angle); 
    line(0, 0, 0, -branchLength); 
    translate(0, -branchLength); 
    if(branchLength < 24 && branchLength > 21) {
      stroke(200, 0, 0); 
      fill(200, 0, 0); 
      ellipse(0, 0, 30, 30); 
    }
    stroke(0); 
    fill(0); 
    branch1(branchLength, weight-1.0,"r"); 
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