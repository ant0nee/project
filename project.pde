import net.java.games.input.*;
import org.gamecontrolplus.*;
import org.gamecontrolplus.gui.*;

ControlIO control;
ControlDevice gpad; 
void settings() {
  
  //gamepad stuff
  control = ControlIO.getInstance(this);
  gpad = control.getDevice("Controller (Xbox One For Windows)");
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

ControlButton[] button;
ControlSlider[] slider;
ControlButton hat; 
int BUTTON_A = 0; 
int BUTTON_B = 1; 
int BUTTON_X = 2; 
int BUTTON_Y = 3; 
int BUTTON_LB = 4; 
int BUTTON_RB = 5; 
int BUTTON_SL = 6; 
int BUTTON_ST = 7; 
int BUTTON_LS = 8; 
int BUTTON_RS = 9; 
int BUTTON_PD = 10; 
int SLIDER_1Y = 0; 
int SLIDER_1X = 1; 
int SLIDER_2Y = 2; 
int SLIDER_2X = 3; 
int SLIDER_BMP = 4; //left bumper > 0, left bumper < 0

void setup() {
  
  ControlButton[] temp = {
    gpad.getButton(BUTTON_A),
    gpad.getButton(BUTTON_B),
    gpad.getButton(BUTTON_X),
    gpad.getButton(BUTTON_Y),
    gpad.getButton(BUTTON_LB),
    gpad.getButton(BUTTON_RB),
    gpad.getButton(BUTTON_SL),
    gpad.getButton(BUTTON_ST),
    gpad.getButton(BUTTON_LS),
    gpad.getButton(BUTTON_RS),
    gpad.getButton(BUTTON_PD)
  };
  button = temp; 
  ControlSlider[] temp2 = {
    gpad.getSlider(SLIDER_1Y),
    gpad.getSlider(SLIDER_1X),
    gpad.getSlider(SLIDER_2Y),
    gpad.getSlider(SLIDER_2X),
    gpad.getSlider(SLIDER_BMP)
    
  };
  slider = temp2; 
  
}

void draw() {  
  
  println(slider[5].getValue());
  
}