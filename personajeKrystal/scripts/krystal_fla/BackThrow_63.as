package krystal_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1214")]
   public dynamic class BackThrow_63 extends MovieClip
   {
      
      public var attackBox:MovieClip;
      
      public var attackBox2:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var hitBox5:MovieClip;
      
      public var touchBox:MovieClip;
      
      public var self:KrystalExt;
      
      public function BackThrow_63()
      {
         super();
         addFrameScript(0,this.frame1,2,this.frame3,17,this.frame18);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         if(parent && SSF2API.isReady() && Boolean(this.self))
         {
            this.self.playSound("throw_woosh");
         }
      }
      
      internal function frame3() : *
      {
         this.self.attachEffect("global_dust_heavy");
      }
      
      internal function frame18() : *
      {
         this.self.endAttack();
         this.self.playAttackSound(2);
      }
   }
}

