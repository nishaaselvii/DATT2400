Doom[] doomettes;
int spotWidth = 25;
int spotHeight = 25;
int spotXCor= 780;
int spotYCor = 390;
int threshold = 15;
int level = 8;
float points = 1;
boolean Collided = false;


void initdoomettes(int xLow, int xHigh, int yLow, int yHigh, int num) {
  doomettes = new Doom[num];

  for (int i = 0; i < doomettes.length; i++) {
    int x = (int)random(xLow, xHigh);
    int y = (int)random(yLow, yHigh);
    doomettes[i] = new Doom(x, y, 10, 20);
  }
}
void setup() {
  size(500, 500);
  background(255);
  initdoomettes(-80, width + 20, -150, -69, level);
}

void draw() {

  background(255);
  drawDoomies();

  if (!Collided) {
    moveDoomettes();
    if (points > threshold && points < threshold + 2) {
      initdoomettes(-80, width + 20, -150, -69, level);
      level += 10;
      threshold += 20;
    }
  } else {
    background(0);
    textSize(72);
    text("GAME OVER :(", width/2-195, height/2);
    textSize(42);
    text("bEtTeR lUcK nExT tImE ", width/2-195, height/2+100);
  }
}


void moveDoomettes() {
  for (int i = 0; i < doomettes.length; i++) {
    if (doomettes[i].yShift > height) {
      doomettes[i].yShift = -15;
    }
    doomettes[i].display();
    doomettes[i].fall(random(1, 20));

   
    boolean slideUp =  doomettes[i].yShift >= spotYCor;
    boolean slideDown = doomettes[i].yShift + doomettes[i].t <= spotYCor + spotHeight + 2;
    boolean slideXLeft = doomettes[i].xShift + doomettes[i].q >= spotXCor;
    boolean slideXRight = doomettes[i].xShift + doomettes[i].q <= spotXCor + spotWidth + 4;

    if (slideXLeft && slideXRight && slideUp && slideDown) {
      Collided = true;
    }
  }


  points += 0.18;
}



void drawDoomies() {
  fill(68, 244, 197);
  rect(spotXCor, spotYCor, spotWidth, spotHeight);
}




void mouseDragged() {
  if (mouseX >= 0 && mouseX <= width - spotWidth + 2) {
    spotXCor = mouseX;
  }
  if (mouseY >= 500 && mouseY <= height - spotHeight) {
    spotYCor = mouseY;
  }
}
