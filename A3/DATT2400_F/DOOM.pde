class Doom{

  public int xShift;
  public int yShift;
  public int q;
  public int t;

  Doom(int xVal, int yVal, int qVal, int tVal){
    xShift = xVal;
    yShift = yVal;
    q = qVal;
    t = tVal;
   
    
  } 
  
  public void fall(float speed){
    yShift += speed;
  }
  
  public void display(){
    stroke(203, 87, 99);
    fill(103, 199, 74);
    rect(xShift, yShift,q,t,10);
  }
}
