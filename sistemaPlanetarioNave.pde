PImage img;
int zoom = 0;

Planet sol, pl1, pl2, pl3, pl4, pl5;
Camara cam;

void setup(){
  size(1500,1000, P3D);
  img = loadImage("https://www.solarsystemscope.com/textures/download/2k_stars_milky_way.jpg"); 
  img.resize(width,height);
  
  noStroke();
  
  sol = new Planet(120, 0, 0, 0, 0.1, 0.1, 0, "Sol", "https://www.solarsystemscope.com/textures/download/2k_sun.jpg", "", "");
  pl1 = new Planet(25, 0, -380, 380, 0.15, 0.1, 0.016, "Planeta 1", "https://www.solarsystemscope.com/textures/download/2k_mercury.jpg", "", "");
  pl2 = new Planet(40, 500, 0, 500, 0.15, 0.1, 0.012, "Planeta 2", "https://www.solarsystemscope.com/textures/download/2k_earth_daymap.jpg", "Luna de Planeta 2", "https://www.solarsystemscope.com/textures/download/2k_moon.jpg");
  pl3 = new Planet(30, 700, 700, 700, 0.15, 0.1, 0.01, "Planeta 3", "https://www.solarsystemscope.com/textures/download/2k_mars.jpg", "", "");
  pl4 = new Planet(40, 0, 900, 900, 0.15, 0.1, 0.008, "Planeta 4", "https://www.solarsystemscope.com/textures/download/2k_saturn.jpg", "", "");
  pl5 = new Planet(20, -1200, 0, 1200, 0.15, 0.1, 0.004, "Planeta 5", "https://www.solarsystemscope.com/textures/download/2k_neptune.jpg", "Luna de Planeta 5", "https://www.solarsystemscope.com/textures/download/2k_moon.jpg");
  cam = new Camara(1.0, 600);

}

void draw(){
  background(img);
  sol.display();
  pl1.display();
  pl2.display();
  pl3.display();
  pl4.display();
  pl5.display();
  cam.display();
  
}

void keyPressed(){
  if (keyCode == LEFT){
    cam.camrotateX(-1);
  }
  if (keyCode == RIGHT){
    cam.camrotateX(1);
  }
  if (keyCode == UP){
    cam.camrotateY(-1);
  }
  if (keyCode == DOWN){
    cam.camrotateY(1);
  }
  if (key == ' '){
    cam.moveZ(1);
  }
  
  
  if (keyCode == BACKSPACE){
    cam.reset();
  }
  if (keyCode == ENTER){
    cam.change();
  }
}

void keyReleased(){
  if (keyCode == LEFT){
    cam.camrotateX(0);
  }
  if (keyCode == RIGHT){
    cam.camrotateX(0);
  }
  if (keyCode == UP){
    cam.camrotateY(0);
  }
  if (keyCode == DOWN){
    cam.camrotateY(0);
  }
  if (key == ' '){
    cam.moveZ(0);
  }
}




class Planet{
  int radioPlaneta, radioSolX, radioSolY, radioSolZ;
  float rotacionX, rXInc, rotacionY, rYInc;
  float traslacion, tInc;
   
  String nombrePlaneta, texturaPlaneta, nombreLuna, texturaLuna;

  PShape planet, moon;
  Planet(int rP, int rSX, int rSY, int rSZ, float rX, float rY, float t, String nP, String tP, String nL, String tL){
     radioPlaneta = rP;
     radioSolX = rSX;
     radioSolY = rSY;
     radioSolZ = rSZ;
     rotacionX = 0;
     rXInc = rX;
     rotacionY = 0;
     rYInc = rY;
     traslacion = 0;
     tInc = t;
     nombrePlaneta = nP;
     texturaPlaneta = tP;
     nombreLuna = nL;
     texturaLuna = tL;
     
     planet = createShape(SPHERE, radioPlaneta);
     if (texturaPlaneta != "") { planet.setTexture(loadImage(texturaPlaneta));}
     if (nombreLuna != ""){
       moon = createShape(SPHERE, 15);
       if (texturaLuna != "") {moon.setTexture(loadImage(texturaLuna));}
     }
  }
  
  void display(){
    textAlign(CENTER);
    if (nombreLuna != ""){
      pushMatrix();
        translate((width/2)+radioSolX*cos(traslacion)+(radioPlaneta+20+15)*cos(traslacion*5), (height/2)+radioSolY*cos(traslacion)+(radioPlaneta+20+15)*cos(traslacion*5), radioSolZ*sin(traslacion)+(radioPlaneta+20+15)*sin(traslacion*5));
        textSize(32);
        text(nombreLuna, 0, 45,0);
        rotateX(radians(rotacionX));
        rotateY(radians(rotacionY));        
        shape(moon);
      popMatrix();
    }
    pushMatrix();
      translate((width/2)+radioSolX*cos(traslacion), (height/2)+radioSolY*cos(traslacion), radioSolZ*sin(traslacion));
      textSize(32);
      text(nombrePlaneta, 0, radioPlaneta+30,0);
      rotateX(radians(rotacionX));
      rotateY(radians(rotacionY));
      shape(planet);
    popMatrix();
    ajustarRotacion();
    ajustarTraslacion();
  }
  
  
  void ajustarRotacion(){
    rotacionX += rXInc;
    if(rotacionX > 360){
      rotacionX = 0;
    }
    
    rotacionY += rYInc;
    if(rotacionY > 360){
      rotacionY = 0;
    }
  }
  
  void ajustarTraslacion(){
    traslacion += tInc;
    if(traslacion > 360){
      traslacion = 0;
    }
  }  
}

class Camara{
  
  float rotationAngle;
  float cameraReduction;
  
  float realPosX, lookX, realPosY, lookY, realPosZ, lookZ;
  boolean change = true;
  
  int directionX, directionY, directionZ;
  float xMove, yMove, zMove;
  
  PShape esfera;
  Camara(float rA, float cS){
    rotationAngle = rA;
    cameraReduction = cS;
    
    realPosX = width/2.0;
    lookX = width/2.0;
    realPosY = height/2.0;
    lookY = height/2.0;
    realPosZ = 1500;
    lookZ = 0; 
    
    
    directionX = 0;
    directionY = 0;
    directionZ = 0;
    esfera = createShape(SPHERE, 20);
    esfera.setTexture(loadImage("pngkit_death-star-png_119415.png"));
    
  }

  void reset(){
    realPosX = width/2.0;
    lookX = width/2.0;
    realPosY = height/2.0;
    lookY = height/2.0;
    realPosZ = 1500;
    lookZ = 0; 
    
    change = true;
    directionX = 0;
    directionY = 0;
  }
  
  void change(){
    change = !change;
  }

  void display(){
    if (change){
      camera((width/2.0)+300, (height/2.0)-200,  2000, (width/2.0), (height/2.0), 0, 0, 1, 0);
      pushMatrix();
        translate(500, 40,  1500);
        textAlign(LEFT);
        textSize(12);
        rotateY(PI/24);
        rotateX(PI/32);
        text("Use las flechas para mover la direccion",5,20);
        text("Use el espacio para avanzar",5,40);
        text("Pulsa enter para cambiar entre la vista de la nave y la panoramica",5,60);
        text("Pulsa retroceso para resetear",5,80);
      popMatrix();
    }  else {
      if (!change && directionX != 0){
        lookX = ((lookX - realPosX) * cos(radians(directionX*rotationAngle)) - (lookZ - realPosZ) * sin(radians(directionX*rotationAngle))) + realPosX;
        lookZ = ((lookX - realPosX) * sin(radians(directionX*rotationAngle)) + (lookZ - realPosZ) * cos(radians(directionX*rotationAngle))) + realPosZ;
      }
      if (!change && directionY != 0){
        lookY = lookY +(20*directionY);
      }
      if (!change && directionZ != 0){
        xMove = (lookX-realPosX)/cameraReduction;
        yMove = (lookY-realPosY)/cameraReduction;
        zMove = (lookZ-realPosZ)/cameraReduction;
        
        realPosX = realPosX + xMove;
        lookX = lookX + xMove;
        
        realPosY = realPosY +yMove;
        lookY = lookY + yMove;
        
        realPosZ = realPosZ + zMove;
        lookZ = lookZ + zMove;
      }
      camera(realPosX, realPosY,  realPosZ, lookX, lookY, lookZ, 0, 1, 0);
    }
    pushMatrix();
      translate(realPosX, realPosY,  realPosZ);
      shape(esfera);
    popMatrix();

  }
  
  void camrotateX(int direction){
    directionX = direction;
  }
  
  void camrotateY(int direction){
    directionY = direction;
  }
  
  void moveZ(int direction){
    directionZ = direction;
  }
  
  boolean getChange(){
    return change;
  }
  
}
