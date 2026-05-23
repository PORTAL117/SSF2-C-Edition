package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol265")]
   public dynamic class krystal_grenade_proj extends MovieClip
   {
      
      public var stance:MovieClip;
      
      public function krystal_grenade_proj()
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

