package krystal_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1228")]
   public dynamic class LedgeRoll_75 extends MovieClip
   {
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self:KrystalExt;
      
      public function LedgeRoll_75()
      {
         super();
         addFrameScript(0,this.frame1,9,this.frame10,11,this.frame12,18,this.frame19,19,this.frame20,23,this.frame24);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         if(parent && SSF2API.isReady() && Boolean(this.self))
         {
            this.self.setIntangibility(true);
         }
      }
      
      internal function frame10() : *
      {
         if(this.self.getMetalStatus())
         {
            this.self.playSound("metal_step_s1");
         }
         else
         {
            this.self.playSound("krystal_footstep");
         }
      }
      
      internal function frame12() : *
      {
         this.self.playSound("krystal_jumpSound");
      }
      
      internal function frame19() : *
      {
         this.self.setIntangibility(false);
      }
      
      internal function frame20() : *
      {
         if(this.self.getMetalStatus())
         {
            this.self.playSound("metal_step_s2");
         }
         else
         {
            this.self.playSound("krystal_footstep2");
         }
      }
      
      internal function frame24() : *
      {
         this.self.endAttack();
      }
   }
}

