SnowFlake [] lotsAFlakes;
int colorR = 1;
int colorG = 1;
int colorB = 1;
void setup()
{
  size(500, 500);
  lotsAFlakes = new SnowFlake [300] ;
  for (int i = 0; i < lotsAFlakes.length; ++i) 
 {
  lotsAFlakes [i] = new SnowFlake((int)(Math.random()*500),(int)(Math.random()*500));
 }
 background(0, 0, 0);
}
void draw()
{
  if (colorR >255) 
  {
    colorR = 1;
  }
  if (colorB >255) 
  {
    colorB = 1;
  }
  if (colorG >255) 
  {
    colorG = 1;
  }
  colorR =  colorR + 1;
  colorB = colorB + 3;
  colorG = colorG + 4;
   for (int k = 0; k < lotsAFlakes.length; ++k) 
  {
    if (lotsAFlakes[k].lookDown() == true) 
    {
       lotsAFlakes[k].erase();
       lotsAFlakes[k].move();
       lotsAFlakes[k].wrap();
    }
    lotsAFlakes[k].show();
  }
}

void mouseDragged()
{
  if (mouseButton == LEFT) 
  {
    fill(colorR, colorB, colorG);
    stroke(colorR, colorB, colorG);
    ellipse(mouseX, mouseY, 20 , 20);
  }
  if (mouseButton == RIGHT) 
  {
    fill(0, 0, 0);
    noStroke();
    ellipse(mouseX, mouseY, 40 , 40);
  }
}
class SnowFlake
{
  int snowX, snowY;
  SnowFlake(int x, int y)
  {
    snowX = x;
    snowY = y;
  }
  void show()
  {
    stroke(255, 255,255);
    fill(255, 255, 255);
    ellipse(snowX, snowY, 10, 10);
   
  }
  boolean lookDown()
  {
    if (get(snowX, snowY + 10) != color(0,0,0) && snowY > 0 && snowY< 480) 
    {
      return false;
    }
    else 
    {
       return true;
    }
  
  }
  void erase()
  {
    fill(0, 0, 0);
    stroke(0, 0, 0);
    ellipse(snowX, snowY , 13, 13);
  }
  void move()
  {
  snowY = snowY +1;
  }
  void wrap()
  {
    if (snowY > 500) 
    {
      snowY = 0;
      snowX = (int)(Math.random()*500);   
    }
  }
}