
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
  clear(); 
  background(246, 241, 212); 
  size(1440, 900); 
  /*ellipsePos = new PVector(); 
  ellipsePos.x = 200; 
  ellipsePos.y = 300; */
  angle = random(0, PI/3);
  oscillator(); 
  angleList = new FloatList();
  
  movers = new MotionObject[2];
  
  /*for (int i = 0; i < movers.length; i++) {
    movers[i] = new MotionObject(random(0.1,4),random(width),random(height/2));
  }*/
  
  pendObjs = new PendMotion[20];
  for (int i = 0; i  < pendObjs.length; ++i) {
    //pendObjs[i] = new Pendulum(new PVector(width/2,10),125);
    float x = random(-1000, 0);
    float y = random(-300, 0);
    pendObjs[i] = new PendMotion(new PVector(x,y),1,random(0.3,0.9),random(PI/12,PI/20), random(20, 30), random(3, 5), random(.1, .4)); //<>//
  }
  
  /*noiseObjs = new NoiseMotion[2];
  for (int i = 0; i  < noiseObjs.length; ++i) {
      noiseObjs[i] = new NoiseMotion(0.0,10000.0,random(0,width),random(0,height/3));
  }*/
}

void draw() {
  background(246, 241, 212); 
  //drawBackgroundTree(); 
  //drawClouds(); 
  top = 0;
  weight = 6; 
  trunk1();
  branch1(300, weight-1,"l");
    
  if (drawOnce == false) {
    drawOnce = true; 
  }
  /*for (int i = 0; i < movers.length; i += 2) {
    for (int j = 0; j < movers.length; j++) {
      if (i != j) {
        PVector force = movers[j].attract(movers[i]);
        movers[i].applyForce(force);
      }
    }
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }*/
  //motion for odd objects
    //drawSimple();
    
    for (int i = 0; i  < pendObjs.length; ++i) {
        pendObjs[i].go();
    }
    
    /*for (int i = 0; i  < noiseObjs.length; ++i) {
      noiseObjs[i].go();
  }*/
  
  /*
  println("Number of Ellipse " + counterEllipse); 
  //branch1(bLength); 
  //branch1(290); 
  */
  
  //oscillate(); 
  //ellipse(ellipsePos.x, ellipsePos.y, 30 , 30); 
 
  
  //noLoop(); 
}

/*void mousePressed() {
  redraw(); 
}*/

void drawClouds() {
  stroke(255); 
  fill(255); 
  ellipse(30, 90, 200, 90); 
  ellipse(60, 150, 100, 90); 
  ellipse(800, 150, 200, 90); 
  ellipse(900, 250, 200, 90); 

}

void drawBackgroundTree() {
  strokeWeight(2); 
  line(300, height - 150, 300, height - 250); 
  strokeWeight(1); 
  line(300, height - 250, 250, height - 300); 
  line(300, height - 250, 350, height - 270); 
  strokeWeight(.5); 
  line(250, height - 300, 260, height - 320); 
  line(250, height - 300, 230, height - 280); 
  line(350, height - 270, 360, height - 280); 
  line(350, height - 270, 330, height - 273); 
  stroke(200, 0, 0); 
  fill(200, 0, 0); 
  ellipse(260, height - 320, 15, 15); 
  ellipse(230, height - 280, 15, 15); 
  ellipse(360, height - 280, 15, 15); 
  ellipse(330, height - 273, 15, 15); 
  //
  fill(0); 
  stroke(0); 


  
  
}

void trunk1() {
  stroke(0); 
  fill(0); 
  strokeWeight(weight); 
  translate(width - 300, height); 
  line(0, 0, 0, -300); 
  translate(0, -300); 
}

int BRANCH_LIMIT = 20; //20  
float randNum; 
void branch1(float branchLength, float weight, String str) {
  //randNum = random(0, 1); 
  stroke(0); 
  fill(0); 
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
      //oscillate();
      //ellipse(ellipsePos.x, ellipsePos.y, 30, 30);
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
      //oscillate();
      //ellipse(ellipsePos.x, ellipsePos.y, 30, 30);
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
    velocity = new PVector(.005,.005); 
    //amplitude = new PVector(random(width/2),random(height/2));
    amplitude = new PVector(random(3,5),random(3,7));
  }
 
void oscillate()  {
  ellipseAngle.add(velocity);
  
  //float x = sin(ellipseAngle.x)*amplitude.x;
  //float y = sin(ellipseAngle.y)*amplitude.y;
  float x = noise((velocity.x+ellipseAngle.x)*.02,ellipseAngle.y*.02);
  float y = noise(ellipseAngle.x*.02,(velocity.y+ellipseAngle.y)*.02);
  ellipsePos.x = x*25; // 15
  ellipsePos.y = y*12; // 15
  //ellipsePos.x = x;
  //ellipsePos.y = y;
 
}


MotionObject[] movers;
PendMotion[] pendObjs;

NoiseMotion[] noiseObjs;

void drawSimple() {
//background(255);

  PVector wind = new PVector(0.1,0.0005);
  // Make up two forces.
  PVector gravity = new PVector(0,0.001);

  //[full] Loop through all objects and apply both forces to each object.
  /*for (int i = 1; i < movers.length; i += 2) {
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
  //[end]
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }*/
}



class MotionObject {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  MotionObject(float m, float x, float y) {
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }

  // Newton’s second law.
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    //[end]
    // Now add clearing the acceleration each time!
    acceleration.mult(0);
  }

  void display() {
    stroke(255);
    fill(255);
    //[offset-down] Scaling the size according to mass.
    //ellipse(location.x,location.y,mass*16,mass*16);
  }

  // Somewhat arbitrarily, we are deciding that an object bounces when it hits the edges of a window.
  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height-20) {
      // Even though we said we shouldn't touch location and velocity directly, there are some exceptions.
      // Here we are doing so as a quick and easy way to reverse the direction of our object when it reaches the edge.
      velocity.y *= -1;
      location.y = height-20;
    }
  }
  
  PVector attract(MotionObject m) {
 
    PVector force = PVector.sub(location,m.location);
    float distance = force.mag();
    distance = constrain(distance,5.0,25.0);
    force.normalize();
 
    float strength = (0.4 * mass * m.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }
}


class PendMotion  {
  //[full] Many, many variables to keep track of the Pendulum’s various properties
  PVector location;    // Location of bob
  PVector origin;      // Location of arm origin
  float r;             // Length of arm
  float angle;         // Pendulum arm angle
  float aVelocity;     // Angle velocity
  float aAcceleration; // Angle acceleration
  float damping;       // Arbitrary damping amount
  float gravity;
  PVector arcWH; 
  float sway;

  PendMotion(PVector origin_, float r_, float g_,float angle_, float arcWidth, float arcHeight, float sway_) {
    origin = origin_.get();
    //origin = new PVector(width/2,height/2);
    location = new PVector();
    r = r_;
    sway = sway_; 
    gravity = 1.2;
    angle = angle_;
    //angle = PI/4;

    aVelocity = 0.0;
    aAcceleration = 0.0;
    // An arbitrary damping so that the Pendulum slows
    // over time
    damping = 0.995;
    arcWH = new PVector(arcWidth, arcHeight); 
  }

  void go() {
    update();
    display();
  }

  void update() {
   // float gravity = 0.4;
      //r += 0.2;
      r += sway; 
    //[offset-up] Formula we worked out for angular acceleration
    aAcceleration = (-1 * gravity / r) * sin(angle);

    //[full] Standard angular motion algorithm
    aVelocity += aAcceleration;
    angle += aVelocity;
    //[end]

    // Apply some damping.
    aVelocity *= damping;
  
  }

  void display() {
    // Where is the bob relative to the origin?
    // Polar to Cartesian coordinates will tell us!
    location.set(r*sin(angle),r*cos(angle),0);
    location.add(origin);

    stroke(0);
    // The arm
    //line(origin.x,origin.y,location.x,location.y);
    fill(0);
    // The bob
    stroke(200, 0, 0);
    fill(200, 0, 0); 
    //ellipse(location.x,location.y,16,16);
    arc(location.x, location.y, arcWH.x, arcWH.y, 0, PI); 
  }
}


class NoiseMotion {
  float x,y;
  float tx,ty;
  
  float xscale = 1;
  float yscale = 1;
  
  NoiseMotion(float tx_, float ty_,float x_, float y_) {
    tx = tx_;
    ty = ty_;
    x = x_;
    y = y_;
  }

  void go() {
  
    //x = map(noise(tx), 0, 1, 0, width);
    //y = map(noise(ty), 0, 1, 0, height);
    if (y < height - 10) {
    
      //[full] Move forward through “time.”
      x += noise(tx) * xscale;
      y += noise(ty) * yscale;
    
      tx += 0.01;
      ty += 0.01;
    }
    
    stroke(0);
    fill(0); 
    ellipse(x,y,20,20);
   
  }
}
  
 
 