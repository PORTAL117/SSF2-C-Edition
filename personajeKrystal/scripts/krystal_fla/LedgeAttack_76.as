package krystal_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1229")]
   public dynamic class LedgeAttack_76 extends MovieClip
   {
      
      public var attackBox:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self:KrystalExt;
      
      public var playsound:Number;
      
      public var audio:Number;
      
      public function LedgeAttack_76()
      {
         super();
         addFrameScript(0,this.frame1,4,this.frame5,10,this.frame11,11,this.frame12,12,this.frame13,17,this.frame18,19,this.frame20,21,this.frame22,24,this.frame25);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         if(parent && SSF2API.isReady() && Boolean(this.self))
         {
            this.self.setIntangibility(true);
            this.playsound = SSF2API.random();
            this.audio = this.self.getGlobalVariable("audio");
         }
      }
      
      internal function frame5() : *
      {
         this.self.playSound("krystal_jumpSound");
      }
      
      internal function frame11() : *
      {
         this.self.setXSpeed(10,false);
      }
      
      internal function frame12() : *
      {
         this.self.playSound("krystal_swing_H");
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
      
      internal function frame13() : *
      {
         this.self.setIntangibility(false);
      }
      
      internal function frame18() : *
      {
         this.self.safeMove(this.self.flipX(2),0);
      }
      
      internal function frame20() : *
      {
         this.self.safeMove(this.self.flipX(8),0);
         if(this.self.getMetalStatus())
         {
            this.self.playSound("metal_step_s1");
         }
         else
         {
            this.self.playSound("krystal_footstep");
         }
      }
      
      internal function frame22() : *
      {
         this.self.safeMove(this.self.flipX(2),0);
      }
      
      internal function frame25() : *
      {
         this.self.safeMove(this.self.flipX(2),0);
         this.self.endAttack();
      }
   }
}

