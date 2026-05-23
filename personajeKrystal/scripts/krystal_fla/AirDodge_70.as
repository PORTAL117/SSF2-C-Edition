package krystal_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1223")]
   public dynamic class AirDodge_70 extends MovieClip
   {
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self:KrystalExt;
      
      public function AirDodge_70()
      {
         super();
         addFrameScript(0,this.frame1,2,this.frame3,13,this.frame14,19,this.frame20);
      }
      
      public function dodgeLand(param1:* = null) : *
      {
         this.self.toLand();
         this.self.stancePlayFrame("dodgeland");
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
      }
      
      internal function frame3() : *
      {
         this.self.setIntangibility(true);
         this.self.addEventListener(SSF2Event.GROUND_TOUCH,this.dodgeLand);
      }
      
      internal function frame14() : *
      {
         this.self.setIntangibility(false);
      }
      
      internal function frame20() : *
      {
         this.self.endAttack();
      }
   }
}

