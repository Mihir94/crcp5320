
float angle; 
float bLength; 
//int counter = 35; 
int counterEllipse = 0; 
PVector ellipsePos; 
int i = 0; 
float weight = 7.0; 
boolean drawOnce = false; 

FloatList angleList;
int top = 0;

void setup() {
  background(246, 241, 212); 
  size(1440, 900); 
  /*ellipsePos = new PVector(); 
  ellipsePos.x = 200; 
  ellipsePos.y = 300; */
  angle = random(0, PI/3);
  oscillator(); 
  angleList = new FloatList();
}

void draw() {
  background(246, 241, 212); 
  top = 0; //<>//
  weight = 6; 
  trunk1();
  branch1(300, weight-1,"l");
    
  if (drawOnce == false) { //<>//
    drawOnce = true; 
  }
  
  /*
  println("Number of Ellipse " + counterEllipse); 
  //branch1(bLength); 
  //branch1(290); 
  */
  
  //oscillate(); 
  //ellipse(ellipsePos.x, ellipsePos.y, 30 , 30); 
 
  
  //noLoop(); 
  
}

void mousePressed() {
  redraw(); 
}

void trunk1() {
  strokeWeight(weight); 
  translate(width - 300, height); 
  line(0, 0, 0, -300); 
  translate(0, -300); 
}

int BRANCH_LIMIT = 20; //20  
float randNum; 
void branch1(float branchLength, float weight, String str) {
  //randNum = random(0, 1); 
  println("str:" + str + " " + weight); 
  /*
  if(weight < 1) {
    weight = 1.0; 
  } else {
    strokeWeight(weight); 
    weight -= 1.0; 
  } */

  //oscillate(); 
  //float angle = rAngle.x; 
  if (drawOnce == false) {
    angle = random(0, PI/3);
    angleList.append(angle);
  }
  else angle = angleList.get(top++);
  
  //line(0, 0, 0, -branchLength); 
  //translate(0, -branchLength); 
  branchLength = branchLength * .6; 
  //branchLength = random(30, 300); 

  if(branchLength > BRANCH_LIMIT) {
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
    //stroke(255, 0, 0); 
    line(0, 0, 0, -branchLength); 
    translate(0, -branchLength); 
    
    /*for(int i = 0; i < 100; i++) {
      bezier(0, 0, random(width/2, width/2 + 40), random(width/2, width/2 -40), random(0, -40), random(0, 40), 0, 0); 
    }*/
    
    if(branchLength < 24 && branchLength > 21) {
      stroke(200, 0, 0); 
      fill(200, 0, 0); 
      //ellipse(0, 0, 30, 30); 
      oscillate();
      ellipse(ellipsePos.x, ellipsePos.y, 30, 30);
      counterEllipse++; 
      
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
      ellipse(ellipsePos.x, ellipsePos.y, 30, 30);
      //ellipse(0, 0, 30, 30); 
      counterEllipse++;
      
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
      ellipse(ellipsePos.x, ellipsePos.y, 30, 30);
      //ellipse(0, 0, 30, 30); 
      counterEllipse++;
      
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

 
  PVector ellipseAngle;
  PVector velocity;
  PVector amplitude;
 
 void oscillator()  {
    ellipsePos = new PVector();
    ellipseAngle = new PVector();
    //rAngle.x = PI/6;
    
    //velocity = new PVector(random(-0.05,0.1),random(-0.05,0.1));
    velocity = new PVector(.0005,.0005); 
    //amplitude = new PVector(random(width/2),random(height/2));
    amplitude = new PVector(random(3,5),random(3,7));
  }
 
  void oscillate()  {
    ellipseAngle.add(velocity);
    
    float x = sin(ellipseAngle.x)*amplitude.x;
    float y = sin(ellipseAngle.y)*amplitude.y;
    //float x = noise((velocity.x+ellipseAngle.x)*.02,ellipseAngle.y*.02);
    //float y = noise(ellipseAngle.x*.02,(velocity.y+ellipseAngle.y)*.02);
    //ellipsePos.x = x*30;
    //ellipsePos.y = y*30;
    ellipsePos.x = x;
    ellipsePos.y = y;
 
  }
 