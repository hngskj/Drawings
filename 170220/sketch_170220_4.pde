float thick = 7;
float linel = 80;
int num = 100;
int arr = 0;

void setup(){
  size(700, 700);
  pixelDensity(2);
  smooth();
  colorMode(HSB, 360, 100, 100);
  frameRate(1);
}

void draw(){
  background(0, 0, 10);
  arr = floor(random(310));
  
  for (int i = 0; i < num; i++){
    grad(random(-linel, width-linel/2), linel, random(0, height-thick), thick, floor(random(arr, arr+50)));
  }
}

void grad(float xpos, float xlen, float ypos, float ylen, int col){
  for (float i=xpos; i<xpos+xlen; i++){
    stroke(col, 100, 100, map(i, xpos, xpos+xlen, 0, 255));
    line(i, ypos, i, ypos+ylen);
  }
}
