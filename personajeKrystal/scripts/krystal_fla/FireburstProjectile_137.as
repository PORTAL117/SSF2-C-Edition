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
   
   [Embed(source="/_assets/assets.swf", symbol="symbol200")]
   public dynamic class FireburstProjectile_137 extends MovieClip
   {
      
      public var attackBox:MovieClip;
      
      public var self:*;
      
      public var chars:*;
      
      public var i:*;
      
      public function FireburstProjectile_137()
      {
         super();
         addFrameScript(0,this.frame1,7,this.frame8,8,this.frame9,50,this.frame51);
      }
      
      public function charIsAvailable(param1:int) : Boolean
      {
         if(!this.chars[param1].getStandby() && this.chars[param1].getState() != CState.REVIVAL && this.chars[param1].getState() != CState.STAR_KO && this.chars[param1].getState() != CState.SCREEN_KO && this.chars[param1].getState() != CState.DEAD && this.chars[param1].getState() != CState.STAMINA_KO)
         {
            return true;
         }
         return false;
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getProjectile(this);
         if(SSF2API.isReady() && this.self)
         {
            this.chars = SSF2API.getCharacters();
            this.i = 0;
            while(this.i < this.chars.length)
            {
               if(this.chars[this.i] == this.self.getOwner() || this.chars[this.i].getTeamID() != -1 && this.chars[this.i].getTeamID() == this.self.getOwner().getTeamID())
               {
                  this.chars.splice(this.i,1);
               }
               ++this.i;
            }
         }
      }
      
      internal function frame8() : *
      {
         this.i = 0;
         while(this.i < this.chars.length)
         {
            if(this.chars[this.i].getX() < this.self.getX() + 40 && this.chars[this.i].getX() > this.self.getX() - 40 && !this.chars[this.i].isOnGround())
            {
               if(this.charIsAvailable(this.i))
               {
                  this.self.stancePlayFrame("airburst");
                  this.self.setX(this.chars[this.i].getX() + SSF2API.randomInteger(-80,80));
                  this.self.setY(this.chars[this.i].getY() - 20 + SSF2API.randomInteger(-80,80));
               }
            }
            ++this.i;
         }
      }
      
      internal function frame9() : *
      {
         this.self.playSound("krystal_fireburst_sfx" + SSF2API.safeRandomInteger(1,3).toString());
         SSF2API.getCamera().shake(8);
      }
      
      internal function frame51() : *
      {
         SSF2API.getCamera().shake(8);
      }
   }
}

