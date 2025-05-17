PImage[] imagenes = new PImage[10];
PImage BotonInicio, BotonReinicio;

PFont fuenteGrande;
PFont fuenteNormal;

int pantalla = 0;
int tiempoInicio = 0;
int duracion = 8000; 

//Variables de animación
float opacidadTexto = 0;
float xMovimiento = 0;
boolean moviendoDerecha = true;
int parpadeoColor = 0;

void setup(){
  size(640, 480); 
  background(5,4,6);
  
  //Cargo imágenes de fondo:
  imagenes[0] = loadImage("Imagen 1.PNG");
  imagenes[1] = loadImage("Imagen 2.jpg");
  imagenes[2] = loadImage("Imagen 3.jpg");
  imagenes[3] = loadImage("Imagen 4.jpg");
  imagenes[4] = loadImage("Imagen 5.jpg");
  imagenes[5] = loadImage("Imagen 6.jpg");
  imagenes[6] = loadImage("Imagen 7.png");
  imagenes[7] = loadImage("Imagen 8.png");
  imagenes[8] = loadImage("Imagen 9.PNG");
  imagenes[9] = loadImage("Imagen 10.PNG");
  
  //Cargo imágenes de botones: 
  BotonInicio = loadImage("Botón Inicio.png");
  BotonReinicio = loadImage("Botón Reinicio.png");

  //Cargo fuentes:
  fuenteGrande = createFont("SansSerif", 30); 
  fuenteNormal = createFont("SansSerif", 14);
  
  tiempoInicio = millis();
} 

void draw() { 
  background(5,4,6);
  
  //Código para mostrar contenido según la pantalla: 
  switch(pantalla) {
    case 0:
      pantallaInicio();
      break;
    case 1:
      pantalla1();
      break;
    case 2:
      pantalla2();
      break;
    case 3:
      pantalla3();
      break;
    case 4:
      pantalla4();
      break;
    case 5:
      pantalla5();
      break;
    case 6: 
      pantalla6();
      break;
    case 7:
      pantalla7();
      break;
    case 8: 
      pantalla8();
      break;
    case 9:
      pantallaFinal();
      break;
} 

//Transición automática (excepto pantalla 0 y 9): 
if (pantalla > 0 && pantalla < 9) {
  if (millis() - tiempoInicio > duracion) {
    pantalla++;
    tiempoInicio = millis();
    opacidadTexto = 0;
    xMovimiento = 0;
    parpadeoColor = 0;
    }
  }
}

void mousePressed() {
  //Botón de INICIO en Pantalla 0:
  if (pantalla == 0) {
    if (mouseX > 115 && mouseX < 115 + 70 && mouseY > 250 && mouseY < 250 + 70) {
      pantalla = 1;
      tiempoInicio = millis();
      opacidadTexto = 0;
    }
  }
  
  //Botón de REINICIO en Pantalla 9: 
  if (pantalla == 9) {
    if (mouseX > 550 && mouseX < 550 + 70 && mouseY > 400 && mouseY < 400 + 70) {
      pantalla = 0;
      opacidadTexto = 0;
      xMovimiento = 0;
      parpadeoColor = 0;
    }
  }
} 

// Pantalla 0
void pantallaInicio() {
  image(imagenes[0], 320, 0, 320, 480);
  fill(255);
  textFont(fuenteGrande); 
  textAlign(CENTER);
  text("La Oruga",150,180);
  
  textFont(createFont("SansSerif",9));
  textAlign(LEFT);
  text("Relato de Edogawa Ranpo",100,200);
  
  image(BotonInicio,115,250,70,70);
 }

//Pantalla 1
void pantalla1() {
 image(imagenes[1], 320, 0, 320, 480);

  float distancia = dist(mouseX, mouseY, 150, 200);
  if (distancia < 150 && opacidadTexto < 255) {
    opacidadTexto += 5;
  }

  fill(255, opacidadTexto);
  textFont(fuenteNormal);
  textAlign(CENTER);
  text("Tokiko vive tranquilamente\nhasta que su esposo, el\nTeniente Sunaga, regresa de la\nguerra gravemente mutilado:\nsin brazos, sin piernas, sin\npoder hablar ni oír, y con el\nrostro deformado.",150,200);
}

//Pantalla 2:
void pantalla2() {
  image(imagenes[2], 20, 20, 600, 350);

  if (moviendoDerecha) {
    xMovimiento += 0.5;
    if (xMovimiento > 20) moviendoDerecha = false;
  } else {
    xMovimiento -= 0.5;
    if (xMovimiento < -20) moviendoDerecha = true;
  }

  fill(255);
  textFont(fuenteNormal);
  textAlign(CENTER);
  text("Tokiko asume el cuidado completo de su esposo.\nAl principio lo hace por deber conyugal, mezclado\ncon lástima y repulsión.", width/2 + xMovimiento, 400);
}

//Pantalla 3:
void pantalla3() {
  image(imagenes[3], 0, 0, 640, 240);

  if (moviendoDerecha) {
    xMovimiento += 1.5;
    if (xMovimiento > 30) moviendoDerecha = false;
  } else {
    xMovimiento -= 1.5;
    if (xMovimiento < -30) moviendoDerecha = true;
  }

  fill(255);
  textFont(fuenteNormal);
  textAlign(CENTER);
  text("Sunaga desarrolla una dependencia total de Tokiko. Se\ncomunica únicamente con los ojos y con movimientos mínimos,\ngenerando una atmósfera opresiva y asfixiante.", width/2 + xMovimiento, 340);
}

//Pantalla 4:
void pantalla4() {
  image(imagenes[4], 0, 0, 320, 480);

  if (opacidadTexto < 255) opacidadTexto += 5;

  fill(255, opacidadTexto);
  textFont(fuenteNormal);
  textAlign(CENTER);
  text("Tokiko comienza a tener\nemociones encontradas:\ncompasión, repulsión,\ndeseo y odio.\nLa imagen de su esposo\ncomo una 'oruga humana'\ncomienza a provocarle una\nmezcla de miedo y\nfascinación.", 480, 200);
}

//Pantalla 5:
void pantalla5() {
  image(imagenes[5], 320, 0, 320, 480);

  parpadeoColor++;
  if (parpadeoColor % 15 < 5) fill(255);
  else if (parpadeoColor % 15 < 10) fill(255, 255, 0);
  else fill(255, 0, 0);

  textFont(fuenteNormal);
  textAlign(CENTER);
  text("Tokiko descubre que su\nesposo siente exitación al\nser humillado y sometido.\nEsto despierta en ella una\nfaceta sádica de lo más\nretorcida.", 150, 200);
}

//Pantalla 6:
void pantalla6() {
  image(imagenes[6], 0, 0, 640, 300);

  parpadeoColor++;
  if (parpadeoColor % 15 < 5) fill(255);
  else if (parpadeoColor % 15 < 10) fill(255, 255, 0);
  else fill(255, 0, 0);

  textFont(fuenteNormal);
  textAlign(CENTER);
  text("Tokiko empieza a dominar física y psicológicamente a su esposo.\nLa relación toma un cariz perverso, con elementos de\nsadomasoquismo y tortura emocional.", width/2, 350);
}

//Pantalla 7: 
void pantalla7() {
  image(imagenes[7], 0, 0, 400, 480);

  parpadeoColor++;
  if (parpadeoColor % 15 < 5) fill(255);
  else if (parpadeoColor % 15 < 10) fill(255, 255, 0);
  else fill(255, 0, 0);

  textFont(fuenteNormal);
  textAlign(CENTER);
  text("Tokiko ya no oculta\nsu desprecio y\ndesfruta de su\npoder sobre él.\nSe convierte en su carcelera,\nusándolo como un\nobjeto.", 520, 200);
}

// PANTALLA 8: Parpadeo
void pantalla8() {
  image(imagenes[8], 0, 0, 640, 370);

  parpadeoColor++;
  if (parpadeoColor % 15 < 5) fill(255);
  else if (parpadeoColor % 15 < 10) fill(255, 255, 0);
  else fill(255, 0, 0);

  textFont(fuenteNormal);
  textAlign(CENTER);
  text("Este relato concluye con Tokiko totalmente transformada y con\nSunaga reducido a un ser pasivo, indefenso, sometido por\ncompleto a los caprichos de su esposa.\nAl final, Sunaga se suicida.", 320, 400);
}

//Pantalla 9
void pantallaFinal() {
  image(imagenes[9], 200, 0, 440, 480);

  if (opacidadTexto < 255) opacidadTexto += 3;

  fill(255, opacidadTexto);
  textFont(createFont("SansSerif", 12));
  textAlign(CENTER);
  text("Sobre el relato:\n\nFue censurado\ndurante la 2ª Guerra\nMundial por su\nrepresentación crítica\nde las secuelas de la guerra.\n\n'La Oruga' ha sido\nadaptada al manga y\nal cine y, en YouTube,\nexiste un maravilloso\naudiolibro realizado\npor el usuario 'Quetzal'.", 120, 190);

  image(BotonReinicio, 550, 400, 70, 70);
}
