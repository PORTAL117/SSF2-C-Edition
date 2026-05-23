package
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class GroundPointFinder
   {
      
      public function GroundPointFinder()
      {
         super();
      }
      
      private static function getCellAt(param1:Array, param2:int, param3:int) : *
      {
         if(param2 >= 0 && param3 >= 0 && param3 < param1.length && param2 < param1[param3].length)
         {
            return param1[param3][param2];
         }
         return null;
      }
      
      public static function findPoints(param1:Rectangle, param2:Number, param3:Number, param4:Number) : Vector.<Point>
      {
         var _loc5_:Array = new Array();
         var _loc6_:Number = 0;
         var _loc7_:Number = 0;
         var _loc8_:Number = 0;
         var _loc9_:Number = 0;
         var _loc10_:Number = 0;
         var _loc11_:Point = new Point();
         var _loc12_:Point = new Point();
         var _loc13_:Rectangle = param1;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:* = null;
         var _loc19_:Vector.<Point> = new Vector.<Point>();
         _loc7_ = _loc13_.y + param2 / 2;
         _loc16_ = 0;
         while(_loc7_ < _loc13_.y + _loc13_.height)
         {
            _loc5_.push(new Array());
            _loc6_ = _loc13_.x + param2 / 2;
            _loc17_ = 0;
            while(_loc6_ < _loc13_.x + _loc13_.width)
            {
               _loc14_ = SSF2API.hitTestGround(_loc6_,_loc7_);
               _loc5_[_loc16_].push(_loc14_);
               if(_loc14_ && getCellAt(_loc5_,_loc17_,_loc16_ - 1) !== _loc14_ && getCellAt(_loc5_,_loc17_ - 1,_loc16_) !== _loc14_)
               {
                  _loc9_ = 0;
                  while(_loc9_ < 200 && Boolean(_loc14_.hitTestPoint(_loc6_,_loc7_ - _loc9_)))
                  {
                     _loc9_++;
                  }
                  if(_loc9_ < 200 || _loc7_ - _loc9_ < param1.y)
                  {
                     _loc10_ = _loc9_;
                     _loc19_.push(new Point(_loc6_,_loc7_ - _loc9_));
                     _loc8_ = _loc6_ + SSF2API.randomInteger(param3,param4);
                     while(_loc8_ < _loc13_.x + _loc13_.width)
                     {
                        _loc9_ -= 100;
                        while(_loc9_ < 200 && !_loc14_.hitTestPoint(_loc8_,_loc7_ - _loc9_))
                        {
                           _loc9_++;
                        }
                        while(_loc9_ < 200 && Boolean(_loc14_.hitTestPoint(_loc8_,_loc7_ - _loc9_)))
                        {
                           _loc9_++;
                        }
                        if(_loc9_ < 200)
                        {
                           _loc19_.push(new Point(_loc8_,_loc7_ - _loc9_));
                        }
                        _loc9_ = _loc10_;
                        _loc8_ += SSF2API.randomInteger(param3,param4);
                     }
                  }
               }
               _loc6_ += param2;
               _loc17_++;
            }
            _loc7_ += param2;
            _loc16_++;
         }
         return _loc19_;
      }
      
      private static function printGrid(param1:Array) : void
      {
         var _loc4_:int = 0;
         var _loc2_:* = "";
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = 0;
            while(_loc4_ < param1.length)
            {
               _loc2_ += param1[_loc3_][_loc4_] ? 1 : 0;
               _loc4_++;
            }
            _loc2_ += "\r\n";
            _loc3_++;
         }
         SSF2API.print(_loc2_);
      }
   }
}

