package krystal_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1239")]
   public dynamic class TechGround_84 extends MovieClip
   {
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self:KrystalExt;
      
      public function TechGround_84()
      {
         super();
         addFrameScript(0,this.frame1,9,this.frame10,11,this.frame12,13,this.frame14);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         if(SSF2API.isReady() && Boolean(this.self))
         {
            this.self.setIntangibility(true);
            this.self.setAttackEnabled(true,"b_forward");
            this.self.setAttackEnabled(true,"b_forward_air");
            this.self.setGlobalVariable("canStartRise",true);
            if(!this.self.getMetalStatus())
            {
               this.self.playSound("krystal_voice3",true);
            }
         }
      }
      
      internal function frame10() : *
      {
         this.self.setIntangibility(false);
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
      }
      
      internal function frame14() : *
      {
         this.self.endAttack();
      }
   }
}

