package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol112")]
   public dynamic class krystal_fpod_wireframe extends MovieClip
   {
      
      public function krystal_fpod_wireframe()
      {
         super();
         addFrameScript(18,this.frame19);
      }
      
      internal function frame19() : *
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}

