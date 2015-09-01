int centX = 0;
int centY = 250;
boolean right = true;
int r = (int)random(0, 256);
int g = (int)random(0, 256);
int b = (int)random(0, 256);

void setup()
{
  size(500, 500);
  stroke(255);
  fill(0);
}

void draw()
{
  background(0);
  stroke(r, g, b);
  fill(r, g, b);
  
  ellipse(centX, mouseY, 25, 25);
  
  if(right == true)
  {
    centX += 10;
    
    if(centX == 500)
    {
      right = !right;
      
      r = (int)random(0, 256);
      g = (int)random(0, 256);
      b = (int)random(0, 256);
    }
  }
  else
  {
    centX -= 10;
    
    if(centX == 0)
    {
      right = !right;
      r = (int)random(0, 256);
      g = (int)random(0, 256);
      b = (int)random(0, 256);
    }
  }
}
