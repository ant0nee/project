JSONObject options; 
void settings() {
 
  options = loadJSONObject("options.json");
  if (options.getJSONObject("screen").getBoolean("fullscreen")) {
    fullScreen();  
  } else {
   
    size(
      options.getJSONObject("screen").getJSONObject("size").getInt("width"),
      options.getJSONObject("screen").getJSONObject("size").getInt("height")
    );
    
  }
  
}


void setup() {
}

void draw() {  
}