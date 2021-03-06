
boolean StartFlg;

// Count
int RouletteMaxTime;
int RouletteCountTime;

// Needle Angle
float T;

void setup() {
  
  size(500, 500); //<>//
  frameRate(30);
  
  T = -PI/2;
  RouletteCountTime = 0;
  RouletteMaxTime= (int)random(700)+300;
  StartFlg = false;
  
}

void draw() {
  
  if(!StartFlg){
    startdraw();
  }else{
    backdraw();
    linedraw();
    if(RouletteCountTime > RouletteMaxTime + 20){
      hantei();
    }
  }
}

void startdraw(){
  
  background(255);
  fill(255,100,0); //<>//
  textSize(35);
  textAlign(CENTER);
  text("OTOSHIDAMA ROULETTE",250,200);
  
  fill(0);
  textSize(30);
  text("Press Enter Key",250,250);
  textAlign(LEFT);
  
  if ((keyPressed == true) && (key == ENTER)) {
    StartFlg = true;
  }
  
}

void hantei(){
  
  float count = (T + PI/2) % (2 * PI);
  
  if(count<Const.T10000){
    result(10000);
  }else if(count<Const.T5000){
    result(5000);
  }else if(count<Const.T2000){
    result(2000);
  }else if(count<Const.T1000){
    result(1000);
  }else{
    result(500);
  }
}
 
void result(int count){
  fill(255);
  rect(50, 150, 400, 200);
  fill(0);
  textSize(100);
  textAlign(CENTER);
  text("¥"+str(count),250,280);
}

void backdraw(){
  // backgournd is init
  background(255,255,100);
  
  // ellipse
  fill(255);
  ellipse(Const.Center,Const.Center,Const.Center+240,Const.Center+240);
  
  float initt = 0-PI/2;
  float t10000 = Const.T10000-PI/2;
  float t5000 = Const.T5000-PI/2;
  float t2000 = Const.T2000-PI/2;
  float t1000 = Const.T1000-PI/2;
  
  line(Const.Center,Const.Center,cosresult(initt),sinresult(initt));
  line(Const.Center,Const.Center,cosresult(t10000),sinresult(t10000));
  line(Const.Center,Const.Center,cosresult(t5000),sinresult(t5000));
  line(Const.Center,Const.Center,cosresult(t2000),sinresult(t2000));
  line(Const.Center,Const.Center,cosresult(t1000),sinresult(t1000));
  
  if(!(RouletteCountTime > RouletteMaxTime + 20)){
    // text
    fill(0);
    textSize(50);
    text("¥500",50,250);
    fill(0);
    textSize(50);
    text("¥1000",300,300);
    fill(0);
    textSize(30);
    text("¥2000",300,120);
    fill(0);
    textSize(20);
    text("¥5000",400,30);
    line(265,90,390,35);
    line(390,35,470,35);
    fill(255,0,0);
    textSize(20);
    text("¥10000",20,30);
    line(255,70,98,33);
    line(98,33,20,33);
    
  }
  
}

float cosresult(float t){
  return 245*cos(t)+Const.Center;
}

float sinresult(float t){
  return 245*sin(t)+Const.Center;
}

void linedraw(){
  
  // line draw speed change
  if(RouletteCountTime > RouletteMaxTime - 70 && 
     RouletteCountTime < RouletteMaxTime){
    T += 0.02;
  }else if(RouletteCountTime > RouletteMaxTime - 120 && 
           RouletteCountTime < RouletteMaxTime){
    T += 0.05;
  }else if(RouletteCountTime < RouletteMaxTime){
    T += 0.1;
  }
  
  // ellipse line draw
  float x = Const.NeedleLength*cos(T)+Const.Center;
  float y = Const.NeedleLength*sin(T)+Const.Center;
  line(Const.Center,Const.Center,x,y);
  
  RouletteCountTime ++;
}