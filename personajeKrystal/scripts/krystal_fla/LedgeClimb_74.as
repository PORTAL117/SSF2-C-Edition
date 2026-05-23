package krystal_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1227")]
   public dynamic class LedgeClimb_74 extends MovieClip
   {
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self:KrystalExt;
      
      public function LedgeClimb_74()
      {
         super();
         addFrameScript(0,this.frame1,5,this.frame6,11,this.frame12,15,this.frame16,16,this.frame17);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         if(parent && SSF2API.isReady() && Boolean(this.self))
         {
            this.self.setIntangibility(true);
         }
      }
      
      internal function frame6() : *
      {
         this.self.playSound("krystal_jumpSound");
      }
      
      internal function frame12() : *
      {
         if(this.self.getMetalStatus())
         {
            this.self.playSound("metal_step_s1");
         }
         else
         {
            this.self.playSound("krystal_footstep");
         }
         this.self.setXSpeed(6,false);
      }
      
      internal function frame16() : *
      {
         this.self.setIntangibility(false);
      }
      
      internal function frame17() : *
      {
         this.self.endAttack();
      }
   }
}

