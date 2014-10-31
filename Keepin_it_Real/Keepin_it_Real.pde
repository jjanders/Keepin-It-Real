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
  //background(255);
   for (int tickX = 0; tickX <= 800; tickX+=20){
     stroke(200);
     line(tickX,0,tickX,800); // grid lines
  } 
  for (int tickY = 0; tickY <= 800; tickY+=20){
    stroke(200);
    line(0,tickY,800,tickY);// grid lines
  }
  stroke(0);
  line(0,400,800,400);
  line(400,0,400,800);
  for (int tickX = 0; tickX <= 800; tickX+=100){
   line(tickX,397,tickX,403);// tick x
  } 
  for (int tickY = 0; tickY <= 800; tickY+=100){
   line(397,tickY,403,tickY);// tick y
  } 
  println("y:"+y+" x:"+x+" a:"+a);
  println("b:"+b+" c:"+c);
}
void mouseClicked(){
  if(mouseX<800){
  b = -2 * a * h;
  c = (a * h * h) + k;
  fill(255);
  rect(0,0,800,800);
  h = (mouseX-400.0)/20.0;
  k = (-mouseY+400.0)/20.0;
  
  if (mouseButton == LEFT) {
    a = random(-10,0) * -1;
  }
  
  if (mouseButton == RIGHT) {
    a = random(-10,0);
  }

  for (int dash=0; dash <= 800; dash+=20){
    line(mouseX,dash,mouseX,dash+10);
  }
  
  for (float x = -200; x <= 200; x=x+.1){
    y = a * sq(x-h) + k * -20;
    stroke(0);
    point(20*x+400,y+400);
//    line(20*x+400,y+400,20*x+300,y+300);
  }
  fill(255);
  rect(801,0,200,800);
  fill(50);
  text("The vertex is ("+h+", "+k+")",850,30,100,100);

  }
}
