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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol222")]
   public dynamic class QuakeProjectile_129 extends MovieClip
   {
      
      public var attackBox:MovieClip;
      
      public var attackBox2:MovieClip;
      
      public var self:*;
      
      public var character:*;
      
      public function QuakeProjectile_129()
      {
         super();
         addFrameScript(0,this.frame1,12,this.frame13);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getProjectile(this);
         if(SSF2API.isReady() && this.self)
         {
            this.character = this.self.getOwner();
            this.self.swapDepths(this.character);
         }
      }
      
      internal function frame13() : *
      {
         this.self.destroy();
      }
   }
}

