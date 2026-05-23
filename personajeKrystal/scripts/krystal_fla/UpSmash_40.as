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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1140")]
   public dynamic class UpSmash_40 extends MovieClip
   {
      
      public var attackBox:MovieClip;
      
      public var attackBox2:MovieClip;
      
      public var goldspin:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var hitBox5:MovieClip;
      
      public var silverspin:MovieClip;
      
      public var self:KrystalExt;
      
      public var xframe:String;
      
      public var chargeTime:*;
      
      public var damageCharged:Number;
      
      public function UpSmash_40()
      {
         super();
         addFrameScript(0,this.frame1,3,this.frame4,43,this.frame44,44,this.frame45,45,this.frame46,47,this.frame48,49,this.frame50,51,this.frame52,54,this.frame55,55,this.frame56,59,this.frame60,61,this.frame62,62,this.frame63,73,this.frame74);
      }
      
      public function effects() : void
      {
         this.self.attachEffect("global_dust_heavy",{
            "x":this.self.flipX(5),
            "y":3,
            "scaleX":-0.5,
            "scaleY":-0.5
         });
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         if(Boolean(this.self) && SSF2API.isReady())
         {
            this.self.attachEffect("global_spark",{"y":-25});
         }
      }
      
      internal function frame4() : *
      {
         this.xframe = "charging";
         this.self.createTimer(4,-1,this.effects);
      }
      
      internal function frame44() : *
      {
         this.self.stancePlayFrame("charging");
      }
      
      internal function frame45() : *
      {
         this.xframe = "attack";
         this.self.destroyTimer(this.effects);
         if(!this.self.getMetalStatus())
         {
            this.self.playSound("krystal_voice7",true);
         }
         this.self.playSound("krystal_upsmash_sfx");
         this.chargeTime = this.self.getExecTime() - 1;
         this.damageCharged = 1.4 * (this.chargeTime / 40) + 2.6;
         this.self.updateAttackBoxStats(1,{"damage":this.damageCharged});
         this.self.updateAttackBoxStats(2,{"damage":this.damageCharged});
      }
      
      internal function frame46() : *
      {
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
      
      internal function frame48() : *
      {
         this.self.attachEffect("global_dust_cloud",{
            "scaleX":0.65,
            "scaleY":0.65
         });
         this.self.playAttackSound(1);
         this.self.playSound("throw_woosh");
      }
      
      internal function frame50() : *
      {
         this.self.updateAttackBoxStats(1,{"direction":150});
         this.self.updateAttackBoxStats(2,{"direction":150});
      }
      
      internal function frame52() : *
      {
         this.self.playAttackSound(1);
         this.self.playSound("throw_woosh");
      }
      
      internal function frame55() : *
      {
         this.self.updateAttackBoxStats(1,{"direction":190});
         this.self.updateAttackBoxStats(2,{"direction":190});
      }
      
      internal function frame56() : *
      {
         this.self.playAttackSound(1);
         this.self.playSound("throw_woosh");
      }
      
      internal function frame60() : *
      {
         this.self.updateAttackBoxStats(1,{"direction":220});
         this.self.updateAttackBoxStats(2,{"direction":220});
         this.self.playAttackSound(1);
         this.self.playSound("throw_woosh");
         this.self.playVoiceSound(1);
      }
      
      internal function frame62() : *
      {
         this.self.updateAttackStats({"refreshRate":999});
         this.self.refreshAttackID();
      }
      
      internal function frame63() : *
      {
         this.self.updateAttackBoxStats(1,{
            "damage":9,
            "effectSound":"sw_brawl_hit_H",
            "direction":100,
            "power":68,
            "kbConstant":84,
            "hitStun":5,
            "selfHitStun":2,
            "hitLag":-1
         });
         this.self.updateAttackBoxStats(2,{
            "damage":9,
            "effectSound":"sw_brawl_hit_H",
            "direction":100,
            "power":68,
            "kbConstant":84,
            "hitStun":5,
            "selfHitStun":2,
            "hitLag":-1
         });
         this.self.playSound("krystal_swing_sm");
         this.self.playSound("throw_woosh");
      }
      
      internal function frame74() : *
      {
         this.self.endAttack();
      }
   }
}

