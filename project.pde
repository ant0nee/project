import anthony.*;
void settings() {
 
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

void setup() {
  
  SvgEditor.svgToPng("test");
  
}

void draw() {  
  
}