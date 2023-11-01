Particle bob = new Particle();
Particle[] galaxy = new Particle[1000];
void setup()
{
  size(500,500);
  background(0);
  for(int i = 0; i<galaxy.length*3/4; i++)
  {
    galaxy[i] = new Particle();
  }
  for(int i = galaxy.length*3/4; i<galaxy.length*7/8; i++)
  {
    galaxy[i] = new OddBall();
  }
  for(int i = galaxy.length*7/8; i<galaxy.length; i++)
  {
    galaxy[i] = new Weirdo();
  }
}
void draw()
{
  background(0);
  bob.fly();
  bob.show();
  for(int i = 0; i<galaxy.length; i++)
  {
    galaxy[i].show();
    galaxy[i].fly();
  }
}
void mousePressed()
{
  bob = new Particle();
  for(int i = 0; i<galaxy.length*3/4; i++)
  {
    galaxy[i] = new Particle();
  }
  for(int i = galaxy.length*3/4; i<galaxy.length*7/8; i++)
  {
    galaxy[i] = new OddBall();
  }
  for(int i = galaxy.length*7/8; i<galaxy.length; i++)
  {
    galaxy[i] = new Weirdo();
  }
  redraw();
}
class Particle
{
  double myX, myY, myAngle, mySpeed;
  int myColor, mySize;
  Particle()
  {
    myAngle = (Math.random()*2*Math.PI);
    mySpeed = Math.random()*10+3;
    myX=mouseX;
    myY=mouseY;
    mySize = 10;
    myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
  }
  void fly()
  {
    myX+= Math.cos(myAngle)*mySpeed;
    myY+= Math.sin(myAngle)*mySpeed;
  }
  void show()
  {
    fill(myColor);
    noStroke();
    ellipse((float)myX, (float)myY, mySize, mySize);
  }
}
class OddBall extends Particle
{
  OddBall()
  {
    myAngle = (Math.random()*2*Math.PI);
    mySpeed = Math.random()*20+10;
    myX=mouseX;
    myY=mouseY;
    mySize = 20;
    myColor = color(255,255,255);
  }
}
class Weirdo extends Particle
{
  Weirdo()
  {
    myAngle = (Math.random()*2*Math.PI);
    mySpeed = Math.random()*3;
    myX=mouseX;
    myY=mouseY;
    mySize = 30;
    myColor = color((int)(Math.random()*50+120),50,(int)(Math.random()*30+135));
  }
}
