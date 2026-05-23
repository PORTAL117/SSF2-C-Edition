package krystal_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1224")]
   public dynamic class SpotDodge_71 extends MovieClip
   {
      
      public var hitBox:MovieClip;
      
      public var hitBox2:MovieClip;
      
      public var hitBox3:MovieClip;
      
      public var hitBox4:MovieClip;
      
      public var itemBox:MovieClip;
      
      public var self:KrystalExt;
      
      public function SpotDodge_71()
      {
         super();
         addFrameScript(0,this.frame1,1,this.frame2,8,this.frame9,12,this.frame13);
      }
      
      public function clearDodged(param1:* = null) : *
      {
         this.self.setGlobalVariable("dodged",null);
      }
      
      internal function frame1() : *
      {
         this.self = SSF2API.getCharacter(this) as KrystalExt;
      }
      
      internal function frame2() : *
      {
         this.self.setIntangibility(true);
         this.self.attachEffect("global_dust_cloud",{
            "scaleX":0.8,
            "scaleY":0.8
         });
      }
      
      internal function frame9() : *
      {
         this.self.setIntangibility(false);
      }
      
      internal function frame13() : *
      {
         this.self.setGlobalVariable("dodged","spot");
         this.self.createTimer(2,1,this.clearDodged,{"persistent":true});
         this.self.endAttack();
      }
   }
}

