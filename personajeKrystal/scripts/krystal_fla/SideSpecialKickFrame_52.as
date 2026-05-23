package krystal_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1167")]
   public dynamic class SideSpecialKickFrame_52 extends MovieClip
   {
      
      public function SideSpecialKickFrame_52()
      {
         super();
         addFrameScript(1,this.frame2,3,this.frame4);
      }
      
      internal function frame2() : *
      {
         gotoAndStop(1);
      }
      
      internal function frame4() : *
      {
         gotoAndStop("ground");
      }
   }
}

