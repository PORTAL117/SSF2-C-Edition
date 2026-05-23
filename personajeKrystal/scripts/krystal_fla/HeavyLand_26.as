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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1055")]
   public dynamic class HeavyLand_26 extends MovieClip
   {
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self:KrystalExt;
      
      public function HeavyLand_26()
      {
         super();
         addFrameScript(0,this.frame1,10,this.frame11);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         if(parent && SSF2API.isReady() && Boolean(this.self))
         {
            SSF2API.getCamera().shake(3);
            if(this.self.getMetalStatus())
            {
               this.self.playSound("metal_land_m");
            }
            else
            {
               this.self.playSound("krystal_landHeavy");
            }
            this.self.setAttackEnabled(true,"b_forward");
            this.self.setAttackEnabled(true,"b_forward_air");
         }
      }
      
      internal function frame11() : *
      {
         this.self.endAttack();
      }
   }
}

