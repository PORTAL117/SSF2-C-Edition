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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol997")]
   public dynamic class Idle_8 extends MovieClip
   {
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var hitBox5:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self:KrystalExt;
      
      public var rand:int;
      
      public var repeats:int;
      
      public function Idle_8()
      {
         super();
         addFrameScript(0,this.frame1,28,this.frame29,32,this.frame33,72,this.frame73);
      }
      
      public function uncrouch(param1:* = null) : *
      {
         if(param1.data.fromState == 12 && this.self.getGlobalVariable("crouchdown"))
         {
            this.self.setGlobalVariable("crouchdown",false);
            this.self.stancePlayFrame("uncrouch");
         }
         else
         {
            this.self.setGlobalVariable("crouchdown",false);
         }
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         this.rand = 0;
         if(SSF2API.isReady() && Boolean(this.self))
         {
            this.self.setAttackEnabled(true,"b_forward");
            this.self.setAttackEnabled(true,"b_forward_air");
            if(this.repeats >= 3)
            {
               this.rand = SSF2API.randomInteger(0,3);
               if(this.rand >= 3)
               {
                  this.repeats = 0;
                  this.gotoAndStop("wait");
               }
            }
         }
         if(Boolean(this.self) && SSF2API.isReady())
         {
            if(!this.self.hasEventListener(SSF2Event.STATE_CHANGE,this.uncrouch))
            {
               this.self.addEventListener(SSF2Event.STATE_CHANGE,this.uncrouch);
            }
         }
      }
      
      internal function frame29() : *
      {
         ++this.repeats;
         this.gotoAndStop("loop");
      }
      
      internal function frame33() : *
      {
         gotoAndStop("loop");
      }
      
      internal function frame73() : *
      {
         this.gotoAndStop("loop");
      }
   }
}

