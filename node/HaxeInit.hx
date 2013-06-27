package node;
@:keep extern class HaxeInit{
  static function __init__():Void{
    untyped __js__("var node = node || {}");
  }

  public static inline function require(name:String):Dynamic
    return untyped __js__('require')(name);
}
