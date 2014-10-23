float y;
float x;
float a;
float h;
float k;
float b;
float c;
void setup(){
  size(1000,801);
  background(255);
  noStroke();
}
void draw(){
  stroke(0);
  line(0,400,800,400);
  line(400,0,400,800);
  for (int tickX = 0; tickX <= 800; tickX+=10){
   line(tickX,398,tickX,402);
  } 
  for (int tickY = 0; tickY <= 800; tickY+=10){
   line(398,tickY,402,tickY);
  } 
  y = a * (x-h) * (x-h) + k
}

void mouseClicked(){
  mouseX = h
  mouseY = k
  if mouseClick == RIGHT{
  a = random(10,0);
  }
  if mouseClick == LEFT{
  a = random(-10,0);
  }
}
