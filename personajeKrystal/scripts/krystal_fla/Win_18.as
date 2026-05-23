package krystal_fla
{
   import adobe.utils.*;
   import flash.accessibility.*;
   import flash.desktop.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.globalization.*;
   import flash.media.*;
   import flash.net.*;
   import flash.net.drm.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.sampler.*;
   import flash.sensors.*;
   import flash.system.*;
   import flash.text.*;
   import flash.text.engine.*;
   import flash.text.ime.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1047")]
   public dynamic class Win_18 extends MovieClip
   {
      
      public var spin:String;
      
      public function Win_18()
      {
         super();
         addFrameScript(30,this.frame31,31,this.frame32,33,this.frame34,36,this.frame37,39,this.frame40,40,this.frame41,43,this.frame44,47,this.frame48,51,this.frame52,55,this.frame56,73,this.frame74,93,this.frame94,94,this.frame95,96,this.frame97,99,this.frame100,102,this.frame103,103,this.frame104,106,this.frame107,110,this.frame111,114,this.frame115,118,this.frame119,136,this.frame137,156,this.frame157);
      }
      
      internal function frame31() : *
      {
         this.spin = "gold";
         if(SSF2API.getPlayer(this).getPaletteSwapData().paletteSwap)
         {
            if(SSF2API.getPlayer(this).getPaletteSwapData().paletteSwap.replacements[109] == 4292203989)
            {
               SSF2API.print("mega bother");
               this.spin = "silver";
            }
         }
         if(this.spin == "gold")
         {
            gotoAndStop("goldspin");
         }
         else
         {
            gotoAndStop("silverspin");
         }
      }
      
      internal function frame32() : *
      {
         SSF2API.playSound("krystal_win",true);
      }
      
      internal function frame34() : *
      {
         SSF2API.playSound("krystal_swing_ss");
         SSF2API.playSound("krystal_jumpflip");
      }
      
      internal function frame37() : *
      {
         SSF2API.playSound("krystal_jumpflip");
      }
      
      internal function frame40() : *
      {
         SSF2API.playSound("krystal_jumpflip");
      }
      
      internal function frame41() : *
      {
      }
      
      internal function frame44() : *
      {
         SSF2API.playSound("krystal_jumpflip");
      }
      
      internal function frame48() : *
      {
         SSF2API.playSound("krystal_jumpflip");
      }
      
      internal function frame52() : *
      {
         SSF2API.playSound("krystal_jumpflip");
      }
      
      internal function frame56() : *
      {
         SSF2API.playSound("grab");
      }
      
      internal function frame74() : *
      {
         SSF2API.playSound("krystal_footstep");
      }
      
      internal function frame94() : *
      {
         gotoAndStop("loop");
      }
      
      internal function frame95() : *
      {
         SSF2API.playSound("krystal_win",true);
      }
      
      internal function frame97() : *
      {
         SSF2API.playSound("krystal_swing_ss");
         SSF2API.playSound("krystal_jumpflip");
      }
      
      internal function frame100() : *
      {
         SSF2API.playSound("krystal_jumpflip");
      }
      
      internal function frame103() : *
      {
         SSF2API.playSound("krystal_jumpflip");
      }
      
      internal function frame104() : *
      {
      }
      
      internal function frame107() : *
      {
         SSF2API.playSound("krystal_jumpflip");
      }
      
      internal function frame111() : *
      {
         SSF2API.playSound("krystal_jumpflip");
      }
      
      internal function frame115() : *
      {
         SSF2API.playSound("krystal_jumpflip");
      }
      
      internal function frame119() : *
      {
         SSF2API.playSound("grab");
      }
      
      internal function frame137() : *
      {
         SSF2API.playSound("krystal_footstep");
      }
      
      internal function frame157() : *
      {
         gotoAndStop("loop2");
      }
   }
}

