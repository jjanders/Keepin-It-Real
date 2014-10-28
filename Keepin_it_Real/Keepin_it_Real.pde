float y;
float x;
float a;
float h;
float k;
float b;
float c;
//String vertex = "The vertex is ("+h+", "+k+")";
//String
//String
//String
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
//  x = 
  println("y:"+y+" x:"+x+" a:"+a);
  println("h:"+h+" k:"+k);
  fill(255);
  rect(801,0,200,800);
  fill(50);
  text("The vertex is ("+h+", "+k+")",850,30,70,80);
}
void mouseClicked(){
  if(mouseX<800){
  h = (mouseX-400.0)/20.0;
  k = (-mouseY+400.0)/20.0;
  if (mouseButton == RIGHT) {
  a = random(0.1,9.9);
  }
  if (mouseButton == LEFT) {
  a = random(-9.9,0);
  }
  }
}
