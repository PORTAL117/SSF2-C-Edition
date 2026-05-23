package krystal_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1191")]
   public dynamic class ForwardThrow_61 extends MovieClip
   {
      
      public var attackBox:MovieClip;
      
      public var attackBox2:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var touchBox:MovieClip;
      
      public var self:KrystalExt;
      
      public function ForwardThrow_61()
      {
         super();
         addFrameScript(0,this.frame1,3,this.frame4,4,this.frame5,10,this.frame11,23,this.frame24);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
      }
      
      internal function frame4() : *
      {
         this.self.playSound("throw_woosh");
      }
      
      internal function frame5() : *
      {
         this.self.attachEffect("effect_land",{"x":this.self.flipX(20)});
      }
      
      internal function frame11() : *
      {
         this.self.attachEffect("global_dust_light");
         this.self.playAttackSound(1);
      }
      
      internal function frame24() : *
      {
         this.self.endAttack();
      }
   }
}

