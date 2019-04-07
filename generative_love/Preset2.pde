// Click and drag to draw, press any key to clear 

class Preset2 {
  //
  boolean parar = false;
  boolean salida =false;
  Motion mf, m;
  Preset2()
  {
    //  println("new Preset2");
    mf = new Motion(width/2,height/2);
    mf.setConstant(100);
    m = new Motion(width/2,height/2);
    m.setConstant(1000);
    colorMode(RGB, 255);
    background(0);
    smooth();
  }

  void draw()
  {
    stroke(255);

    if (!salida ){
      eventos();

      if (!parar){
        dibuixaEllipseOnSigui(int(mf.getX()/10));
        dibujaEstela();
        seguir();        
      }
    }

  }
  void seguir(){
    mf.followTo(mouseX,mouseY);
    mf.move();
    m.springTo(mf.getX(),mf.getY());
    m.move();
    stroke(255);
    //strokeWeight(1);
  }
  void dibujaEstela(){
    if (!parar){
      stroke(255,20);
      //dibujamos la linea
      line(mf.getX(), mf.getY(), m.getX(),m.getY());
      fill(255);
      stroke(255,255,255);
      ellipse(m.getX(),m.getY(),m.getDistance(),m.getDistance());
      int alfa = int(random(m.getX()));
      fill(255,alfa);
      noStroke();
      ellipse(m.getX(),m.getY(),m.getDistance(),m.getDistance());
    }
  }
  void dibuixaEllipseOnSigui(int tam){
    int x = int(random(width));
    int y = int(random(width));
    int sz = int(random(tam));
    int alfa = int(random(100));
    int r = int(random(255));
    int g = int(random(0));
    int b = int(random(100));
    fill(r,g,b,alfa);
    noStroke();
    ellipse(x,y,sz,sz);

  }
  void eventos(){

    if(keyPressed){
      if(key == 'm') {
        // background(0);   
        salida = true;


      }
      if(key == 'p') {
        parar = true;


      }
    } 
    if(mousePressed){
      dibujaEstela();
    }
  }
}
