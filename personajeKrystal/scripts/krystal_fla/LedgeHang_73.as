package krystal_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1226")]
   public dynamic class LedgeHang_73 extends MovieClip
   {
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self:KrystalExt;
      
      public function LedgeHang_73()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,24,this.frame25);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         if(SSF2API.isReady() && Boolean(this.self))
         {
            this.self.setAttackEnabled(true,"b_forward");
            this.self.setAttackEnabled(true,"b_forward_air");
         }
      }
      
      internal function frame2() : *
      {
         this.self.attachEffect("ledgeGrab_gfx",{
            "x":this.self.flipX(0),
            "y":0,
            "scaleX":-0.4,
            "scaleY":-0.4
         });
      }
      
      internal function frame25() : *
      {
         this.self.stancePlayFrame("loop");
      }
   }
}

