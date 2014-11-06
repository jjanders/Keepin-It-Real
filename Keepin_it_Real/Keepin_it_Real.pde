/*Program: Keepin' It Real
    Author:  Julian Anderson and Dennis Lin
    Date:    <Date  of  Completion>
    Notes:    Should  the  grader  (teacher,  peer,  etc.)  look  for  anything  specific?  
                         Is  any  part  of  your  program  “broken”?
                         Did  you  add  special  features?
      Did  you  adapt  code from  somewhere  else?
      */
float y;
float x1;
float x2;
float a;
float h;
float k;
float b;
float c;

void setup(){
  size(1000,801);
  background(255);
  noStroke();
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
}

void draw(){ 
  println("y:"+y+" a:"+a);
  println("b:"+b+" c:"+c);
  println("x1:"+x1+" x2:"+x2);
}

void mouseClicked(){
  
  if(mouseX<800){
    
  fill(255);
  rect(0,0,800,800);//// rectangle to clear board
  
  for (int tickX = 0; tickX <= 800; tickX+=20){
     stroke(200);
     line(tickX,0,tickX,800); //// redraw grid lines
  } 
  for (int tickY = 0; tickY <= 800; tickY+=20){
    stroke(200);
    line(0,tickY,800,tickY);//// redraw grid lines
  }
  stroke(0);
  line(0,400,800,400);
  line(400,0,400,800);
  for (int tickX = 0; tickX <= 800; tickX+=100){
   line(tickX,397,tickX,403);//// redraw tick x
  } 
  for (int tickY = 0; tickY <= 800; tickY+=100){
   line(397,tickY,403,tickY);//// redraw tick y
  } 

  h = (mouseX-400.0)/20.0;
  k = (-mouseY+400.0)/20.0;//// convert vertex to gridlines

  if (mouseButton == LEFT) {
    a = random(-10,0);
  }///////////////////////////// open down
  
  if (mouseButton == RIGHT) {
    a = random(-10,0) * -1;
  }///////////////////////////// open up

  for (int dash=0; dash <= 800; dash+=20){
    line(mouseX,dash,mouseX,dash+10);
  }//////////////////////////// draw line of symmetry
  
  for (float x = -200; x <= 200; x=x+0.1){
    y = a * sq(x-h) + k;
    stroke(0);
    line(20*x+400,y*-20+400,20*(x+0.1)+400,(a*sq((x+0.1)-h)+k)*-20+400);
    // line(20*x+400,y+400,20*x+300,y+300); special effects
  }//////////////////////////// PARABOLA
  
  fill(255);
  rect(801,0,200,800);
  fill(50);
  text("The vertex is ("+h+", "+k+")",825,30,190,100);//print vertex
  
  }// END GRAPH if statement
  
  
  b = -2 * a * h ;
  c = a * h * h + k;
  
  if ((sq(b)-4*a*c) > 0){
    x1 = (-b + sqrt(sq(b) - (4 * a * c)))/(2*a);
    x2 = (-b - sqrt(sq(b) - (4 * a * c)))/(2*a);
    String root1 = String.format("%.3f",x1);
    String root2 = String.format("%.3f",x2);
    text("The real roots are ("+root1+"), ("+root2+")",825,70,150,100);
  }// real roots 
  if ((sq(b)-4*a*c) == 0){
    x1 = (-b + sqrt(sq(b) - (4 * a * c)))/(2*a);
    String root1 = String.format("%.3f",x1);
    text("The root is ("+root1+")",825,70,150,100);
  }// single root
  if ((sq(b)-4*a*c) < 0){
    x1=(-b + sqrt(-1*(sq(b) - (4 * a * c))))/(2*a);
    x2=(-b - sqrt(-1*(sq(b) - (4 * a * c))))/(2*a);
    String root1 = String.format("%.3f",x1);
    String root2 = String.format("%.3f",x2);
    text("The imaginary roots are ("+root1+"i), ("+root2+"i)",825,70,150,100);
  }// imaginary roots
    text("The equation of the line of symmetry is x = "+h+"",825,120,150,100);
}
