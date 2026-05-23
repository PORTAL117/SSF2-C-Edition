package krystal_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol122")]
   public dynamic class ChargeSpark_36 extends MovieClip
   {
      
      public function ChargeSpark_36()
      {
         super();
         addFrameScript(4,this.frame5);
      }
      
      internal function frame5() : *
      {
         stop();
         parent.removeChild(this);
      }
   }
}

