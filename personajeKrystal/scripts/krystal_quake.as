package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol223")]
   public dynamic class krystal_quake extends MovieClip
   {
      
      public var stance:MovieClip;
      
      public function krystal_quake()
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

