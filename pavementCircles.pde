void setup()
{
  size(500, 500);
  background(40);
  stroke(255);
  fill(255);
}

float centX;
float centY;
float radius;
int spacing;

void draw()
{
  centX = width / 10;
  centY = height / 10;
  radius = 30;
  spacing = (int)radius + 20;
  
  for(int i = 0; i < (height / 10); i++)
  {
    for(int j = 0; j < (width / 10); j++)
    {
      shadeCircles();
      centX += width / 10 + spacing;
    }
    centX = width / 10;
    centY += height / 10 + spacing;
  }
}

void shadeCircles()
{
  for(int i = 0; i < radius; i++)
  {
    stroke(40 + (i * 4));
    fill(40 + (i * 4));
    ellipse(centX, centY, radius - i, radius - i);
  }
}
