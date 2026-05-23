package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol282")]
   public dynamic class krystal_rifleEffect extends MovieClip
   {
      
      public function krystal_rifleEffect()
      {
         super();
         addFrameScript(9,this.frame10);
      }
      
      internal function frame10() : *
      {
         stop();
         parent.removeChild(this);
      }
   }
}

