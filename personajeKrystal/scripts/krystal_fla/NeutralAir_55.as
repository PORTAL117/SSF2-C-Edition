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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1171")]
   public dynamic class NeutralAir_55 extends MovieClip
   {
      
      public var attackBox:MovieClip;
      
      public var attackBox2:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var hitBox5:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self:KrystalExt;
      
      public var playsound:Number;
      
      public var audio:Number;
      
      public function NeutralAir_55()
      {
         super();
         addFrameScript(0,this.frame1,2,this.frame3,3,this.frame4,5,this.frame6,18,this.frame19,22,this.frame23,23,this.frame24,28,this.frame29);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         if(parent && SSF2API.isReady() && Boolean(this.self))
         {
            this.playsound = SSF2API.random();
            this.audio = this.self.getGlobalVariable("audio");
            if(this.self.getGlobalVariable("dashUsed"))
            {
               this.self.addEventListener(SSF2Event.CHAR_ATTACK_COMPLETE,this.self.toHelpless);
               this.self.setGlobalVariable("dashUsed",false);
            }
         }
         if(parent && this.self && SSF2API.isReady())
         {
            this.self.setLandingLag(false);
         }
      }
      
      internal function frame3() : *
      {
         this.self.playAttackSound(1);
      }
      
      internal function frame4() : *
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
         this.self.setLandingLag(true);
      }
      
      internal function frame6() : *
      {
         this.self.updateAttackBoxStats(1,{
            "damage":9,
            "power":40,
            "kbConstant":76,
            "effect_id":"effect_hit3"
         });
         this.self.updateAttackBoxStats(2,{
            "damage":9,
            "power":40,
            "kbConstant":76,
            "effect_id":"effect_hit3"
         });
      }
      
      internal function frame19() : *
      {
         this.self.setLandingLag(false);
      }
      
      internal function frame23() : *
      {
         this.self.endAttack();
      }
      
      internal function frame24() : *
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
      
      internal function frame29() : *
      {
         this.self.endAttack();
      }
   }
}

