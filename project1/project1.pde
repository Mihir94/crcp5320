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
    
    
  }
  
  noLoop(); 
}