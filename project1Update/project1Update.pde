int blue = 10; 
int red = 232; 
int green = 173; 
float bWidth = 400; 
float bHeight = 400; 
float radius = 380; 
float sWeightFactor = 3; 
float bWeightFactor = .005;

void setup() {
  size(1440, 900);//800, 600 
  background(255); 
}

void draw()  {
  noFill(); 
  stroke(0); 
 
  //drawEye(bWidth, bHeight, radius, sWeightFactor, bWeightFactor); 

  /*for(int x = 0; x < 100; x++) {
    strokeWeight(.005); 
    smooth(); 
    stroke(red, green, blue); 
    
    bezier(width, height, random(width/2 + 300, width), 
    random(height/2), random(width/2 + 300, width), noise(height/2), random(width/2), 
    noise(height/2));
    
    bezier(100, 100, random(0, height), 
    random(height), noise(0, height), random(width / 2 - 300), width, 
    height);
  }*/
  
  for(int i = 0; i < 250; i++) {
    
    strokeWeight(.005); 
    smooth(); 
    stroke(red, green, blue); 
    
    bezier(0, height/2, (width/2 - 100), random(50, 150), (width/2 + 100), random(50, 150), width, height/2);
    
    bezier(0, height/2, (width/2 - 100), noise(750, height), (width/2 + 100), random(750, height), width, height/2);
    
    bezier(0, height/2, (width/2 - 100), random(750, height), (width/2 + 100), noise(750, height), width, height/2);
    
    bezier(0, height/2, (width/2 - 100), random(800, height), (width/2 + 100), random(800, height), width, height/2);

    //------------------------------------------
    
    strokeWeight(.005); 
    smooth(); 
    stroke(red, green, blue); 
    bezier(width/2, height/2, random(width/2 - 400, width/2 + 400),
    random(height/2 - 400, height/2 + 400), random(width/2 - 400, width/2+400),
    random(height/2 - 400, height/2 + 400), width/2, height/2);
    
    strokeWeight(.05);
    ellipse(width/2, height/2, 350, 350); 
    
    strokeWeight(.005);     
    bezier(width/2, height/2, random(width/2 - 360, width/2 + 360),
    random(height/2 - 360, height/2 + 360), random(width/2 - 360, width/2+360),
    random(height/2 - 360, height/2 + 360), width/2, height/2);
    
    strokeWeight(.05); 
    ellipse(width/2, height/2, 250, 250); 

    strokeWeight(.005); 
    bezier(width/2, height/2, random(width/2 - 320, width/2 + 320),
    random(height/2 - 320, height/2 + 320), random(width/2 - 320, width/2+320),
    random(height/2 - 320, height/2 + 320), width/2, height/2);
    
    strokeWeight(.05); 
    ellipse(width/2, height/2, 150, 150); 

    strokeWeight(.005); 
    bezier(width/2, height/2, random(width/2 - 280, width/2 + 280),
    random(height/2 - 280, height/2 + 280), random(width/2- 280, width/2+280),
    random(height/2 - 280, height/2 + 280), width/2, height/2);
    
    strokeWeight(.05); 
    ellipse(width/2, height/2, 50, 50); 

    strokeWeight(.005); 
    bezier(width/2, height/2, random(width/2 - 240, width/2 + 240),
    random(height/2 - 240, height/2 + 240), random(width/2 - 240, width/2+240),
    random(height/2 - 240, height/2 + 240), width/2, height/2);
    
    
    if (blue == 0) {
      blue = 0; 
    }
    else {
      blue--; 
    }
    if (red == 0) {
      red = 0; 
    } else {
      red--; 
    }
    if (green == 0) {
      green = 0;
    } else {
      green--; 
    }
  }
  
  
  noLoop();
}