import processing.opengl.*;

/* AtGG 
 remixed by Alba G. Corral
 Junio 2006 - Barcelona
 */
import processing.opengl.*;
import controlP5.*;

//PAD



ControlP5 controlP5;
Preset2  preset2;
Controller miBoton;
Controller miBoton2;


PFont font;
//PAD
//colores



public String textValue = "";

color[] colores = new color[4];
boolean boo_start = false;
boolean boo_start2 = false;
boolean pinceles = false;
boolean performance;

int contadorBoton=0;
int contadorBoton2=0;
int NUM = 1;//numero de cienpies
int margen = 25;
int ancho;
int posy ;
int alto;
Preset1[] w = new Preset1[NUM]; //array de cienpies


void setup() {
    background(0); //fondo+
     size(displayWidth,displayHeight);
  //frame.dispose();    
  cursor( CROSS );
   posy = 500;
   alto = height;
   ancho = width;
 
  
 //setupPad();

  // FullscreenOn();
  //  inputLine = new TextField("email",30); 
  // add(inputLine); 
  font = loadFont("Dialog.plain-14.vlw"); 
  //size(ancho,alto); //Tama�og

  //
  controlP5 = new ControlP5(this);

  color Color= color(255120255);
  // println(Color);
   // create a new button with name 'buttonA'
  controlP5.addButton("generative_art")
     .setValue(1)
     .setPosition(margen,posy-50)
     .setSize(90,20)
     ;
   controlP5.addButton("generative_love")
     .setValue(1)
     .setPosition(ancho - margen*margen,posy-50)
     .setSize(90,20)
     ;
 
  smooth(); //borroso
  Texto();
  menuAparece();


}
void draw() {
    if(mousePressed){
       pinceles = true;
    }
    else
    {
      pinceles = false;
      }
 // pad.draw();
  if (boo_start){ 

    boo_start2 = false;
    menuDesaparece();
    eventos();
    w[0].draw(mouseX,mouseY,isPinceles());//llamamos al metodo de la clase Preset1.draw();
    if (w[0].salida == true){
      menuAparece();
    }
  }
  if (boo_start2){ 


    boo_start = false;
    menuDesaparece();
    eventos();
    preset2.draw();//llamamos al metodo de la clase Preset1.draw();
    if (preset2.salida == true){
      menuAparece();
    }
  }  
}
/////////////////
void setColores(){
colores[0] =#FFDEFF;
colores[1] =#FFBDE8; 
colores[2] =#FF3DF7; 
colores[3] =#FF3DF7; 
}

void eventos(){

  if(keyPressed){
  
    if(key == 'e') {
      stop();
    }    
  }

}
void dibujaRectangulo(){
  stroke(100);
  fill(0,0,0,80);
  rect(10, 10, ancho-20, alto-20);
}
void Texto(){
  textFont(font,14); 
  fill(255,255, 255);

  text("generative love - generative art ", margen, 35,ancho-10,200); 
  // textFont(font,15); 
  //fill(255,0,0);
  String s = "el arte generativo tiene sus semejanzas con el amor, generamos incluidos en un sistema aleatorio basado en unos parametros por defecto que van cambiando con las interacciones y el tiempo.\n\nCon estas dos piezas interactivas quiero jugar con las palabras art generative love, con el c�digo, y que el espectador forme parte de la obra . \n\nel c�digo fuente se puede encontrar en albagcorral.com\nRealizado con processing ";
  //text(s, margen, 20, 70, 70);
  text(s, margen, 60,350,200); 
  fill(255,255, 255);
  initMenu();
  initMenu2();

}
void initMenu(){

  text("mueve el ratón y arrstralo para dibujar.  ", margen,posy,350,200); 
  text("m volver al men�.", margen, posy+20,ancho-10,200); 
  text("+ aumentar tama�o de las esferas.", margen, posy+40,ancho-10,200); 
  text("- disminuir tama�o de las esferas. ", margen,posy+60,ancho-10,200); 
  text("b Activar / desactivar esferas. ", margen,posy+80,ancho-10,200); 
 
  text("s guardar imagen.", margen, posy+100,ancho-10,200);     
}
void initMenu2(){

  text("mueve el ratón y arrástralo para dibujar.  ", ancho - margen*margen,posy,350,200); 
  text("m volver al men�.", ancho - margen*margen, posy+20,ancho-10,200); 
  text("s guardar imagen.", ancho - margen*margen, posy+40,ancho-10,200);     
}
void initMenu1(){

  text("rat�n mantener pulsado y mover | m volver al men� | + aumentar tama�o |- disminuir tama�o |- guardar ", margen,alto-10,350,200); 
  textFont(font,10); 
  fill(255,255, 255);

}
void generative_art(int theValue) {
 
  println("contadorBoton"+contadorBoton);
  if (contadorBoton == 1){
    boo_start = true;
    controlP5.hide();
    w[0] = new Preset1(); //nuevo cienPies donde le pasamos la posicion inicial x y la posicion inicial y 
    // println("a button event. "+controlP5);
  }
  background(0); 
  contadorBoton++;
}

void generative_love(int theValue) {
 
  println("contadorBoton2"+contadorBoton2);
  if (contadorBoton2 == 1){
    boo_start2 = true;
    controlP5.hide();
    preset2 = new Preset2();
    // println("a button event. "+controlP5);
  }
  background(0); 
  contadorBoton2++;
}
void menuDesaparece(){

  controlP5.hide();
}
void menuAparece(){
  colorMode(RGB, 255);
  dibujaRectangulo();
  noFill();
  noStroke();
  Texto();
  boo_start = false;
  boo_start2 = false;
  contadorBoton = 1;
  contadorBoton2 = 1;
  controlP5.show();


}

boolean isPinceles(){
  //  println("pinceles"+pinceles);
  return pinceles;
}
