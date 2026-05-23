package krystal_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1236")]
   public dynamic class Guard_78 extends MovieClip
   {
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var shieldBox:MovieClip;
      
      public var shieldframe:MovieClip;
      
      public var self:KrystalExt;
      
      public var startup:*;
      
      public function Guard_78()
      {
         super();
         addFrameScript(0,this.frame1,5,this.frame6,106,this.frame107);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         if(parent && SSF2API.isReady() && Boolean(this.self))
         {
            this.startup = true;
            if(this.self.getGlobalVariable("dodged") == "roll")
            {
               this.self.stancePlayFrame(3);
            }
            else if(this.self.getGlobalVariable("dodged") == "spot")
            {
               this.self.stancePlayFrame("begin");
            }
         }
      }
      
      internal function frame6() : *
      {
         this.startup = false;
      }
      
      internal function frame107() : *
      {
         this.self.stancePlayFrame("loop");
      }
   }
}

