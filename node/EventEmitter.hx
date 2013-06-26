package node;

/*
   emits: newListener
 */
extern class EventEmitter{
  public function addListener(event:String,fn:Dynamic):Void;
  public function on(event:String, fn:Dynamic):Void;
  public function once(event:String,fn:Dynamic):Void;
  public function removeListener(event:String,listener:Dynamic):Void;
  public function removeAllListeners(event:String):Void;
  public function listeners(event:String):Array<Dynamic>;
  public function setMaxListeners(m:Int):Void;
  public function emit(event:String,?arg1:Dynamic,?arg2:Dynamic,?arg3:Dynamic, ?arg4:Dynamic):Void;
}
