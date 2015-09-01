void setup()
{
  size(800, 500);
  background(0);
  stroke(255, 255, 0);
}

int diagTopX;
int diagTopY;
int diagBottomX;
int diagBottomY;

int horiX;
int horiY;
int horiSpace;

void draw()
{
  diagTopX = width / 2;
  diagTopY = height / 2;
  diagBottomX = 0;
  diagBottomY = height;
  
  while(diagBottomX <= width)
  {
    line(diagTopX, diagTopY, diagBottomX, diagBottomY);
    diagBottomX += 10;
  }
  
  horiX = 0;
  horiY = height / 2;
  horiSpace = 0;
  
  while(horiY <= height)
  { 
    line(horiX, horiY, width, horiY);
    horiY += horiSpace;
    horiSpace++;
  }
}
