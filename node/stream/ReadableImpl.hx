package node.stream;

extern class ReadableImpl extends node.EventEmitter<String>, implements Readable{
  public function hasEventData():Void;
  public function hasEventEnd():Void;
  public function hasEventError():Void;
  public function hasEventClose():Void;

  public var readable:Bool;
  public function setEncoding(encoding:String):Void;
  public function pipe(dst:node.WritableStream, ?options:Dynamic):Void;
  public function pause():Void;
  public function resume():Void;
  public function destroy():Void;
}
