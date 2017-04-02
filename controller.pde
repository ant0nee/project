import net.java.games.input.*;
import org.gamecontrolplus.*;
import org.gamecontrolplus.gui.*;
ControlIO control;
ControlDevice gpad = null; 
final int BUTTON_A = 0; 
final int BUTTON_B = 1; 
final int BUTTON_X = 2; 
final int BUTTON_Y = 3; 
final int BUTTON_LB = 4; 
final int BUTTON_RB = 5; 
final int BUTTON_SL = 6; 
final int BUTTON_ST = 7; 
final int BUTTON_LS = 8; 
final int BUTTON_RS = 9; 
final int BUTTON_PD = 10; 
final int BUTTON_UNKNOWN = 11; 
final int SLIDER_1Y = 0; 
final int SLIDER_1X = 1; 
final int SLIDER_2Y = 2; 
final int SLIDER_2X = 3; 
final int SLIDER_BMP = 4; //left bumper > 0, left bumper < 0
final int SLIDER_UNKNOWN_1 = 5;
final int SLIDER_UNKNOWN_2 = 6;
boolean controller() {
 
  for (int i = 0; i < control.getDevices().size(); i++) {
    
    if (control.getDevices().get(i).getTypeName().equals("Gamepad")) {
     
      if (gpad == null) {
 
        gpad = control.getDevice(control.getDevices().get(i).getName());
        
      }

      return true; 
      
    }
    
  }
  
  control = null;
  gpad = null;
  return false;
  
}