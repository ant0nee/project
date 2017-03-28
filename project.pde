JSONObject options; 
PImage image; 
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
  
  if (svgToPng("example.svg", 2000, 2000)){ 
    image = loadImage("generated_png/example.png");
  } else {
    exit();  
  }
  
}

void draw() {  
  
  image(image, 0, 0);
  
}