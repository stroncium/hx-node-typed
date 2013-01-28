package node.stream;

interface WritableImpl extends node.EventEmitter<String>, implements Writable{
  public function hasEventDrain():Void;
  public function hasEventError():Void;
  public function hasEventClose():Void;
  public function hasEventPipe():Void;

  public var writable:Bool;
  public function setEncoding(encoding:String):Void;
  public function destroy():Void;
  public function destroySoon():Void;
  public function write(data:Dynamic, ?encoding:String):Void;
  public function end(?data:Dynamic, ?encoding:String):Void;
}
