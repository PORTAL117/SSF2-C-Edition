package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1394")]
   public dynamic class krystal_snipe extends MovieClip
   {
      
      public var stance:MovieClip;
      
      public function krystal_snipe()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}

