package krystal_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol992")]
   public dynamic class groundRef_mc_7 extends MovieClip
   {
      
      public var self:KrystalExt;
      
      public function groundRef_mc_7()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         this.visible = false;
      }
   }
}

