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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1177")]
   public dynamic class ForwardAir_57 extends MovieClip
   {
      
      public var attackBox:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self:KrystalExt;
      
      public var playsound:Number;
      
      public var audio:Number;
      
      public function ForwardAir_57()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,3,this.frame4,7,this.frame8,8,this.frame9,14,this.frame15,19,this.frame20,20,this.frame21,25,this.frame26);
      }
      
      internal function frame1() : *
      {
         if(parent && this.self && SSF2API.isReady())
         {
            if(this.self.getGlobalVariable("dashUsed"))
            {
               this.self.setGlobalVariable("dashUsed",false);
               this.self.addEventListener(SSF2Event.CHAR_ATTACK_COMPLETE,this.self.toHelpless);
            }
            this.self.setLandingLag(false);
         }
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         if(parent && SSF2API.isReady() && Boolean(this.self))
         {
            this.playsound = SSF2API.random();
            this.audio = this.self.getGlobalVariable("audio");
         }
      }
      
      internal function frame2() : *
      {
         if(this.playsound > 0.2 && this.playsound <= 0.4 && this.audio != 1)
         {
            this.self.playVoiceSound(1);
            this.self.setGlobalVariable("audio",1);
         }
         if(this.playsound > 0.4 && this.playsound <= 0.6 && this.audio != 2)
         {
            this.self.playVoiceSound(2);
            this.self.setGlobalVariable("audio",2);
         }
         if(this.playsound > 0.6 && this.playsound <= 0.8 && this.audio != 3)
         {
            this.self.playVoiceSound(3);
            this.self.setGlobalVariable("audio",3);
         }
         if(this.playsound > 0.8 && this.playsound <= 1 && this.audio != 4)
         {
            this.self.playVoiceSound(4);
            this.self.setGlobalVariable("audio",4);
         }
      }
      
      internal function frame4() : *
      {
         this.self.setLandingLag(true);
         this.self.playAttackSound(1);
      }
      
      internal function frame8() : *
      {
         this.self.updateAttackBoxStats(1,{
            "damage":9,
            "hitStun":3,
            "hitLag":-1.05,
            "direction":45,
            "power":36,
            "kbConstant":85,
            "effect_id":"effect_heavyHit"
         });
         this.self.refreshAttackID();
      }
      
      internal function frame9() : *
      {
         this.self.playAttackSound(2);
      }
      
      internal function frame15() : *
      {
         this.self.setLandingLag(false);
      }
      
      internal function frame20() : *
      {
         this.self.endAttack();
      }
      
      internal function frame21() : *
      {
         this.self.updateAttackStats({"cancelWhenAirborne":true});
         this.self.setAttackEnabled(true,"b_forward");
         this.self.setAttackEnabled(true,"b_forward_air");
         SSF2API.getCamera().shake(2);
         if(this.self.getMetalStatus())
         {
            this.self.playSound("metal_land_s");
         }
         else
         {
            this.self.playSound("krystal_landLight");
         }
      }
      
      internal function frame26() : *
      {
         this.self.endAttack();
      }
   }
}

