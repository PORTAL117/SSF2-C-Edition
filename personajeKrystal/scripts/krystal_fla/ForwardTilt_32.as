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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1088")]
   public dynamic class ForwardTilt_32 extends MovieClip
   {
      
      public var attackBox:MovieClip;
      
      public var attackBox2:MovieClip;
      
      public var goldspin:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var hitBox5:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var silverspin:MovieClip;
      
      public var self:KrystalExt;
      
      public var playsound:Number;
      
      public var audio:Number;
      
      public function ForwardTilt_32()
      {
         super();
         addFrameScript(0,this.frame1,3,this.frame4,4,this.frame5,11,this.frame12,19,this.frame20);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         if(parent && SSF2API.isReady() && Boolean(this.self))
         {
            this.playsound = SSF2API.random();
            this.audio = this.self.getGlobalVariable("audio");
         }
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
         this.goldspin.visible = true;
         this.silverspin.visible = false;
         if(this.self.getPaletteSwapData().paletteSwap)
         {
            SSF2API.print(this.self.getPaletteSwapData().paletteSwap.replacements[109].toString());
            if(this.self.getPaletteSwapData().paletteSwap.replacements[109] == 4292203989)
            {
               this.goldspin.visible = false;
               this.silverspin.visible = true;
            }
         }
      }
      
      internal function frame5() : *
      {
         this.self.playAttackSound(1);
         if(this.self.getMetalStatus())
         {
            this.self.playSound("metal_step_s1");
         }
         else
         {
            this.self.playSound("krystal_footstep");
         }
      }
      
      internal function frame12() : *
      {
         this.self.updateAttackBoxStats(1,{
            "direction":40,
            "damage":6,
            "power":44,
            "kbConstant":94,
            "effectSound":"sw_brawl_hit_H"
         });
         this.self.updateAttackBoxStats(2,{
            "direction":40,
            "damage":6,
            "power":44,
            "kbConstant":94,
            "effectSound":"sw_brawl_hit_H"
         });
         this.self.refreshAttackID();
         this.self.playSound("krystal_swing_sm");
      }
      
      internal function frame20() : *
      {
         this.self.endAttack();
      }
   }
}

