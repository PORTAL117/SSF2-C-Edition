package krystal_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1166")]
   public dynamic class UpSpecial_50 extends MovieClip
   {
      
      public var attackBox:MovieClip;
      
      public var attackBox2:MovieClip;
      
      public var hand:MovieClip;
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var hitBox5:MovieClip;
      
      public var self:KrystalExt;
      
      public function UpSpecial_50()
      {
         super();
         addFrameScript(0,this.frame1,4,this.frame5,8,this.frame9,9,this.frame10,21,this.frame22,24,this.frame25,36,this.frame37);
      }
      
      public function flyUp(param1:* = null) : *
      {
         if(this.self.getYSpeed() > -10)
         {
            this.self.setYSpeed(-10);
         }
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
         if(parent && SSF2API.isReady() && Boolean(this.self))
         {
            this.self.updateAttackStats({
               "allowControl":false,
               "air_ease":0
            });
         }
      }
      
      internal function frame5() : *
      {
         this.self.playAttackSound(1);
         this.self.playSound("krystal_swing_ss");
      }
      
      internal function frame9() : *
      {
         this.self.refreshAttackID();
         this.self.updateAttackBoxStats(1,{
            "damage":15,
            "direction":85,
            "power":50,
            "kbConstant":85,
            "hitLag":-1,
            "effectSound":"sw_brawl_hit_H",
            "effect_id":"effect_swordSlash",
            "hitStun":5,
            "selfHitStun":2,
            "stackKnockback":false
         });
         this.self.setYSpeed(-22);
         if(!this.self.getMetalStatus())
         {
            this.self.playSound("krystal_voice1",true);
         }
      }
      
      internal function frame10() : *
      {
         this.self.updateAttackBoxStats(1,{
            "damage":11,
            "direction":90,
            "power":50,
            "kbConstant":85,
            "effectSound":"sw_brawl_hit_H",
            "effect_id":"effect_swordSlash",
            "hitStun":3,
            "selfHitStun":1,
            "stackKnockback":true
         });
         this.self.updateAttackStats({
            "allowControl":true,
            "xSpeedDecayAir":0.25,
            "xSpeedCap":4
         });
         this.self.createTimer(1,9,this.flyUp);
         this.self.playAttackSound(2);
      }
      
      internal function frame22() : *
      {
         this.self.addEventListener(SSF2Event.GROUND_TOUCH,this.self.toHeavyLand);
         this.self.updateAttackStats({
            "allowControl":true,
            "xSpeedDecayAir":0,
            "xSpeedCap":-1,
            "air_ease":-1
         });
      }
      
      internal function frame25() : *
      {
         this.self.updateAttackStats({"allowFastFall":true});
      }
      
      internal function frame37() : *
      {
         this.self.toHelpless();
      }
   }
}

