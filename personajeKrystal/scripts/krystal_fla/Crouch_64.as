package krystal_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1215")]
   public dynamic class Crouch_64 extends MovieClip
   {
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self:KrystalExt;
      
      public function Crouch_64()
      {
         super();
         addFrameScript(0,this.frame1,3,this.frame4,5,this.frame6);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
      }
      
      internal function frame4() : *
      {
         this.self.setGlobalVariable("crouchdown",true);
      }
      
      internal function frame6() : *
      {
         gotoAndStop("loop");
      }
   }
}

