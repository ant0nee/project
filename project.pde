void settings() {
  
  //gamepad stuff
  control = ControlIO.getInstance(this);
  
  controller = controller(); 
  
  //load settings from file 
  JSONObject options = loadJSONObject("options.json");
  if (options.getJSONObject("screen").getBoolean("fullscreen")) {
    fullScreen();  
  } else {
   
    size(
      options.getJSONObject("screen").getJSONObject("size").getInt("width"),
      options.getJSONObject("screen").getJSONObject("size").getInt("height")
    );
    
  }

}
boolean controller = false; 
void setup() {
  
  
  
}

void draw() {
  
  control.pre();
  background(255);
  textSize(40);
  fill(0);
  if (controller) {
    String text = ""; 
    String text2 = ""; 
    for (int i = 0; i < 12; i++) {
      
      text += "button "+i+" "+gpad.getButton(i).pressed()+" ("+gpad.getButton(i).getValue()+")\n";
      
    }
    
    for (int i = 0; i < 6; i++) {
      
      gpad.getSlider(i).setTolerance(0.5);
      text2 += "slider "+i+" "+gpad.getSlider(i).getValue()+"\n";
      
    }
    
    
  
    textAlign(LEFT, TOP);
    text(text,0,0);
    textAlign(RIGHT, TOP);
    text(text2,width,0);
  }
  textAlign(LEFT, BOTTOM);
  text((gpad == null ? "gamepad disconnected":"gamepad connected"),0,height);
  
}