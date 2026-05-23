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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1190")]
   public dynamic class UpThrow_60 extends MovieClip
   {
      
      public var attackBox:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var touchBox:MovieClip;
      
      public var self:KrystalExt;
      
      public var target:*;
      
      public var grab:*;
      
      public function UpThrow_60()
      {
         super();
         addFrameScript(0,this.frame1,3,this.frame4,4,this.frame5,11,this.frame12);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
      }
      
      internal function frame4() : *
      {
         this.self.attachEffect("global_dust_light");
         this.self.playSound("throw_woosh");
      }
      
      internal function frame5() : *
      {
         this.self.attachEffect("global_dust_cloud",{
            "scaleX":0.6,
            "scaleY":0.6
         });
      }
      
      internal function frame12() : *
      {
         this.target = null;
         this.grab = 0;
         if(this.self.isCPU())
         {
            this.target = this.self.getGrabbedOpponents()[0];
            this.grab = SSF2API.random();
            if(this.target != null && this.target.getDamage() >= 70)
            {
               if(this.grab <= 0.8)
               {
                  this.self.importCPUControls([128,7,2208,1]);
               }
            }
            else if(this.target != null)
            {
               if(this.grab <= 0.4 && this.target.getDamage() <= 50)
               {
                  this.self.importCPUControls([6305,1]);
               }
               else if(this.grab <= 0.5)
               {
                  this.self.importCPUControls([128,7,4129,1]);
               }
               else if(this.grab <= 0.75)
               {
                  this.self.importCPUControls([128,7,4385,1]);
               }
               else
               {
                  this.self.importCPUControls([128,7,4641,1]);
               }
            }
         }
         this.self.endAttack();
      }
   }
}

