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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1142")]
   public dynamic class DownSmash_44 extends MovieClip
   {
      
      public var attackBox:MovieClip;
      
      public var attackBox2:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var self:KrystalExt;
      
      public var xframe:String;
      
      public function DownSmash_44()
      {
         super();
         addFrameScript(0,this.frame1,2,this.frame3,42,this.frame43,43,this.frame44,45,this.frame46,51,this.frame52,53,this.frame54,55,this.frame56,56,this.frame57,57,this.frame58,58,this.frame59,60,this.frame61,75,this.frame76);
      }
      
      public function effects() : void
      {
         this.self.attachEffect("global_dust_heavy",{
            "x":this.self.flipX(5),
            "y":3,
            "scaleX":-0.5,
            "scaleY":-0.5
         });
      }
      
      public function land(param1:* = null) : *
      {
         this.self.updateAttackStats({"cancelWhenAirborne":true});
         gotoAndStop("land");
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         if(Boolean(this.self) && SSF2API.isReady())
         {
            this.self.attachEffect("global_spark",{"y":-25});
         }
      }
      
      internal function frame3() : *
      {
         this.xframe = "charging";
         this.self.createTimer(4,-1,this.effects);
      }
      
      internal function frame43() : *
      {
         this.self.stancePlayFrame("charging");
      }
      
      internal function frame44() : *
      {
         this.xframe = "attack";
         this.self.destroyTimer(this.effects);
      }
      
      internal function frame46() : *
      {
         this.self.attachEffect("global_dust_cloud",{
            "scaleX":0.8,
            "scaleY":0.65
         });
         this.self.updateAttackStats({
            "air_ease":0,
            "cancelWhenAirborne":false
         });
         this.self.setYSpeed(-16);
      }
      
      internal function frame52() : *
      {
         this.self.updateAttackStats({"air_ease":-1});
      }
      
      internal function frame54() : *
      {
         this.self.playVoiceSound(1);
      }
      
      internal function frame56() : *
      {
         this.self.addEventListener(SSF2Event.GROUND_TOUCH,this.land);
         this.self.setYSpeed(14);
         this.self.setXSpeed(0);
         this.self.playSound("krystal_swing_H");
      }
      
      internal function frame57() : *
      {
         this.self.setYSpeed(20);
         if(this.self.isOnGround())
         {
            this.land();
         }
      }
      
      internal function frame58() : *
      {
         this.self.stancePlayFrame("loop");
      }
      
      internal function frame59() : *
      {
         this.self.playSound("krystal_downsmash_sfx");
         this.self.attachEffect("ground_bounce");
         this.self.fireProjectile("krystal_quake");
         SSF2API.getCamera().shake(10);
      }
      
      internal function frame61() : *
      {
         SSF2API.getCamera().shake(5);
      }
      
      internal function frame76() : *
      {
         this.self.endAttack();
      }
   }
}

