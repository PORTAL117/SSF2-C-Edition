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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1067")]
   public dynamic class JabCombo_28 extends MovieClip
   {
      
      public var attackBox:MovieClip;
      
      public var goldswing:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var silverswing:MovieClip;
      
      public var self:KrystalExt;
      
      public var stunVal:*;
      
      public var kb:*;
      
      public var angle:*;
      
      public var xDis:*;
      
      public var yDis:*;
      
      public var distance:*;
      
      public var offsetX:*;
      
      public var offsetY:*;
      
      public var kbc:*;
      
      public var power:*;
      
      public var wkb:*;
      
      public var next:Boolean;
      
      public var release:Boolean;
      
      public var currentJab:Number;
      
      public var hahsound:Boolean;
      
      public var rand:*;
      
      public function JabCombo_28()
      {
         super();
         addFrameScript(0,this.frame1,3,this.frame4,5,this.frame6,10,this.frame11,14,this.frame15,17,this.frame18,21,this.frame22,27,this.frame28,32,this.frame33,33,this.frame34,36,this.frame37,37,this.frame38,50,this.frame51);
      }
      
      public function checkJab() : *
      {
         if(this.next)
         {
            this.self.destroyTimer(this.checkJab);
            ++this.currentJab;
            this.release = false;
            this.next = false;
            this.self.stancePlayFrame("combo" + this.currentJab.toString());
            this.self.updateAttackStats({"allowFullInterrupt":false});
         }
      }
      
      public function loopJab() : *
      {
         if(this.next)
         {
            this.self.destroyTimer(this.loopJab);
            this.release = false;
            this.next = false;
            this.self.stancePlayFrame("loop");
         }
      }
      
      public function checkButtons() : *
      {
         if(!this.self.getControls().BUTTON2)
         {
            this.release = true;
         }
         if(this.release && Boolean(this.self.getControls().BUTTON2))
         {
            this.next = true;
            this.release = false;
         }
      }
      
      public function moveOpp(param1:* = null) : *
      {
         var _loc2_:* = param1.data.receiver;
         var _loc3_:* = _loc2_.getType().slice(4);
         var _loc4_:* = "get" + _loc3_ + "Stat";
         if(_loc3_ == "Character" && this.hit(_loc2_) || _loc3_ == "Item" || _loc3_ == "Enemy")
         {
            if(_loc2_[_loc4_]("canReceiveKnockback"))
            {
               this.xDis = this.self.getX() + this.self.getXSpeed() * 2 - _loc2_.getX() + this.self.flipX(this.offsetX);
               this.yDis = this.self.getY() - 25 + this.self.getYSpeed() * 2 - _loc2_.getY() - this.offsetY * _loc2_[_loc4_]("gravity");
               this.yDis = -this.yDis * _loc2_[_loc4_]("gravity");
               this.distance = Math.sqrt(Math.pow(Math.abs(this.xDis),2) + Math.pow(Math.abs(this.yDis),2));
               this.kbc = 0;
               this.power = 45;
               this.wkb = this.distance * 1.5;
               if(_loc2_.isOnGround())
               {
                  this.wkb *= 2;
               }
               this.kb = SSF2API.calculateKnockback(this.kbc,this.power,this.wkb,this.self.getAttackBoxStat(1,"damage"),_loc2_.getDamage(),_loc2_[_loc4_]("weight1"),false);
               this.angle = Math.atan2(this.yDis,this.xDis);
               this.angle = this.angle * 180 / Math.PI;
               if(_loc3_ != "Character" || _loc3_ == "Character" && !this.crashed(_loc2_))
               {
                  _loc2_.applyKnockback(this.kb,this.angle);
               }
               _loc2_.forceHitStun(this.stunVal);
            }
         }
      }
      
      public function hit(param1:*) : Boolean
      {
         if(param1.getState() == 14 || param1.getState() == 26 || param1.getState() == 27)
         {
            return true;
         }
         return false;
      }
      
      public function crashed(param1:*) : Boolean
      {
         if(param1.getState() == 26)
         {
            return true;
         }
         return false;
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         this.stunVal = 3;
         this.offsetX = 31;
         this.offsetY = 0;
         this.kbc = 0;
         this.power = 40;
         if(SSF2API.isReady() && Boolean(this.self))
         {
            this.next = false;
            this.release = false;
            this.currentJab = 1;
            this.hahsound = true;
            this.self.createTimer(1,-1,this.checkButtons);
            this.self.addEventListener(SSF2Event.ATTACK_HIT,this.moveOpp);
         }
      }
      
      internal function frame4() : *
      {
         this.goldswing.visible = true;
         this.silverswing.visible = false;
         if(this.self.getPaletteSwapData().paletteSwap)
         {
            SSF2API.print(this.self.getPaletteSwapData().paletteSwap.replacements[109].toString());
            if(this.self.getPaletteSwapData().paletteSwap.replacements[109] == 4292203989)
            {
               this.goldswing.visible = false;
               this.silverswing.visible = true;
            }
         }
      }
      
      internal function frame6() : *
      {
         this.rand = SSF2API.randomInteger(0,2);
         if(!this.self.getMetalStatus())
         {
            if(this.rand == 2)
            {
               this.self.playSound("krystal_voice6",true);
            }
            else if(this.rand == 1)
            {
               this.self.playSound("krystal_voice2",true);
            }
         }
         this.self.playAttackSound(1);
      }
      
      internal function frame11() : *
      {
         this.self.createTimer(1,-1,this.checkJab);
      }
      
      internal function frame15() : *
      {
         if(!this.next)
         {
            this.self.endAttack();
         }
      }
      
      internal function frame18() : *
      {
         this.stunVal = 4;
         this.offsetX = 33;
         this.offsetY = 0;
         this.self.refreshAttackID();
         this.self.updateAttackBoxStats(1,{
            "damage":1.5,
            "hitLag":7,
            "effectSound":"brawl_kick_s",
            "effect_id":"effect_hit3"
         });
         this.self.playSound("krystal_swing_S");
      }
      
      internal function frame22() : *
      {
         this.stunVal = 6;
         this.offsetX = 45;
         this.offsetY = 0;
         this.self.refreshAttackID();
         this.self.updateAttackBoxStats(1,{
            "damage":2.5,
            "hitLag":10,
            "effectSound":"brawl_kick_m",
            "effect_id":"effect_hit1"
         });
         this.self.playSound("krystal_swing_S");
      }
      
      internal function frame28() : *
      {
         this.self.createTimer(1,-1,this.checkJab);
      }
      
      internal function frame33() : *
      {
         if(!this.next)
         {
            this.self.endAttack();
         }
      }
      
      internal function frame34() : *
      {
         this.self.removeEventListener(SSF2Event.ATTACK_HIT,this.moveOpp);
         this.self.updateAttackBoxStats(1,{
            "damage":5,
            "hitLag":-1,
            "power":50,
            "kbConstant":90,
            "direction":45,
            "hitStun":2,
            "selfHitStun":3,
            "effect_id":"effect_hit1"
         });
      }
      
      internal function frame37() : *
      {
         this.self.attachEffect("global_dust_light");
         this.self.playVoiceSound(1);
      }
      
      internal function frame38() : *
      {
         this.self.refreshAttackID();
         this.self.playSound("krystal_swing_M");
      }
      
      internal function frame51() : *
      {
         this.self.endAttack();
      }
   }
}

