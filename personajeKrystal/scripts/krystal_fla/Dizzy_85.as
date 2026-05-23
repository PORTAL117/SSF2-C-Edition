package krystal_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1244")]
   public dynamic class Dizzy_85 extends MovieClip
   {
      
      public var dizzy_stars:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self:KrystalExt;
      
      public function Dizzy_85()
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
            if(!this.self.getMetalStatus())
            {
               this.self.playSound("krystal_hurt7",true);
            }
         }
      }
      
      internal function frame35() : *
      {
         gotoAndStop("loop");
      }
   }
}

