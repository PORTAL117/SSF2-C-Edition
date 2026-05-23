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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1168")]
   public dynamic class SideSpecial_51 extends MovieClip
   {
      
      public var attackBox:MovieClip;
      
      public var hand:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var hitBox5:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var mc:MovieClip;
      
      public var self:KrystalExt;
      
      public var timer:*;
      
      public var dashes:*;
      
      public var direct:String;
      
      public var pos:*;
      
      public function SideSpecial_51()
      {
         super();
         addFrameScript(0,this.frame1,2,this.frame3,7,this.frame8,8,this.frame9,10,this.frame11,12,this.frame13,13,this.frame14,14,this.frame15,15,this.frame16,16,this.frame17,18,this.frame19,26,this.frame27,32,this.frame33,33,this.frame34,45,this.frame46,55,this.frame56,58,this.frame59,63,this.frame64,66,this.frame67,71,this.frame72);
      }
      
      public function flipX(param1:Number) : Number
      {
         if(this.self.isFacingRight())
         {
            return param1;
         }
         return param1 * -1;
      }
      
      public function moveIt() : void
      {
         if(this.direct == "n")
         {
            this.self.setXSpeed(25,false);
            this.self.updateAttackStats({"air_ease":-1});
            this.self.setYSpeed(10);
         }
         else if(this.direct == "u")
         {
            this.self.setXSpeed(22,false);
            this.self.setYSpeed(-12);
         }
         else if(this.direct == "d")
         {
            this.self.updateAttackStats({"air_ease":-1});
            this.self.setXSpeed(20,false);
            if(!this.self.isOnGround())
            {
               this.self.setYSpeed(9);
            }
            else
            {
               this.self.setYSpeed(0);
            }
         }
      }
      
      public function animSwap(param1:* = null) : *
      {
         if(this.self.isOnGround())
         {
            this.mc.gotoAndStop("ground");
         }
      }
      
      public function platCancelTrigger(param1:* = null) : *
      {
         if(currentFrame < 20)
         {
            this.self.updateAttackStats({
               "canFallOff":true,
               "cancelWhenAirborne":true
            });
         }
      }
      
      public function bounce(param1:* = null) : *
      {
         this.self.removeEventListener(SSF2Event.ATTACK_HIT,this.bounce);
         this.self.playSound("brawl_kick_l");
         this.self.updateAttackStats({"allowControl":true});
         this.self.destroyTimer(this.moveIt);
         this.self.setXSpeed(0);
         this.self.setYSpeed(0);
         if(param1.data.receiver.getType() == "SSF2Character")
         {
            param1.data.receiver.forceHitStun(10);
            this.pos = this.self.getX() - (param1.data.receiver.getX() - this.self.flipX(25));
            this.self.setX(this.self.getX() - this.pos);
            if(!this.self.isOnGround())
            {
               this.self.setY(this.self.getY() - this.self.flipX(this.pos * 0.45));
            }
         }
         this.self.stancePlayFrame("bounce");
      }
      
      public function uspec(param1:* = null) : *
      {
         if(!this.self.isOnGround() && this.self.getControls().BUTTON1 && Boolean(this.self.getControls().UP))
         {
            this.self.forceAttack("b_up_air");
         }
      }
      
      public function landPlay(param1:* = null) : *
      {
         this.self.stancePlayFrame("end2");
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         this.timer = 0;
         this.dashes = 0;
         if(parent && SSF2API.isReady() && Boolean(this.self))
         {
            this.self.playAttackSound(1);
            this.self.attachEffect("global_spark",{
               "x":this.flipX(25),
               "y":-29
            });
            this.self.attachEffect("global_dust_heavy",{"x":this.flipX(27)});
            if(this.self.isOnGround())
            {
               this.self.stancePlayFrame("groundStart");
            }
         }
      }
      
      internal function frame3() : *
      {
         if(!this.self.getMetalStatus())
         {
            this.self.playSound("krystal_voice1",true);
         }
      }
      
      internal function frame8() : *
      {
         this.self.stancePlayFrame("attack");
      }
      
      internal function frame9() : *
      {
         this.self.playAttackSound(2);
         this.self.playSound("krystal_swing_ll");
         this.direct = "d";
         this.self.createTimer(1,5,this.moveIt);
         this.self.attachEffect("global_dust_heavy",{"scaleY":0.5});
         this.self.createTimer(1,-1,this.animSwap);
         if(this.self.isOnGround())
         {
            this.self.attachEffect("krystal_sspec_ground");
         }
         else
         {
            this.self.attachEffect("krystal_sspec_air",{"rotation":this.self.flipX(29)});
         }
         this.self.addEventListener(SSF2Event.ATTACK_HIT,this.bounce);
         if(!this.self.isOnGround())
         {
            this.self.addEventListener(SSF2Event.GROUND_TOUCH,this.platCancelTrigger);
         }
      }
      
      internal function frame11() : *
      {
         if(this.self.isOnGround())
         {
            this.self.attachEffect("krystal_sspec_ground");
         }
         else
         {
            this.self.attachEffect("krystal_sspec_air",{"rotation":this.self.flipX(29)});
         }
      }
      
      internal function frame13() : *
      {
         if(this.self.isOnGround())
         {
            this.self.attachEffect("krystal_sspec_ground");
         }
         else
         {
            this.self.attachEffect("krystal_sspec_air",{"rotation":this.self.flipX(29)});
         }
      }
      
      internal function frame14() : *
      {
         this.self.setXSpeed(18,false);
         if(this.direct == "d")
         {
            this.self.setYSpeed(3);
         }
         this.self.setIntangibility(false);
      }
      
      internal function frame15() : *
      {
         this.self.updateAttackStats({
            "air_ease":-1,
            "xSpeedDecay":-2.5,
            "xSpeedDecayAir":-1
         });
      }
      
      internal function frame16() : *
      {
         this.self.destroyTimer(this.animSwap);
         this.self.removeEventListener(SSF2Event.ATTACK_HIT,this.bounce);
         if(!this.self.isOnGround())
         {
            this.self.stancePlayFrame("end");
         }
         else
         {
            this.self.stancePlayFrame("end2");
         }
      }
      
      internal function frame17() : *
      {
         this.self.destroyTimer(this.animSwap);
         this.self.setXSpeed(0);
         this.self.setYSpeed(0);
         this.self.setAttackEnabled(false,"b_forward");
         this.self.setAttackEnabled(false,"b_forward_air");
         this.self.updateAttackStats({"cancelWhenAirborne":false});
      }
      
      internal function frame19() : *
      {
         this.self.updateAttackStats({
            "allowControl":true,
            "allowFastFall":true
         });
         this.self.setXSpeed(0);
         this.self.setYSpeed(-18);
         this.self.playSound("krystal_jumpSound2");
      }
      
      internal function frame27() : *
      {
         this.self.updateAttackStats({
            "allowDoubleJump":true,
            "doubleJumpCancelAttack":true,
            "airCancel":true,
            "airCancelSpecial":true
         });
         this.self.playSound("krystal_jumpflip");
      }
      
      internal function frame33() : *
      {
         this.self.endAttack();
      }
      
      internal function frame34() : *
      {
         this.self.addEventListener(SSF2Event.GROUND_TOUCH,this.self.toHeavyLand);
         this.self.updateAttackStats({
            "allowControl":true,
            "allowControlGround":false
         });
      }
      
      internal function frame46() : *
      {
         this.self.endAttack();
      }
      
      internal function frame56() : *
      {
         if(this.self.getMetalStatus())
         {
            this.self.playSound("metal_step_s1");
         }
         else
         {
            this.self.playSound("krystal_footstep");
         }
      }
      
      internal function frame59() : *
      {
         if(this.self.getMetalStatus())
         {
            this.self.playSound("metal_step_s2");
         }
         else
         {
            this.self.playSound("krystal_footstep2");
         }
      }
      
      internal function frame64() : *
      {
         this.self.endAttack();
      }
      
      internal function frame67() : *
      {
         if(!this.self.getMetalStatus())
         {
            this.self.playSound("krystal_voice1",true);
         }
      }
      
      internal function frame72() : *
      {
         gotoAndStop("attack");
      }
   }
}

