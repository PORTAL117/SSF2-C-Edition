package krystal_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1141")]
   public dynamic class UpTilt_43 extends MovieClip
   {
      
      public var attackBox:MovieClip;
      
      public var attackBox2:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self:KrystalExt;
      
      public var playsound:Number;
      
      public var audio:Number;
      
      public function UpTilt_43()
      {
         super();
         addFrameScript(0,this.frame1,2,this.frame3,3,this.frame4,15,this.frame16);
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
      
      internal function frame3() : *
      {
         this.self.playAttackSound(1);
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
      }
      
      internal function frame4() : *
      {
         this.self.attachEffect("global_dust_light");
      }
      
      internal function frame16() : *
      {
         this.self.endAttack();
      }
   }
}

