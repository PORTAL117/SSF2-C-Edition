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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1189")]
   public dynamic class DownAir_59 extends MovieClip
   {
      
      public var attackBox:MovieClip;
      
      public var attackBox2:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var hitBox5:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var strongDmg:Number;
      
      public var self:KrystalExt;
      
      public var playsound:Number;
      
      public var audio:Number;
      
      public function DownAir_59()
      {
         super();
         addFrameScript(0,this.frame1,2,this.frame3,5,this.frame6,6,this.frame7,9,this.frame10,25,this.frame26,31,this.frame32,32,this.frame33,42,this.frame43,43,this.frame44,47,this.frame48,59,this.frame60);
      }
      
      public function bounce(param1:* = null) : *
      {
         if(param1.data.attackBoxData.damage == this.strongDmg && param1.data.receiver.getType() != "SSF2Projectile")
         {
            this.self.removeEventListener(SSF2Event.ATTACK_CONNECT,this.bounce);
            this.self.stancePlayFrame("bounce");
         }
      }
      
      internal function frame1() : *
      {
         this.strongDmg = 18;
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         if(parent && SSF2API.isReady() && Boolean(this.self))
         {
            this.playsound = SSF2API.random();
            this.audio = this.self.getGlobalVariable("audio");
            if(this.self.getGlobalVariable("dashUsed"))
            {
               this.self.setGlobalVariable("dashUsed",false);
               this.self.addEventListener(SSF2Event.CHAR_ATTACK_COMPLETE,this.self.toHelpless);
            }
         }
         if(parent && SSF2API.isReady() && Boolean(this.self))
         {
            this.self.setLandingLag(false);
         }
      }
      
      internal function frame3() : *
      {
         this.self.setLandingLag(true);
      }
      
      internal function frame6() : *
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
         this.self.updateAttackBoxStats(2,{"damage":this.strongDmg});
      }
      
      internal function frame7() : *
      {
         this.self.playSound("krystal_magic");
         this.self.addEventListener(SSF2Event.ATTACK_CONNECT,this.bounce);
      }
      
      internal function frame10() : *
      {
         this.self.removeEventListener(SSF2Event.ATTACK_CONNECT,this.bounce);
         this.self.updateAttackBoxStats(1,{"damage":12});
      }
      
      internal function frame26() : *
      {
         this.self.setLandingLag(false);
      }
      
      internal function frame32() : *
      {
         this.self.endAttack();
      }
      
      internal function frame33() : *
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
      
      internal function frame43() : *
      {
         this.self.endAttack();
      }
      
      internal function frame44() : *
      {
         this.self.setYSpeed(-20);
         this.self.setLandingLag(false);
         this.self.playSound("krystal_magic2");
      }
      
      internal function frame48() : *
      {
         this.self.updateAttackStats({
            "allowFullInterrupt":true,
            "jumpCancelAttack":true,
            "doubleJumpCancelAttack":true,
            "allowJump":true,
            "allowDoubleJump":true
         });
      }
      
      internal function frame60() : *
      {
         this.self.endAttack();
      }
   }
}

