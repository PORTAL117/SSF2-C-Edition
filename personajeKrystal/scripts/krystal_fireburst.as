package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol201")]
   public dynamic class krystal_fireburst extends MovieClip
   {
      
      public var stance:MovieClip;
      
      public function krystal_fireburst()
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

