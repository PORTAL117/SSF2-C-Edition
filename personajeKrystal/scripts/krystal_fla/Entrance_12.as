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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1024")]
   public dynamic class Entrance_12 extends MovieClip
   {
      
      public var self:KrystalExt;
      
      public function Entrance_12()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,12,this.frame13,30,this.frame31);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
      }
      
      internal function frame2() : *
      {
         this.self.playSound("starFox_Entrance_sfx");
      }
      
      internal function frame13() : *
      {
         if(this.self.getMetalStatus())
         {
            this.self.playSound("metal_land_m");
            SSF2API.getCamera().shake(3);
         }
         else
         {
            this.self.playSound("krystal_landHeavy");
         }
         this.self.attachEffect("effect_land");
      }
      
      internal function frame31() : *
      {
         SSF2API.getCharacter(this).endAttack();
      }
   }
}

