public class Sprite{
 
  Hitbox[] hitbox; 
  PImage[] sprite; 
  int frame = 0; 
  
  Sprite(Hitbox[] _hitbox, PImage[] _sprite) {
    
    hitbox = _hitbox; 
    sprite = _sprite;
    
  }
  
  public Hitbox[] getHitbox() {
    
    return hitbox; 
    
  }
  
  public boolean collision(Sprite obj) {
    
    Hitbox[] hitbox2 = obj.getHitbox();
    for (Hitbox hit1 : hitbox) {
      for (Hitbox hit2 : hitbox2) {
      
        if (
          (
            hit1.getHitbox()[Hitbox.X] <= hit2.getHitbox()[Hitbox.X] 
            && hit1.getHitbox()[Hitbox.X] + hit1.getHitbox()[Hitbox.WIDTH] >= hit2.getHitbox()[Hitbox.X]
          ) || (
            hit2.getHitbox()[Hitbox.X] <= hit1.getHitbox()[Hitbox.X] 
            && hit2.getHitbox()[Hitbox.X] + hit2.getHitbox()[Hitbox.WIDTH] >= hit1.getHitbox()[Hitbox.X]
          ) || (
            hit1.getHitbox()[Hitbox.Y] <= hit2.getHitbox()[Hitbox.Y] 
            && hit1.getHitbox()[Hitbox.Y] + hit1.getHitbox()[Hitbox.HEIGHT] >= hit2.getHitbox()[Hitbox.Y]
          ) || (
            hit2.getHitbox()[Hitbox.Y] <= hit1.getHitbox()[Hitbox.Y] 
            && hit2.getHitbox()[Hitbox.Y] + hit2.getHitbox()[Hitbox.HEIGHT] >= hit1.getHitbox()[Hitbox.Y]
          )
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
  
  public void drawSprite(int _x, int _y) {
    
    image(sprite[frame], _x, _y);
    frame = (frame + 1) % sprite.length;
    
  }
  
  public void drawFrame(int _x, int _y, int _frame) {
    
    image(sprite[_frame], _x, _y);
    
  }
  
}