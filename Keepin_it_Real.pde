float y;
float x;
float a;
float h;
float k;
void setup(){
  size(600,401);
  background(255);
  noStroke();
}
void draw(){
  stroke(0);
  line(0,200,400,200);
  line(200,0,200,400);
  for (int tickX = 0; tickX <= 400; tickX+=20){
   line(tickX,195,tickX,205);
  } 
  for (int tickY = 0; tickY <= 400; tickY+=20){
   line(195,tickY,205,tickY);
  } 
  a = random(-10,10);
}
