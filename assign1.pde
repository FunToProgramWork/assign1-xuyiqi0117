PImage bg,groundhog,life,robot,soil,soldier;//import pictures
int s,r,h,robotHandX,laserStart,robotHandY;//import variable
int[] soilOrdinate = {160,240,320,400};//import ordinate of soil
int[] robotAbscissa = {185,265,345,425,505,585};//import abscissa of robot

void random(){//make sure soldier and robot randomly on different layers, if not, randomly obtained again
  int numberS = int(random(soilOrdinate.length));//random number determines soldier's layer
  r = soilOrdinate[numberS];
  int numberR = int(random(soilOrdinate.length));//random number determines robot's layer
  h = soilOrdinate[numberR];
  int numberH = int(random(robotAbscissa.length));//random number determines location of robot's hand
  robotHandX = robotAbscissa[numberH];
  if(r == h){
    random();
  } 
}

void setup() {
  size(640, 480, P2D);//set canvas
  bg = loadImage("bg.jpg");//import pictures
  groundhog = loadImage("groundhog.png");
  life = loadImage("life.png");
  robot = loadImage("robot.png");  
  soil = loadImage("soil.png");
  soldier = loadImage("soldier.png");
  
  s = 0;//soldier's initial abscissa
  random();//get random value
  laserStart = robotHandX;//set the initial value where laser starts
  robotHandY = h+37;//set the laser's height
}

void draw() {
  background(bg);//draw the sky
  image(soil,0,160);//draw the soil
  image(life,10,10);//draw the blood bar
  image(life,80,10);
  image(life,150,10); 
  image(groundhog,280,80);//draw the groundhog
  
  noStroke();//draw the grass
  fill(124, 204, 25);
  rect(0,145,640,15);
  
  fill(255, 255, 0);
  ellipse(590,50,130,130);//draw the sun
  fill(253, 184, 19);
  ellipse(590,50,120,120);//draw another part of sun
  
  image(soldier,s,r);//draw the soldier
  s+=5;
  if(s > 640)
    s = -80;
    
  image(robot,robotHandX-25,h);//draw the robot
  
  stroke(255,0,0);//draw the laser light
  strokeWeight(10);
  laserStart-=2;
  if(laserStart>robotHandX-40){
    line(laserStart,robotHandY,robotHandX,robotHandY);
  }
  else if(laserStart>=robotHandX-185){
    line(laserStart,robotHandY,laserStart+40,robotHandY);
  }
  else if(laserStart<robotHandX-185)
    laserStart=robotHandX;
}
