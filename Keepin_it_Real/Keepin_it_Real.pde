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
float snapGrid=1;
float spacing;
PrintWriter output;

void setup(){
  size(1100,801);
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
  output = createWriter("data/info.txt");
}

void draw(){
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
    stroke(0,0,255);
    line(mouseX,dash,mouseX,dash+10);
  }//////////////////////////// draw line of symmetry

  for (float x = -200; x <= 200; x=x+0.1){
    y = a * sq(x-h) + k;
    stroke(0);
    line(20*x+400,y*-20+400,20*(x+0.1)+400,(a*sq((x+0.1)-h)+k)*-20+400);
    // line(20*x+400,y+400,20*x+300,y+300); special effects
  }//////////////////////////// PARABOLA
  
  fill(255);
  rect(801,0,300,800);// textbox
  fill(50);
  text("The vertex is ("+h+", "+k+")",825,30,190,100);//print vertex
  output.println("The vertex is ("+h+" , "+k+")");
 
  
  
  b = -2 * a * h ;
  c = a * h * h + k;
  
  if ((sq(b)-4*a*c) > 0){
    x1 = (-b + sqrt(sq(b) - (4 * a * c)))/(2*a);
    x2 = (-b - sqrt(sq(b) - (4 * a * c)))/(2*a);
    fill(255,0,0);
    ellipse(x1*20+400,400,10,10);
    ellipse(x2*20+400,400,10,10);/////////////////RED CIRCLES - REAL ROOTS
    fill(0);
    String root1 = String.format("%.3f",x1);
    String root2 = String.format("%.3f",x2);
    text("The real roots are ("+root1+" , "+root2+")",825,70,250,100);
      output.println("The real roots are ("+root1+" , "+root2+")");
  }// REAL ROOTS
  if ((sq(b)-4*a*c) == 0){
    x1 = (-b + sqrt(sq(b) - (4 * a * c)))/(2*a);
    fill(255,0,0);
    ellipse(x1*20+400,400,10,10);/////////////////RED CIRCLE - REAL ROOT
    fill(0);
    String root1 = String.format("%.3f",x1);
    text("The root is ("+root1+")",825,70,150,100);
      output.println("The root is ("+root1+")");
  }// SINGLE ROOT
  if ((sq(b)-4*a*c) < 0){
    x1=(-b + sqrt(-1*(sq(b) - (4 * a * c))))/(2*a);
    x2=(-b - sqrt(-1*(sq(b) - (4 * a * c))))/(2*a);
    String root1 = String.format("%.3f",x1);
    String root2 = String.format("%.3f",x2);
    text("The imaginary roots are ("+root1+"i , "+root2+"i)",825,70,275,100);
      output.println("The imaginary roots are ("+root1+"i , "+root2+"i)");// output imaginary roots to text
  }// IMAGINARY ROOTS
    text("The equation of the line of symmetry is x = "+h+"",825,120,225,100);
      output.println("The equation of the line of symmetry is x = "+h+"");
    String aShrink = String.format("%.3f",a);
    String bShrink = String.format("%.3f",b);
    String cShrink = String.format("%.3f",c);
    text("The equation of the parabola is:",825,175,225,300); // print equation of parabola
    text("y = "+aShrink+"x^2 + "+bShrink+"x + "+cShrink+"",825,190,275,300); //print equation of parabola
    output.println("The equation of the parabola is: y = "+aShrink+"x^2 + "+bShrink+"x + "+cShrink+"");
    for(float table = h-5;table<=h+5;table++){
      table=round(table);
      spacing+=25;
      String yCoord = String.format("%.3f", (a * sq(table-h)+k));
      text(""+table+" , "+yCoord+"" ,825,250+spacing,350,100);//draw table
    output.println(table + " , " + yCoord);//output table to text
    }
    
    output.flush();
    output.close();
    PImage parabola = get(0,0,801,801);
    parabola.save("data/graph.jpg");
    spacing=0;
     }// END GRAPH if statement
}
