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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1393")]
   public dynamic class rifleanim_2 extends MovieClip
   {
      
      public var attackBox:MovieClip;
      
      public var self:*;
      
      public var prevY:*;
      
      public function rifleanim_2()
      {
         super();
         addFrameScript(0,this.frame1,9,this.frame10,11,this.frame12,12,this.frame13);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getProjectile(this);
         this.prevY = 0;
         if(SSF2API.isReady() && this.self)
         {
            this.self.addEventListener(SSF2Event.GROUND_TOUCH,this.self.destroy);
            this.self.addEventListener(SSF2Event.HIT_WALL,this.self.destroy);
            if(this.self.getGlobalVariable("reversed"))
            {
               this.self.updateAttackBoxStats(1,{
                  "damage":12,
                  "power":47,
                  "kbConstant":82
               });
            }
         }
      }
      
      internal function frame10() : *
      {
         this.self.stancePlayFrame("loop");
      }
      
      internal function frame12() : *
      {
         if(this.self == null)
         {
            this.self = SSF2API.getProjectile(this);
         }
         this.self.stancePlayFrame("suspend");
      }
      
      internal function frame13() : *
      {
         this.self = SSF2API.getProjectile(this);
         this.prevY = 0;
         if(SSF2API.isReady() && this.self)
         {
            this.self.addEventListener(SSF2Event.GROUND_TOUCH,this.self.destroy);
            this.self.addEventListener(SSF2Event.HIT_WALL,this.self.destroy);
            this.self.stancePlayFrame("loop");
         }
      }
   }
}

