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
  for (int tickX = 0; tickX <= 800; tickX+=20){
   line(tickX,398,tickX,402);
  } 
  for (int tickY = 0; tickY <= 800; tickY+=20){
   line(398,tickY,402,tickY);
  } 
  y = a * (x-h) * (x-h) + k;
  
  println("y:"+y+" x:"+x+" a:"+a);
  println("h:"+h+" k:"+k);
}
void mouseClicked(){
  h = (mouseX-400.0)/20.0;
  k = (-mouseY+400.0)/20.0;
  if (mouseButton == RIGHT) {
    
  a = random(0.1,9.9);
  }
  if (mouseButton == LEFT) {
  a = random(-9.9,0);
  }
}
