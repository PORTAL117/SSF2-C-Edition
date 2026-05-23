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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1100")]
   public dynamic class ForwardSmash_35 extends MovieClip
   {
      
      public var attackBox:MovieClip;
      
      public var attackBox2:MovieClip;
      
      public var goldswing:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var silverswing:MovieClip;
      
      public var self:KrystalExt;
      
      public var xframe:String;
      
      public function ForwardSmash_35()
      {
         super();
         addFrameScript(0,this.frame1,4,this.frame5,44,this.frame45,45,this.frame46,46,this.frame47,47,this.frame48,48,this.frame49,49,this.frame50,51,this.frame52,65,this.frame66);
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
      
      internal function frame5() : *
      {
         this.xframe = "charging";
         this.self.createTimer(4,-1,this.effects);
      }
      
      internal function frame45() : *
      {
         this.self.stancePlayFrame("charging");
      }
      
      internal function frame46() : *
      {
         if(SSF2API.getPlatformBetweenPoints(new Point(this.self.getX() + this.self.flipX(2),this.self.getY() - 2),new Point(this.self.getX() + this.self.flipX(2),this.self.getY() + 15),{"ignoreFallthrough":false}))
         {
            this.self.safeMove(this.self.flipX(2),0);
         }
         this.goldswing.visible = true;
         this.silverswing.visible = false;
         if(this.self.getPaletteSwapData().paletteSwap)
         {
            SSF2API.print(this.self.getPaletteSwapData().paletteSwap.replacements[109].toString());
            if(this.self.getPaletteSwapData().paletteSwap.replacements[109] == 4292203989)
            {
               this.goldswing.visible = false;
               this.silverswing.visible = true;
            }
         }
         this.xframe = "attack";
         this.self.destroyTimer(this.effects);
      }
      
      internal function frame47() : *
      {
         if(SSF2API.getPlatformBetweenPoints(new Point(this.self.getX() + this.self.flipX(2),this.self.getY() - 2),new Point(this.self.getX() + this.self.flipX(2),this.self.getY() + 15),{"ignoreFallthrough":false}))
         {
            this.self.safeMove(this.self.flipX(2),0);
         }
         this.self.playVoiceSound(1);
      }
      
      internal function frame48() : *
      {
         if(SSF2API.getPlatformBetweenPoints(new Point(this.self.getX() + this.self.flipX(4),this.self.getY() - 2),new Point(this.self.getX() + this.self.flipX(4),this.self.getY() + 15),{"ignoreFallthrough":false}))
         {
            this.self.safeMove(this.self.flipX(4),0);
         }
      }
      
      internal function frame49() : *
      {
         if(SSF2API.getPlatformBetweenPoints(new Point(this.self.getX() + this.self.flipX(6),this.self.getY() - 2),new Point(this.self.getX() + this.self.flipX(6),this.self.getY() + 15),{"ignoreFallthrough":false}))
         {
            this.self.safeMove(this.self.flipX(6),0);
         }
         this.self.setXSpeed(8,false);
      }
      
      internal function frame50() : *
      {
         if(SSF2API.getPlatformBetweenPoints(new Point(this.self.getX() + this.self.flipX(4),this.self.getY() - 2),new Point(this.self.getX() + this.self.flipX(4),this.self.getY() + 15),{"ignoreFallthrough":false}))
         {
            this.self.safeMove(this.self.flipX(4),0);
         }
         this.self.attachEffect("global_dust_heavy",{
            "scaleX":0.75,
            "scaleY":0.75
         });
         this.self.playAttackSound(1);
         this.self.playSound("krystal_magic");
      }
      
      internal function frame52() : *
      {
      }
      
      internal function frame66() : *
      {
         this.self.endAttack();
      }
   }
}

