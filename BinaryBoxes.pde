void setup() {
  
  size(500, 500);
  background(127);
  stroke(0);
  fill(255);
  textSize(20);
  
  rectX = width;
  rectY = height / 2;
  dist = width / 16;
  
  for(int i = 0; i < 16; i++) {
    
    boxes[i] = false;
  }
}

float rectX, rectY, dist;
boolean[] boxes = new boolean[16];
int total = 0;

void draw() {
  
  background(127);
  
  for(int i = 0; i < 16; i++) {
    
    if(!boxes[i]) {
      
      println("box is false");
      fill(255);
      rect(rectX - (dist * i), rectY, -dist, dist); 
    }
    
    else {
      
      fill(0);
      rect(rectX - (dist * i), rectY, -dist, dist);
    }
  }
  
  fill(255);
  text(total, width / 2, height / 8);
}

void mouseClicked() {
  
  for(int i = 0; i < 16; i++) {
    
    if(mouseX < (rectX - (dist * i)) && mouseX > (rectX - (dist * (i + 1)))) {
      
      if(mouseY > height / 2 && mouseY < (height / 2 + dist)) {
        
        boxes[i] = !boxes[i];
        
        if(boxes[i])
          total += pow(2, i);
          
        else
          total -= pow(2, i);
          
      }
    }
  }
}
