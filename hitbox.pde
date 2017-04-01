public class Hitbox {
 
  private int x, y, wid, hei; 
  
  Hitbox(int _x, int _y, int _wid, int _hei) {
   
    x = _x; 
    y = _y; 
    wid = _wid; 
    hei = _hei;
    
  }
  
  public static final int X = 0, Y = 1, WIDTH = 2, HEIGHT = 3; 
  
  public int[] getHitbox() {
    
    int[] temp = {x, y, wid, hei};
    return temp;
    
  }
  
}