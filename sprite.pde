public class Sprite{
 
  Hitbox[] hitbox; 
  PImage[] sprite; 
  private int frame = 0; 
  private int x = 0; 
  private int y = 0; 
  Sprite(Hitbox[] _hitbox, PImage[] _sprite) {
    
    hitbox = _hitbox; 
    sprite = _sprite;
    
  }
  
  public int getX() {
   
    return x; 
    
  }
  
  public int getY() {
   
    return y; 
    
  }
  
  public Hitbox[] getHitbox() {
    
    return hitbox; 
    
  }
  
  public boolean collision(Sprite obj) {
    
    Hitbox[] hitbox2 = obj.getHitbox();
    for (Hitbox hit1 : hitbox) {
      for (Hitbox hit2 : hitbox2) {
      
        if (
          ((
            x + hit1.getHitbox()[Hitbox.X] <= obj.getX() + hit2.getHitbox()[Hitbox.X] 
            && x + hit1.getHitbox()[Hitbox.X] + hit1.getHitbox()[Hitbox.WIDTH] >= obj.getX() + hit2.getHitbox()[Hitbox.X]
          ) || (
            obj.getX() + hit2.getHitbox()[Hitbox.X] <= x + hit1.getHitbox()[Hitbox.X] 
            && obj.getX() + hit2.getHitbox()[Hitbox.X] + hit2.getHitbox()[Hitbox.WIDTH] >= x + hit1.getHitbox()[Hitbox.X]
          )) && ((
            y + hit1.getHitbox()[Hitbox.Y] <= obj.getY() + hit2.getHitbox()[Hitbox.Y] 
            && y + hit1.getHitbox()[Hitbox.Y] + hit1.getHitbox()[Hitbox.HEIGHT] >= obj.getY() + hit2.getHitbox()[Hitbox.Y]
          ) || (
            obj.getY() + hit2.getHitbox()[Hitbox.Y] <= y + hit1.getHitbox()[Hitbox.Y] 
            && obj.getY() + hit2.getHitbox()[Hitbox.Y] + hit2.getHitbox()[Hitbox.HEIGHT] >= y + hit1.getHitbox()[Hitbox.Y]
          ))
        )
        {
          
          return true; 
          
        }
        
      }
    }
    
    return false; 
    
  }
  
  public void setFrame(int _frame) {
    
    frame = _frame; 
    
  }
  
  private void moveSprite(int _x, int _y) {
    
    x = _x;
    y = _y; 
    
  }
  
  public void drawSprite() {
    
    image(sprite[frame], x, y);
    frame = (frame + 1) % sprite.length;
    
  }
  
  public void drawFrame(int _frame) {
    
    image(sprite[_frame], x, y);
    
  }
  
}