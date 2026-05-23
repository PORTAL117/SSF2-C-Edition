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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1052")]
   public dynamic class DoubleJump_23 extends MovieClip
   {
      
      public var hand:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var hitBox5:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self:KrystalExt;
      
      public function DoubleJump_23()
      {
         super();
         addFrameScript(0,this.frame1,9,this.frame10,21,this.frame22,28,this.frame29,34,this.frame35,43,this.frame44);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         if(SSF2API.isReady() && Boolean(this.self))
         {
            if(this.self.getGlobalVariable("screwAttackOn") && this.self.getMidairJumpCount() < 2)
            {
               this.self.forceAttack("item_screw");
            }
            else if(this.self.getGlobalVariable("sonicShieldFiredash") && (Boolean(this.self.getControls().LEFT) || Boolean(this.self.getControls().RIGHT)))
            {
               this.self.forceAttack("item_firedash");
            }
            else if(this.self.getGlobalVariable("sonicShieldBubbleBounce") && Boolean(this.self.getControls().DOWN))
            {
               this.self.forceAttack("item_bubblebounce");
            }
            else
            {
               this.self.playSound("krystal_jumpSound2");
               if(this.self.isFacingRight() && this.self.getControls().LEFT || !this.self.isFacingRight() && this.self.getControls().RIGHT)
               {
                  this.self.stancePlayFrame("backflip");
               }
            }
         }
      }
      
      internal function frame10() : *
      {
         this.self.playSound("krystal_jumpflip");
      }
      
      internal function frame22() : *
      {
         this.self.endAttack();
      }
      
      internal function frame29() : *
      {
         this.self.playSound("krystal_jumpflip");
      }
      
      internal function frame35() : *
      {
         this.self.playSound("krystal_jumpflip");
      }
      
      internal function frame44() : *
      {
         this.self.endAttack();
      }
   }
}

