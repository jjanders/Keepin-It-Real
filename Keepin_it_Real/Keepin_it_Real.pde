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
   for (int tickX = 0; tickX <= 800; tickX+=20){
     stroke(200);
     line(tickX,0,tickX,800);
  } 
  for (int tickY = 0; tickY <= 800; tickY+=20){
    stroke(200);
    line(0,tickY,800,tickY);
  }
  stroke(0);
  line(0,400,800,400);
  line(400,0,400,800);
  for (int tickX = 0; tickX <= 800; tickX+=20){
   line(tickX,398,tickX,402);
  } 
  for (int tickY = 0; tickY <= 800; tickY+=20){
   line(398,tickY,402,tickY);
  } 
  println("y:"+y+" x:"+x+" a:"+a);
  println("h:"+h+" k:"+k);
  fill(255);
  rect(801,0,200,800);
  fill(50);
  text("The vertex is ("+h+", "+k+")",850,30,70,80);
  b = -2 * a * h;
  c = (a * h * h) + k;
  y = a * (x-h) * (x-h) + k;
  y = (a * x * x) + (b * x) + c;
}
void mouseClicked(){
  if(mouseX<800){
    noStroke();
    fill(255);
    rect(0,0,800,800);
  h = (mouseX-400.0)/20.0;
  k = (-mouseY+400.0)/20.0;
  if (mouseButton == RIGHT) {
  a = random(0.1,9.9);
  }
  if (mouseButton == LEFT) {
  a = random(-9.9,0);
  }
    for (int dash=0; dash <= 800; dash+=20){
    line(mouseX,dash,mouseX,dash+10);
  }
  for (int parabola=0; parabola <= 50; parabola++){
    
  }

  }
}
