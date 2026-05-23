package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol209")]
   public dynamic class krystal_sspec_ground extends MovieClip
   {
      
      public function krystal_sspec_ground()
      {
         super();
         addFrameScript(5,this.frame6);
      }
      
      internal function frame6() : *
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}

