class Platform extends Obstacle{
  int state;
  int stateMax;
  ArrayList<PVector> states;
  
  Platform(){
    this(0,0);
  }
  Platform(float x, float y){
    this(x,y,10,30);
  }
  Platform(float x, float y, int _w, int _h){
    super("platform", x, y, _w, _h); 
    state = 0;
    stateMax = 0;
    states = new ArrayList<PVector>();
    states.add(position);
  }
  
  void addState(float x, float y){
    states.add(new PVector(x,y,0));
    stateMax++;
    
  }
  
  void adjustState(){
    //println("adjusting state...");
    //println("states.size() : " + states.size());
    if (state < stateMax){
      state++;
    }
    else {
      state =0;
    }
    position = states.get(state);
    //println("states.get(state) // states.get(" + state + ") : " + position);
  }
  
  void display(){
    PVector currentState = states.get(state);
    fill(PLATFORM);
    rect(currentState.x, currentState.y,w,h);
  }
  
  PVector topLeft(){
    return position;
  }
  
  PVector topRight(){
    return new PVector(position.x+w, position.y,0);
  }
  
  PVector bottomLeft(){
    return new PVector(position.x, position.y+h, 0);
  }
  
  PVector bottomRight(){
    return new PVector(position.x+w, position.y+h,0);
  }
}
