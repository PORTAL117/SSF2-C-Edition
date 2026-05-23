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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1222")]
   public dynamic class DodgeRoll_69 extends MovieClip
   {
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self:KrystalExt;
      
      public var effect:*;
      
      public function DodgeRoll_69()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,2,this.frame3,10,this.frame11,14,this.frame15);
      }
      
      public function clearDodged(param1:* = null) : *
      {
         this.self.setGlobalVariable("dodged",null);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
      }
      
      internal function frame2() : *
      {
         this.effect = this.self.attachEffect("global_dust_heavy",{
            "scaleX":0.8,
            "scaleY":0.8
         });
         this.effect.scaleX = -this.effect.scaleX;
      }
      
      internal function frame3() : *
      {
         this.self.setIntangibility(true);
      }
      
      internal function frame11() : *
      {
         this.self.setIntangibility(false);
      }
      
      internal function frame15() : *
      {
         this.self.setGlobalVariable("dodged","roll");
         this.self.createTimer(2,1,this.clearDodged,{"persistent":true});
         this.self.endAttack();
      }
   }
}

