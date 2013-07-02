package node;

class InitTools{
  public static inline function require(name:String):Dynamic
    return untyped __js__('require')(name);

  public static function blessClass(cl:Class<Dynamic>, ?sup:Class<Dynamic>, ?ifaces:Array<Class<Dynamic>>):Void untyped {
    cl.__name__ = true;
    cl.prototype.__class__ = cl;
    if(sup != null) cl.__super__ = sup;
    if(ifaces != null) cl.__interfaces__ = ifaces;
  }

  public static function blessInterface(iface:Class<Dynamic>):Void untyped{
    iface.__name__ = true;
  }
}