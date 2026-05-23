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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1170")]
   public dynamic class DownSpecialAir_54 extends MovieClip
   {
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var hitBox5:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self:KrystalExt;
      
      public var xframe:*;
      
      public var controls:*;
      
      public var proj:*;
      
      public var charge:*;
      
      public function DownSpecialAir_54()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,4,this.frame5,5,this.frame6,6,this.frame7,7,this.frame8,9,this.frame10,26,this.frame27);
      }
      
      public function grounded(param1:* = null) : *
      {
         if(currentFrame == 10)
         {
            this.self.setGlobalVariable("tossed",true);
         }
         if(currentFrame < 8)
         {
            this.self.setGlobalVariable("charge",this.charge);
         }
         this.self.setAttackEnabled(true,"b_forward");
         this.self.setAttackEnabled(true,"b_forward_air");
         if(this.self.getMetalStatus())
         {
            this.self.playSound("metal_land_s");
         }
         else
         {
            this.self.playSound("krystal_footstep");
            this.self.playSound("krystal_footstep2");
         }
         this.self.forceAttack("b_down",currentFrame);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         this.xframe = null;
         this.charge = 0;
         if(parent && SSF2API.isReady() && Boolean(this.self))
         {
            this.self.addEventListener(SSF2Event.GROUND_TOUCH,this.grounded);
         }
      }
      
      internal function frame2() : *
      {
         this.self.playSound("krystal_readygrenade");
      }
      
      internal function frame5() : *
      {
         this.controls = this.self.getControls();
         if(this.self.isFacingRight() && this.controls.LEFT && !this.controls.RIGHT || !this.self.isFacingRight() && !this.controls.LEFT && this.controls.RIGHT)
         {
            this.self.flip();
         }
      }
      
      internal function frame6() : *
      {
         ++this.charge;
      }
      
      internal function frame7() : *
      {
         this.controls = this.self.getControls();
         if(Boolean(this.controls.BUTTON1) && this.charge < 30)
         {
            this.self.stancePlayFrame("loop");
         }
         else if(this.self.isFacingRight() && this.controls.LEFT && !this.controls.RIGHT || !this.self.isFacingRight() && !this.controls.LEFT && this.controls.RIGHT)
         {
            this.self.flip();
         }
      }
      
      internal function frame8() : *
      {
         this.self.attachEffect("global_dust_light");
         this.self.playSound("throw_woosh");
      }
      
      internal function frame10() : *
      {
         this.proj = this.self.fireProjectile("krystal_grenade_proj",0,0,false,{
            "chargetime":this.charge,
            "chargetime_max":30
         });
      }
      
      internal function frame27() : *
      {
         this.self.endAttack();
      }
   }
}

