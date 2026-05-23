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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1213")]
   public dynamic class DownThrow_62 extends MovieClip
   {
      
      public var attackBox:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var touchBox:MovieClip;
      
      public var self:KrystalExt;
      
      public function DownThrow_62()
      {
         super();
         addFrameScript(0,this.frame1,8,this.frame9,9,this.frame10,13,this.frame14,20,this.frame21,24,this.frame25);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
      }
      
      internal function frame9() : *
      {
         this.self.attachEffect("global_dust_cloud");
         this.self.playSound("throw_woosh");
         this.self.forceGrabbedHurtFrame("faint");
      }
      
      internal function frame10() : *
      {
         SSF2API.getCamera().shake(9);
      }
      
      internal function frame14() : *
      {
         this.self.playSound("throw_release");
         this.self.forceGrabbedHurtFrame("downed");
      }
      
      internal function frame21() : *
      {
         this.self.updateAttackBoxStats(1,{"bypassGrabbed":false});
      }
      
      internal function frame25() : *
      {
         this.self.endAttack();
      }
   }
}

