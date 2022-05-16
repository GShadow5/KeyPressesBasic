class Demo{
  PVector pos;
  
  Demo(PVector _pos){
    pos = _pos.copy();
  }
  Demo(float x, float y){
    this(new PVector(x,y));
  }
  
  void display(){ // Move and then draw a circle when display is called
    move();
    noStroke();
    fill(100);
    circle(pos.x,pos.y,10);
  }
  
  // Check if each key is in the keys array. 
  // Notice I do not use else if, because I want multiple to be able to trigger at once.
  private void move(){ 
    if(findInt(keys,'w') != -1){ pos.y -= 2; }
    if(findInt(keys,'a') != -1){ pos.x -= 2; }
    if(findInt(keys,'s') != -1){ pos.y += 2; }
    if(findInt(keys,'d') != -1){ pos.x += 2; }
  }
}
