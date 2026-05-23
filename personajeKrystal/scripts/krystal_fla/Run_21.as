package krystal_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1050")]
   public dynamic class Run_21 extends MovieClip
   {
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self:KrystalExt;
      
      public function Run_21()
      {
         super();
         addFrameScript(0,this.frame1,5,this.frame6,7,this.frame8,11,this.frame12,18,this.frame19,22,this.frame23,23,this.frame24,30,this.frame31);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         if(parent && SSF2API.isReady() && Boolean(this.self))
         {
            this.self.playSound("krystal_runstart");
         }
      }
      
      internal function frame6() : *
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
      
      internal function frame8() : *
      {
         this.self.stancePlayFrame("run");
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
      
      internal function frame19() : *
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
      
      internal function frame23() : *
      {
         this.self.stancePlayFrame("run");
      }
      
      internal function frame24() : *
      {
         this.self.setGlobalVariable("jab",false);
         this.self.setGlobalVariable("jab2",false);
         if(parent && SSF2API.isReady() && this.self && this.self.isCPU())
         {
            if(this.self.getCPUAction() < 10 && this.self.getCPUAction() > 0 && this.self.getCPULevel() >= 7)
            {
               SSF2API.print("Crouch Cancel (Turning)");
               if(!this.self.isFacingRight())
               {
                  this.self.importCPUControls([17408,1,16640,1]);
               }
               else
               {
                  this.self.importCPUControls([17408,1,16896,1]);
               }
               this.self.endAttack("crouch");
            }
         }
      }
      
      internal function frame31() : *
      {
         this.self.stancePlayFrame("runmid");
      }
   }
}

