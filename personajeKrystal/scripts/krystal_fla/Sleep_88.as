package krystal_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1245")]
   public dynamic class Sleep_88 extends MovieClip
   {
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self:KrystalExt;
      
      public function Sleep_88()
      {
         super();
         addFrameScript(0,this.frame1,34,this.frame35);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         if(parent && SSF2API.isReady() && Boolean(this.self))
         {
            this.self.setGlobalVariable("jab",false);
            this.self.setGlobalVariable("jab2",false);
         }
      }
      
      internal function frame35() : *
      {
         gotoAndStop("loop");
      }
   }
}

