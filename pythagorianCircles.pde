void setup()
{
  size(500, 500);
  background(0);
  stroke(255);
}

float circX, circY, circRad;

void draw()
{
  circX = width / 2;
  circY = height / 2;
  circRad = 100;
  
  float segments = 12;
  float thetaSpace = TWO_PI / segments;
  float theta = 0;
  
  while(theta < TWO_PI)
  {
    float x, y;
    
    x = circX + sin(theta) * circRad;
    y = circY + cos(theta) * circRad;
    
    ellipse(x, y, 10, 10);
    theta += thetaSpace;
  }
}
  
