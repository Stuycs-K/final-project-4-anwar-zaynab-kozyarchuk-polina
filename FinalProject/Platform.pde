class Platform{
  PVector position;
  int state;
  int stateMax;
  ArrayList<PVector> states;
  int w;
  int h;
  
  Platform(){
    this(0,0);
  }
  Platform(float x, float y){
    this(x,y,1);
  }
  Platform(float x, float y, int _stateMax){
    this(x,y,20,10, _stateMax);
  }
  Platform(float x, float y, int _w, int _h, int _stateMax){
    this(x,y,_w,_h,0, _stateMax);
  }  
  Platform(float x, float y, int _w, int _h, int _state, int _stateMax){
    position = new PVector(x,y,0);
    state = _state;
    stateMax = _stateMax;
    states = new ArrayList<PVector>();
    states.add(position);
    w = _w;
    h = _h;
  }
  
  void addState(int x, int y){
    if (states.size() <= stateMax){
      states.add(new PVector(x,y,0));
    } else {
      throw new IndexOutOfBoundsException("already at max amount of states");
    }
  }
  
  void adjustState(){
    if (state < stateMax){
      state++;
    }
    else {
      state =0;
    }
  }
  
  void display(){
    PVector currentState = states.get(state);
    fill(PLATFORM);
    rect(currentState.x, currentState.y,w,h);
  }
}
