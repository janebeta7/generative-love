import seltar.motion.*;



class Preset1{
Boolean isBolas = true;
  float posx,posy;
  Motion mf, m;
  // int r,g,b,alfa,x,y;//variables de la elipse que se pueden cambiar en los eventos INPUTS del MIDI en todo momento
  int tamanio=20;
  boolean salida =false;
  boolean parar = false;
  boolean pinceles = false;
  // boolean pinceles = mousePressed;
  float xpos, ypos;              // Starting position of centipede
  float xspeed = random(0,7);  // Speed of the centipede
  float yspeed = random(0,7);  // Speed of the centipede

  float xdirection = 1;  // Left or Right (-1,1)
  float ydirection = 1;  // Top to Bottom
  int sc = 105;
  float myAngle = 0;

  PFont font;
  //constructor de la clase
  Preset1 () {


    font = loadFont("GillSansMT-Condensed-48.vlw"); 
    mf = new Motion(width/2,height/2);
    mf.setConstant(70);
    m = new Motion(width/2,height/2);
    m.setConstant(1500);
    colorMode(RGB, 100);
  }

  void Texto(){

    textFont(font,15); 
    text("m:menu", 15, 40,ancho-10,200); 
    text("+:aumentar tama�o", 15, 55,ancho-10,200); 
    text("-:disminuir tama�o", 15, 65,ancho-10,200);   
  }
  void draw(float _posx, float _posy,boolean _pinceles) {
    posx = _posx;
    posy =_posy;
    pinceles = _pinceles;
    if (!salida){
      if (!parar) dibujar();
      eventos();
      if(pinceles){
        dibujaEstela();
      }
    }
  }
  void eventos(){

    if(keyPressed){
if(key == 'b') {
       isBolas =!isBolas;
      }
      if(key == 'p') {
        parar = true;
      }
      if(key == 'c') {
        parar = false;
      }      
      if(key == 'm') {
        //  background(0);   
        salida = true;
        //size(450,300);
        //stop
      }

      if(key == 'e') {
        exit();    
        //stop
      } 
      if(key == '+') {
        tamanio ++;
      }     
      if(key == '-') {
        tamanio --;
      }     
    } 



  }
  void dibujar(){

    //queda mas rojo segun distancia

    mf.followTo(posx,posy);
    mf.move();
    m.springTo(mf.getX(),mf.getY());
    m.move();

    myAngle +=0.09f;
    ypos =  m.getY() ;
    xpos =  m.getX();

    /* Draw the centipede */
if (isBolas){
    pushMatrix();
    translate(xpos,ypos);
    rotate(myAngle);
    float var1 = random(0,100);
    float var2 =random(-15,-300);
    stroke(0+m.getDistance(),0,0,30);
    ellipse(0, 0,10 ,10 );


    line(0, 0,var1, var2);
     
    float var3 = random(5,tamanio);
    fill(random(0,1),random(0,2),random(0,3),8);
    stroke (153,0,0,random(90));
    fill(255,255,255,80);
   ellipse(var1, var2, var3 , var3 );
    popMatrix();
}
  }
  void dibujaEstela(){
    stroke(255,255,255,20);
    fill(255);
    line(m.getX(),m.getY(),mf.getX(), mf.getY());
    line(mf.getX()-10, mf.getY(), m.getX(),m.getY());
    stroke(255,0,0,20);
    line(mf.getX()+100, mf.getY()+100, m.getX(),m.getY());
    int alfa = int(random(m.getX()));
    fill(255,alfa);
    noStroke();
  }

}
