package krystal_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1068")]
   public dynamic class DashAttack_31 extends MovieClip
   {
      
      public var attackBox:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self:KrystalExt;
      
      public var controls:*;
      
      public var playsound:Number;
      
      public var audio:Number;
      
      public function DashAttack_31()
      {
         super();
         addFrameScript(0,this.frame1,3,this.frame4,4,this.frame5,13,this.frame14,15,this.frame16,16,this.frame17,17,this.frame18,18,this.frame19,20,this.frame21);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         if(parent && SSF2API.isReady() && Boolean(this.self))
         {
            this.controls = this.self.getControls();
            this.playsound = SSF2API.random();
            this.audio = this.self.getGlobalVariable("audio");
            this.self.setXSpeed(20,false);
            this.self.attachEffect("global_dust_heavy",{
               "scaleX":0.7,
               "scaleY":0.5
            });
         }
      }
      
      internal function frame4() : *
      {
         this.self.setXSpeed(0);
         if(this.playsound > 0.8 && this.audio != 4)
         {
            this.self.playVoiceSound(4);
            this.self.setGlobalVariable("audio",4);
         }
         else if(this.playsound > 0.6 && this.audio != 3)
         {
            this.self.playVoiceSound(3);
            this.self.setGlobalVariable("audio",3);
         }
         else if(this.playsound > 0.4 && this.audio != 2)
         {
            this.self.playVoiceSound(2);
            this.self.setGlobalVariable("audio",2);
         }
         else if(this.playsound > 0.2 && this.audio != 1)
         {
            this.self.playVoiceSound(1);
            this.self.setGlobalVariable("audio",1);
         }
      }
      
      internal function frame5() : *
      {
         this.self.playAttackSound(1);
      }
      
      internal function frame14() : *
      {
         this.self.setXSpeed(-13,false);
      }
      
      internal function frame16() : *
      {
         this.self.setXSpeed(this.self.getXSpeed() * 0.9);
      }
      
      internal function frame17() : *
      {
         this.self.setXSpeed(this.self.getXSpeed() * 0.9);
      }
      
      internal function frame18() : *
      {
         this.self.setXSpeed(this.self.getXSpeed() * 0.6);
         if(this.self.getMetalStatus())
         {
            this.self.playSound("metal_step_s1");
         }
         else
         {
            this.self.playSound("krystal_footstep");
         }
      }
      
      internal function frame19() : *
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
      
      internal function frame21() : *
      {
         if(this.self.isFacingRight())
         {
            this.self.faceLeft();
         }
         else
         {
            this.self.faceRight();
         }
         this.self.endAttack();
      }
   }
}

