int blue = 0; 
int red = 0; 
int green = 0; 
float randomColor = 0; 

void setup() {
  background(255); 
  size(800, 600); //800, 600
  noFill(); 
  smooth(); 
}

void draw() {
  strokeWeight(.005); 
  for(int i = 0; i < 250; i++) {
    smooth(); 
    stroke(red, green, blue); 
    bezier(width, height, random(width/2 + 300, width), 
    random(height/2), random(width/2 + 300, width), noise(height/2), random(width/2), 
    noise(height/2));
    
    bezier(100, 100, random(0, height), 
    random(height), noise(0, height), random(width / 2 - 300), width, 
    height);
    
    
    //fill(255);
    //stroke(255); 
    //ellipse(width/2, height/2, 100, 100); 
    noFill(); 
    stroke(red, green, blue); 
    
    
    //bezier(width/2, height - 70, random(width/2 - 100, width/2 + 100), random(height - 70, height), 
    //random(width/2 - 100, width/2 + 100), random(height - 70, height), width, height); 
    
    //bezier(width/2, 0, random(width/2, width/2 + 600), random(height/2, height/2 + 500), 
    //random(width/2, width/2 + 500), random(height/2, height/2 + 600), width/2, height/2); 
    
    if (blue == 0) {
      blue = 0; //10
    }
    else {
      blue++; 
    }
    if (red == 100) {
      red = 232; //232
    } else {
      red++; 
    }
    if (green == 0) {
      green = 0; //173
    } else {
      green++; 
    } 
    /*
    if (blue == 87) {
      blue = 87; 
    }
    else {
      blue++; 
    }
    if (red == 15) {
      red = 15; 
    } else {
      red++; 
    }
    if (green == 41) {
      green = 41;
    } else {
      green++; 
    } */
  }
  red = 0; 
  green = 0; 
  blue = 0; 
  
  for(int y = 0; y < 1000; y++) {
    stroke(red, green, blue); 
    
    bezier(width - 250, 200, random(width/2, width/2 + 300), random(height/2 - 200, height/2 + 100), 
    random(width/2, width/2 + 300), random(height/2 - 200, height/2 + 100), width - 250, 200); 
    
    /*bezier(0, height, random(width/2 - 700, width/2 - 200), noise(0, height/2 + 500), 
    noise(width/2 - 700, width/2 - 200), random(0, height/2 + 600), 0, height);*/
    
    /*if (blue == 87) {
      blue = 87; 
    }
    else {
      blue++; 
    }
    if (red == 15) {
      red = 15; 
    } else {
      red++; 
    }
    if (green == 41) {
      green = 41;
    } else {
      green++; 
    }*/
  }
  
  red = 0; 
  green = 0; 
  blue = 0; 
  
  /*for(int z = 0; z < 100; z++) {
    bezier(width/2 + 100, height/2 + 150, random(200, 500), 
    random(200, 500), random(200, 500), random(200, 500), random(200,500), 
    random(200, 500));
  }*/
  
  noLoop(); 
}