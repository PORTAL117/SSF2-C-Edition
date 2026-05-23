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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1341")]
   public dynamic class FinalSmash_95 extends MovieClip
   {
      
      public var attackBox:MovieClip;
      
      public var beacon:MovieClip;
      
      public var camBox:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self:KrystalExt;
      
      public var effect:*;
      
      public var proj:*;
      
      public var chars:*;
      
      public var rand:*;
      
      public var rand2:*;
      
      public var backupSpawns:Vector.<Point>;
      
      public var i:*;
      
      public function FinalSmash_95()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,10,this.frame11,14,this.frame15,26,this.frame27,50,this.frame51,69,this.frame70,120,this.frame121,138,this.frame139,149,this.frame150,152,this.frame153,153,this.frame154);
      }
      
      public function moveSwirl(param1:* = null) : *
      {
         if(this.effect.y > SSF2API.getStage().getCameraBounds().y - 60)
         {
            this.effect.y -= 20;
            this.effect.x = this.self.getX();
         }
         else
         {
            if(this.effect.parent != null)
            {
               this.effect.parent.removeChild(this.effect);
            }
            this.self.destroyTimer(this.moveSwirl);
         }
      }
      
      public function bombs(param1:* = null) : *
      {
         this.rand = SSF2API.randomInteger(0,this.chars.length - 1);
         if(SSF2API.random() < 0.65 && !this.chars[this.rand].getStandby() && this.chars[this.rand].getState() != CState.REVIVAL && this.chars[this.rand].getState() != CState.STAR_KO && this.chars[this.rand].getState() != CState.SCREEN_KO && this.chars[this.rand].getState() != CState.DEAD && this.chars[this.rand].getState() != CState.STAMINA_KO)
         {
            this.proj = this.self.fireProjectile("krystal_fireburst",this.randomPlayerX(),this.chars[this.rand].getY(),true);
            this.proj.forceOnGround(400);
            if(!this.proj.isOnGround())
            {
               this.spawnAtRandom(this.proj);
            }
         }
         else
         {
            this.proj = this.self.fireProjectile("krystal_fireburst",0,0,true);
            this.spawnAtRandom(this.proj);
         }
         this.rand = SSF2API.random() * 0.75;
         this.proj.setScale(0.75 + this.rand,0.75 + this.rand);
      }
      
      public function spawnAtRandom(param1:*) : *
      {
         this.rand2 = SSF2API.randomInteger(0,this.backupSpawns.length - 1);
         param1.setX(this.backupSpawns[this.rand2].x);
         param1.setY(this.backupSpawns[this.rand2].y);
      }
      
      public function randomPlayerX() : Number
      {
         return this.chars[this.rand].getX() + SSF2API.randomInteger(-100,100);
      }
      
      public function findBackupSpawns() : *
      {
         var _loc1_:MovieClip = SSF2API.getStage().getCameraBounds();
         this.backupSpawns = GroundPointFinder.findPoints(new Rectangle(_loc1_.x,_loc1_.y,_loc1_.width,_loc1_.height),50,75,75);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         if(SSF2API.isReady() && Boolean(this.self))
         {
            this.chars = SSF2API.getCharacters();
            this.i = 0;
            while(this.i < this.chars.length)
            {
               if(this.chars[this.i] == this.self || this.chars[this.i].getTeamID() != -1 && this.chars[this.i].getTeamID() == this.self.getTeamID())
               {
                  this.chars.splice(this.i,1);
               }
               ++this.i;
            }
            this.findBackupSpawns();
            if(!this.self.getMetalStatus())
            {
               this.self.playSound("krystal_fsvoice1",true);
            }
            this.self.playSound("krystal_podswing");
            this.self.unnattachFromGround();
         }
      }
      
      internal function frame2() : *
      {
         SSF2API.getCamera().killDarkener(true);
      }
      
      internal function frame11() : *
      {
         this.self.playSound("krystal_podswing");
      }
      
      internal function frame15() : *
      {
         SSF2API.getCamera().shake(9);
         this.self.playSound("metal_land_l");
         this.self.playSound("metal_land_m");
      }
      
      internal function frame27() : *
      {
         if(!this.self.getMetalStatus())
         {
            this.self.playSound("krystal_fsvoice2",true);
         }
      }
      
      internal function frame51() : *
      {
         SSF2API.getCamera().shake(14);
         this.self.playSound("krystal_podfire");
         this.beacon.height = this.self.getY() - SSF2API.getStage().getCameraBounds().y;
         this.effect = this.self.attachEffect("krystal_fpodswirl");
         this.self.createTimer(1,-1,this.moveSwirl,{"persistent":true});
      }
      
      internal function frame70() : *
      {
         this.self.createTimer(2,20,this.bombs);
      }
      
      internal function frame121() : *
      {
         this.self.playSound("krystal_podclose");
      }
      
      internal function frame139() : *
      {
         if(!this.self.getMetalStatus())
         {
            this.self.playSound("krystal_fsvoice3",true);
         }
      }
      
      internal function frame150() : *
      {
         this.self.attachEffect("krystal_fpod_wireframe");
         this.self.playSound("krystal_poddespawn");
      }
      
      internal function frame153() : *
      {
         this.self.forceOnGround(5);
         if(!this.self.isOnGround())
         {
            this.self.updateAttackStats({"allowControl":true});
            this.self.resetJumps();
            this.self.toJump();
         }
      }
      
      internal function frame154() : *
      {
         this.self.endAttack();
      }
   }
}

