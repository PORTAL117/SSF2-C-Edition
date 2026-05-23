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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1147")]
   public dynamic class NeutralSpecial_45 extends MovieClip
   {
      
      public var base:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var top:MovieClip;
      
      public var self:KrystalExt;
      
      public var end:*;
      
      public var canContinue:*;
      
      public var proj:*;
      
      public var angle:*;
      
      public var fire:*;
      
      public var effect:*;
      
      public var proper:*;
      
      public var reversed:*;
      
      public var controls:Object;
      
      public function NeutralSpecial_45()
      {
         super();
         addFrameScript(0,this.frame1,3,this.frame4,8,this.frame9,13,this.frame14,14,this.frame15,15,this.frame16,44,this.frame45);
      }
      
      public function flipX(param1:Number) : Number
      {
         if(this.self.isFacingRight())
         {
            return param1;
         }
         return param1 * -1;
      }
      
      public function doIt() : *
      {
         this.controls = this.self.getControls();
         if(this.self.isFacingRight() && this.controls.LEFT && !this.controls.RIGHT)
         {
            this.self.faceLeft();
         }
         else if(!this.self.isFacingRight() && this.controls.RIGHT && !this.controls.LEFT)
         {
            this.self.faceRight();
         }
         this.self.createTimer(1,-1,this.aim);
         this.proper = true;
      }
      
      public function aim(param1:* = null) : *
      {
         this.controls = this.self.getControls();
         if(this.controls.UP && !this.controls.DOWN && this.angle < 30)
         {
            this.angle += 3;
         }
         else if(this.controls.DOWN && !this.controls.UP && this.angle > -30)
         {
            this.angle -= 3;
         }
         this.top.x = 18 + (-this.angle + 30) / 15;
         if(this.angle < 0)
         {
            this.top.y = 36 + -this.angle / 30;
         }
         else
         {
            this.top.y = 36;
         }
         this.top.rotation = -this.angle;
         this.base.gotoAndStop(-(this.angle - 33) / 3);
         if(!this.controls.BUTTON1 && this.fire)
         {
            this.self.setGlobalVariable("fired",false);
            this.self.stancePlayFrame("fire");
         }
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         this.end = false;
         this.canContinue = false;
         this.angle = 0;
         this.fire = false;
         this.proper = false;
         this.reversed = false;
         if(SSF2API.isReady() && Boolean(this.self))
         {
            this.controls = this.self.getControls();
         }
      }
      
      internal function frame4() : *
      {
         this.self.playAttackSound(3);
      }
      
      internal function frame9() : *
      {
         this.doIt();
      }
      
      internal function frame14() : *
      {
         if(!this.proper)
         {
            this.angle = this.self.getGlobalVariable("angle");
            this.doIt();
         }
         this.fire = true;
      }
      
      internal function frame15() : *
      {
         this.self.stancePlayFrame("loop");
      }
      
      internal function frame16() : *
      {
         SSF2API.getCamera().shake(4);
         this.self.destroyTimer(this.aim);
         if(this.self.getGlobalVariable("fired") == false)
         {
            this.effect = this.self.attachEffect("krystal_rifleEffect",{
               "x":this.self.flipX(46),
               "y":-26.5
            });
            this.self.attachEffect("global_spark",{
               "x":this.flipX(25),
               "y":-24
            });
            this.self.attachEffect("global_dust_heavy",{
               "x":this.flipX(20),
               "scaleX":0.7,
               "scaleY":0.3
            });
            this.proj = this.self.fireProjectile("krystal_snipe");
            this.proj.setGlobalVariable("reversed",this.reversed);
            if(this.self.isFacingRight())
            {
               this.proj.angleControl(50,this.angle);
               this.proj.setRotation(-this.angle);
               this.effect.rotation = -this.angle;
               this.proj.setX(this.proj.getX() - Math.abs(this.angle));
               this.effect.x -= Math.abs(this.angle);
            }
            else
            {
               this.proj.angleControl(50,180 - this.angle);
               this.proj.setRotation(this.angle);
               this.effect.rotation = this.angle;
               this.proj.setX(this.proj.getX() + Math.abs(this.angle));
               this.effect.x += Math.abs(this.angle);
            }
            this.proj.setY(this.proj.getY() - this.angle / 6);
            this.effect.y -= this.angle / 6;
            this.self.setXSpeed(this.self.getXSpeed() - this.proj.getXSpeed() / 8);
            this.self.playAttackSound(1);
            if(!this.self.getMetalStatus())
            {
               this.self.playSound("krystal_hurt7",true);
            }
         }
      }
      
      internal function frame45() : *
      {
         this.self.playAttackSound(2);
         this.self.endAttack();
      }
   }
}

