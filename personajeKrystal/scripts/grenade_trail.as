package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol232")]
   public dynamic class grenade_trail extends MovieClip
   {
      
      public function grenade_trail()
      {
         super();
         addFrameScript(7,this.frame8);
      }
      
      internal function frame8() : *
      {
         if(root != null && parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}

