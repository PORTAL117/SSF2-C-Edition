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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol264")]
   public dynamic class GrenadeProjectile_125 extends MovieClip
   {
      
      public var attackBox:MovieClip;
      
      public var attackBox2:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var self:*;
      
      public var bounces:Number;
      
      public var timer:Number;
      
      public var exploding:Boolean;
      
      public var effectTimer:Number;
      
      public var angle:*;
      
      public function GrenadeProjectile_125()
      {
         super();
         addFrameScript(0,this.frame1,17,this.frame18,18,this.frame19,20,this.frame21,22,this.frame23,24,this.frame25,26,this.frame27,31,this.frame32,33,this.frame34,34,this.frame35);
      }
      
      public function update(param1:* = null) : *
      {
         if(this.timer > 0)
         {
            --this.timer;
         }
         else if(!this.exploding)
         {
            this.explode();
         }
         if(!this.exploding)
         {
            this.angle += 22.5;
            if(this.effectTimer > 0)
            {
               --this.effectTimer;
            }
            else
            {
               if(this.self.isFacingRight())
               {
                  this.self.attachEffect("grenade_trail",{
                     "rotation":this.angle,
                     "behind":true
                  });
               }
               else
               {
                  this.self.attachEffect("grenade_trail",{
                     "rotation":-this.angle,
                     "behind":true
                  });
               }
               this.effectTimer = 1;
            }
         }
      }
      
      public function explode(param1:* = null) : *
      {
         if(this.self.getProjectileStat("suspend") == false && (param1 == null || param1.data.receiver.getType() != "SSF2Projectile"))
         {
            this.self.removeEventListener(SSF2Event.ATTACK_HIT,this.explode);
            this.self.removeEventListener(SSF2Event.ATTACK_HIT_SHIELD,this.shieldBounce);
            this.self.removeEventListener(SSF2Event.ATTACK_HIT_SHIELD,this.explode);
            this.self.removeEventListener(SSF2Event.GROUND_TOUCH,this.bounce);
            this.self.removeEventListener(SSF2Event.HIT_WALL,this.wallBounce);
            this.self.setXSpeed(0);
            this.self.setYSpeed(0);
            this.self.updateProjectileStats({
               "gravity":0,
               "canBePocketed":false,
               "canBeAbsorbed":true
            });
            this.exploding = true;
            this.self.updateAttackBoxStats(1,{
               "damage":0.75,
               "hitStun":2,
               "selfHitStun":1,
               "effect_id":"effect_firehit_light",
               "direction":160,
               "power":35,
               "kbConstant":15,
               "effectSound":"brawl_fire_s",
               "hasEffect":true
            });
            this.self.updateAttackBoxStats(2,{
               "damage":0.75,
               "hitStun":2,
               "selfHitStun":1,
               "effect_id":"effect_firehit_light",
               "direction":160,
               "power":35,
               "kbConstant":15,
               "effectSound":"brawl_fire_s",
               "hasEffect":true
            });
            this.self.stancePlayFrame("explode");
            this.self.refreshAttackID();
         }
      }
      
      public function shieldBounce(param1:* = null) : *
      {
         this.self.removeEventListener(SSF2Event.ATTACK_HIT_SHIELD,this.shieldBounce);
         this.self.addEventListener(SSF2Event.ATTACK_HIT_SHIELD,this.explode);
         this.self.setOwner(param1.data.receiver);
         this.self.setYSpeed(-8);
         if(param1.data.receiver.getX() > this.self.getX())
         {
            this.self.setXSpeed(-2);
            this.self.faceLeft();
         }
         else
         {
            this.self.setXSpeed(2);
            this.self.faceRight();
         }
         this.self.updateAttackBoxStats(1,{
            "hurtSelf":true,
            "hurtSelfShield":true
         });
         this.self.updateAttackBoxStats(2,{
            "hurtSelf":true,
            "hurtSelfShield":true
         });
         ++this.bounces;
         this.self.refreshAttackID();
      }
      
      public function powershieldBounce(param1:* = null) : *
      {
      }
      
      public function bounce(param1:* = null) : *
      {
         if(this.bounces < 1)
         {
            this.self.setYSpeed(-this.self.getYSpeed() * 0.55);
            if(this.self.isFacingRight())
            {
               this.self.setXSpeed(-this.self.getYSpeed() * 0.6 + this.self.getXSpeed() * 0.1);
            }
            else
            {
               this.self.setXSpeed(this.self.getYSpeed() * 0.6 + this.self.getXSpeed() * 0.1);
            }
            ++this.bounces;
            SSF2API.playSound("krystal_grenadebounce");
         }
         else
         {
            this.explode();
         }
      }
      
      public function wallBounce(param1:* = null) : *
      {
         this.self.setXSpeed(-this.self.getXSpeed() * 0.4);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getProjectile(this);
         this.bounces = 0;
         this.timer = 45;
         this.exploding = false;
         this.effectTimer = 1;
         this.angle = 0;
         if(SSF2API.isReady() && this.self)
         {
            this.self.addEventListener(SSF2Event.ATTACK_HIT,this.explode);
            this.self.addEventListener(SSF2Event.ATTACK_HIT_SHIELD,this.shieldBounce);
            this.self.addEventListener(SSF2Event.GROUND_TOUCH,this.bounce);
            this.self.addEventListener(SSF2Event.HIT_WALL,this.wallBounce);
            this.self.createTimer(1,-1,this.update);
            if(this.self.getAttackStat("chargetime") < this.self.getAttackStat("chargetime_max"))
            {
               this.self.setXSpeed(12 - Math.ceil(Math.pow(this.self.getAttackStat("chargetime_max") - this.self.getAttackStat("chargetime"),1.8) / 40) / 2);
               this.self.setYSpeed(-(12.5 - Math.ceil(Math.pow(this.self.getAttackStat("chargetime_max") - this.self.getAttackStat("chargetime"),1.8) / 40) / 2));
            }
            else
            {
               this.self.setXSpeed(13);
               this.self.setYSpeed(-13.5);
            }
            if(!this.self.isFacingRight())
            {
               this.self.setXSpeed(-this.self.getXSpeed());
            }
         }
      }
      
      internal function frame18() : *
      {
         this.self.stancePlayFrame("fastSpin");
      }
      
      internal function frame19() : *
      {
         SSF2API.playSound("krystal_downsmash_sfx");
         SSF2API.playSound("brawl_bomb_s");
      }
      
      internal function frame21() : *
      {
         this.self.refreshAttackID();
      }
      
      internal function frame23() : *
      {
         this.self.refreshAttackID();
         SSF2API.playSound("brawl_bomb_s");
      }
      
      internal function frame25() : *
      {
         this.self.refreshAttackID();
      }
      
      internal function frame27() : *
      {
         this.self.updateAttackBoxStats(1,{
            "damage":6,
            "hitStun":4,
            "selfHitStun":2,
            "power":66,
            "kbConstant":110,
            "direction":45,
            "effect_id":"effect_firehit_heavy",
            "effectSound":"brawl_fire_l",
            "reversableAngle":false
         });
         this.self.updateAttackBoxStats(2,{
            "damage":6,
            "hitStun":4,
            "selfHitStun":2,
            "power":66,
            "kbConstant":110,
            "direction":45,
            "effect_id":"effect_firehit_heavy",
            "effectSound":"brawl_fire_l",
            "reversableAngle":false
         });
         this.self.refreshAttackID();
         SSF2API.playSound("brawl_bomb_l");
      }
      
      internal function frame32() : *
      {
         this.self.destroy();
      }
      
      internal function frame34() : *
      {
         if(this.self == null)
         {
            this.self = SSF2API.getProjectile(this);
         }
         this.self.stancePlayFrame("suspend");
      }
      
      internal function frame35() : *
      {
         this.self = SSF2API.getProjectile(this);
         this.bounces = 0;
         this.timer = 45;
         this.exploding = false;
         this.effectTimer = 1;
         this.angle = 0;
         if(SSF2API.isReady() && this.self)
         {
            this.self.addEventListener(SSF2Event.ATTACK_HIT,this.explode);
            this.self.addEventListener(SSF2Event.ATTACK_HIT_SHIELD,this.shieldBounce);
            this.self.addEventListener(SSF2Event.GROUND_TOUCH,this.bounce);
            this.self.addEventListener(SSF2Event.HIT_WALL,this.wallBounce);
            this.self.createTimer(1,-1,this.update);
            this.self.setXSpeed(9.5,false);
            this.self.setYSpeed(-10);
            this.self.stancePlayFrame("fastSpin");
         }
      }
   }
}

