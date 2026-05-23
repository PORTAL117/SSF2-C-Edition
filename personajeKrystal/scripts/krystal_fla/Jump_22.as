package krystal_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1051")]
   public dynamic class Jump_22 extends MovieClip
   {
      
      public var hand:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var hitBox5:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self:KrystalExt;
      
      public var xframe:*;
      
      public var done:*;
      
      public function Jump_22()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,13,this.frame14,25,this.frame26,32,this.frame33);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         this.xframe = "midair";
         this.done = false;
         if(SSF2API.isReady() && Boolean(this.self))
         {
            if(this.self.getGlobalVariable("screwAttackOn"))
            {
               this.self.endAttack();
               this.self.forceAttack("item_screw");
            }
         }
      }
      
      internal function frame2() : *
      {
         this.self.playSound("krystal_jumpSound");
      }
      
      internal function frame14() : *
      {
         this.self.endAttack();
      }
      
      internal function frame26() : *
      {
         this.self.playSound("krystal_jumpflip");
      }
      
      internal function frame33() : *
      {
         this.self.endAttack();
      }
   }
}

