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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1251")]
   public dynamic class Taunts_92 extends MovieClip
   {
      
      public var goldspin:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var hitBox5:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var silverspin:MovieClip;
      
      public var self:KrystalExt;
      
      public function Taunts_92()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,5,this.frame6,10,this.frame11,40,this.frame41,45,this.frame46,50,this.frame51,52,this.frame53,57,this.frame58,62,this.frame63,68,this.frame69,73,this.frame74,75,this.frame76,80,this.frame81,81,this.frame82,108,this.frame109,110,this.frame111,111,this.frame112,115,this.frame116,118,this.frame119,119,this.frame120,122,this.frame123,125,this.frame126,126,this.frame127,127,this.frame128,131,this.frame132,135,this.frame136,136,this.frame137,154,this.frame155,157,this.frame158);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
      }
      
      internal function frame2() : *
      {
         if(!this.self.getMetalStatus())
         {
            this.self.playSound("krystal_taunt2",true);
         }
      }
      
      internal function frame6() : *
      {
         this.self.playSound("krystal_swing_ss");
         if(this.self.getMetalStatus())
         {
            this.self.playSound("metal_step_s1");
         }
         else
         {
            this.self.playSound("krystal_footstep");
         }
      }
      
      internal function frame11() : *
      {
         this.self.playSound("grab");
      }
      
      internal function frame41() : *
      {
         this.self.playSound("krystal_swing_ss");
      }
      
      internal function frame46() : *
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
      
      internal function frame51() : *
      {
         this.self.endAttack();
      }
      
      internal function frame53() : *
      {
         if(!this.self.getMetalStatus())
         {
            this.self.playSound("krystal_taunt3",true);
         }
      }
      
      internal function frame58() : *
      {
         this.self.playSound("krystal_jumpSound");
      }
      
      internal function frame63() : *
      {
         this.self.playSound("krystal_jumpflip");
      }
      
      internal function frame69() : *
      {
         this.self.playSound("krystal_jumpflip");
      }
      
      internal function frame74() : *
      {
         if(!this.self.getMetalStatus())
         {
            this.self.playSound("krystal_taunt4",true);
         }
      }
      
      internal function frame76() : *
      {
         this.self.playSound("krystal_jumpflip");
      }
      
      internal function frame81() : *
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
      
      internal function frame82() : *
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
      
      internal function frame109() : *
      {
         this.self.endAttack();
      }
      
      internal function frame111() : *
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
      
      internal function frame112() : *
      {
         this.self.playSound("krystal_swing_ss");
      }
      
      internal function frame116() : *
      {
         this.self.playSound("krystal_swing_ss");
         if(!this.self.getMetalStatus())
         {
            this.self.playSound("krystal_taunt1",true);
         }
      }
      
      internal function frame119() : *
      {
         this.self.playSound("krystal_swing_sm");
      }
      
      internal function frame120() : *
      {
         this.self.playSound("krystal_footstep");
         this.self.playSound("krystal_swing_ss");
      }
      
      internal function frame123() : *
      {
         this.self.playSound("krystal_swing_ss");
      }
      
      internal function frame126() : *
      {
         this.self.playSound("krystal_swing_ss");
      }
      
      internal function frame127() : *
      {
         this.self.playSound("krystal_swing_sm");
      }
      
      internal function frame128() : *
      {
         this.self.playSound("krystal_footstep2");
         this.self.playSound("krystal_swing_ss");
      }
      
      internal function frame132() : *
      {
         this.self.playSound("krystal_swing_ss");
      }
      
      internal function frame136() : *
      {
         this.self.playSound("krystal_swing_sl");
         this.self.playSound("krystal_swing_M");
      }
      
      internal function frame137() : *
      {
         this.self.playSound("krystal_footstep");
      }
      
      internal function frame155() : *
      {
         this.self.playSound("krystal_footstep2");
      }
      
      internal function frame158() : *
      {
         this.self.endAttack();
      }
   }
}

