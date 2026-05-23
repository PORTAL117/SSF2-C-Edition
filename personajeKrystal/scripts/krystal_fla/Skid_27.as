package krystal_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1056")]
   public dynamic class Skid_27 extends MovieClip
   {
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self:KrystalExt;
      
      public function Skid_27()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,6,this.frame7);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         if(parent && SSF2API.isReady() && this.self && this.self.isCPU())
         {
            if(this.self.getCPUAction() < 10 && this.self.getCPUAction() > 0 && this.self.getCPULevel() >= 7)
            {
               SSF2API.print("Crouch Cancel");
               this.self.endAttack("crouch");
            }
         }
      }
      
      internal function frame2() : *
      {
         this.self.playSound("krystal_runstop");
      }
      
      internal function frame7() : *
      {
         this.self.endAttack();
      }
   }
}

