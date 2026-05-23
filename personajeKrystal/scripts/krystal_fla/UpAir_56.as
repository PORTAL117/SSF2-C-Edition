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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1176")]
   public dynamic class UpAir_56 extends MovieClip
   {
      
      public var attackBox:MovieClip;
      
      public var attackBox2:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self:KrystalExt;
      
      public var playsound:Number;
      
      public var audio:Number;
      
      public function UpAir_56()
      {
         super();
         addFrameScript(0,this.frame1,3,this.frame4,4,this.frame5,7,this.frame8,23,this.frame24,25,this.frame26,26,this.frame27,33,this.frame34);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         if(parent && this.self && SSF2API.isReady())
         {
            this.self.setLandingLag(false);
            if(this.self.getGlobalVariable("dashUsed"))
            {
               this.self.setGlobalVariable("dashUsed",false);
               this.self.addEventListener(SSF2Event.CHAR_ATTACK_COMPLETE,this.self.toHelpless);
            }
         }
         if(parent && SSF2API.isReady() && Boolean(this.self))
         {
            this.playsound = SSF2API.random();
            this.audio = this.self.getGlobalVariable("audio");
         }
      }
      
      internal function frame4() : *
      {
         this.self.playAttackSound(1);
         if(SSF2API.random() < 0.5)
         {
            this.self.playVoiceSound(1);
            this.self.setGlobalVariable("audio",1);
         }
         else
         {
            this.self.playVoiceSound(2);
            this.self.setGlobalVariable("audio",3);
         }
      }
      
      internal function frame5() : *
      {
         this.self.setLandingLag(true);
         this.self.playSound("krystal_magic");
      }
      
      internal function frame8() : *
      {
         this.self.updateAttackBoxStats(1,{"damage":11});
      }
      
      internal function frame24() : *
      {
         this.self.setLandingLag(false);
      }
      
      internal function frame26() : *
      {
         this.self.endAttack();
      }
      
      internal function frame27() : *
      {
         this.self.updateAttackStats({"cancelWhenAirborne":true});
         this.self.setAttackEnabled(true,"b_forward");
         this.self.setAttackEnabled(true,"b_forward_air");
         SSF2API.getCamera().shake(3);
         if(this.self.getMetalStatus())
         {
            this.self.playSound("metal_land_m");
         }
         else
         {
            this.self.playSound("krystal_landHeavy");
         }
      }
      
      internal function frame34() : *
      {
         this.self.endAttack();
      }
   }
}

