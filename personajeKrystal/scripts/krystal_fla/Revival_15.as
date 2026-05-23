package krystal_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1046")]
   public dynamic class Revival_15 extends MovieClip
   {
      
      public var self:KrystalExt;
      
      public function Revival_15()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         if(SSF2API.isReady())
         {
            this.self.setGlobalVariable("canStartRise",true);
            this.self.setIntangibility(false);
            this.self.setAttackEnabled(true,"b_forward");
            this.self.setAttackEnabled(true,"b_forward_air");
         }
      }
   }
}

