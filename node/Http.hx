package node;
import node.HaxeInit;
import node.EventEmitter;
import node.stream.ReadableImpl;
import node.stream.WritableImpl;

private typedef RequestOptions = {
  ?host:String,
  ?hostname:String,
  ?port:Int,
  ?localAddress:Dynamic, //TODO
  ?socketPath:Dynamic,//TODO
  ?method:String,
  ?path:String,
  ?headers:Dynamic,
  ?auth:String,
  ?agent:Dynamic, //TODO
};

extern class Http{
  static function __init__():Void{
    untyped Http = InitTools.require('http');
  }

  public static var STATUS_CODES:Array<String>;
  public static var globalAgent:Agent;
  public static function createServer(listener:ServerRequest->ServerResponse->Void):Server;

  // @:overload(function(options:String, cb:ClientResponse->Void):ClientRequest{})
  public static function request(options:RequestOptions, cb:ClientResponse->Void):ClientRequest;

  // @:overload(function(options:String, cb:ClientResponse->Void):ClientRequest{})
  public static function get(options:RequestOptions, cb:ClientResponse->Void):ClientRequest;



}
//~ enum ServerEvent{
  //~ Request;
  //~ Connection;
  //~ Close;
  //~ CheckContinue;
  //~ Connect;
  //~ Upgrade;
  //~ ClientError;
//~ }
extern class Server extends EventEmitter{
  @:overload(function(port:Int, ?hostname:String, ?backlog:Int, ?cb:Void->Void):Void{})
  @:overload(function(path:String, cb:Void->Void):Void{})
  @:overload(function(handle:Dynamic, ?cb:Void->Void):Void{})
  public function listen(port:Int, hostname:String, ?cb:Void->Void):Void; //TODO

  public function close(?cb:Void->Void):Void;
  public var maxHeadersCount:Int;
}

//~ enum ServerRequestEvent{
  //~ Data;
  //~ End;
  //~ Close;
//~ }
extern class ServerRequest extends ReadableImpl{
  public var method(default,null):String;
  public var url(default, null):String;
  public var headers:Dynamic;
  public var trailers(default, null):Dynamic; //TODO
  public var httpVersion(default, null):String;
  // public function pause():Void;
  // public function resume():Void;
  public var connection:node.net.Socket;
  public var postData:Dynamic;
  public var postFiles:Dynamic;


  public function setTimeout(msec:Int):Void;

}

//~ @:native('node.Http.ServerResponseEvent')
//~ enum ServerResponseEvent{
  //~ Close;
//~ }
extern class ServerResponse extends WritableImpl{
  public var statusCode:Int;
  public var sendDate:Bool;
  public function writeContinue():Void;
  @:overload(function (statusCode:Int, reasonPhrase:String, ?headers:Dynamic):Void{})
  public function writeHead(statusCode:Int, ?headers:Dynamic):Void;
  public function setHeader(name:String, value:String):Void;
  public function getHeader(name:String):String;
  public function removeHeader(name:String):Void;
  // @:overload(function (chunk:Buffer, ?encoding:String = 'utf8'):Void{})
  // public function write(chunk:String):Void;
  public function addTrailers(headers:Dynamic):Void;
  @:overload(function(data:Buffer, ?encoding:String = 'utf8'):Void{})
  @:overload(function(data:String):Void{})
  // public function end(?data:String):Void;
}

extern class Agent{
  public var maxSockets:Int;
  public var sockets:Array<node.net.Socket>;
  public var requests:Array<ClientRequest>;
}

//~ enum ClientRequestEvent{
  //~ Response;
  //~ Socket;
  //~ Connect;
  //~ Upgrade;
  //~ Continue;
//~ }
extern class ClientRequest extends WritableImpl{
  // @:overload(function (chunk:String, ?encoding:String = 'utf8'):Void{})
  // public function write(chunk:Buffer):Void;

  // @:overload(function(data:String, ?encoding:String = 'utf8'):Void{})
  // @:overload(function(data:Buffer):Void{})
  // public function end():Void;

  public function abort():Void;
  public function setTimeout(timeout:Int, cb:Void->Void):Void;
  public function setNoDelay(?noDelay:Bool = true):Void;
  public function setSocketKeepAlive(?enable:Bool = false ?initialDelay:Int = 0):Void;
}

//~ enum ClientResponseEvent{
  //~ data;
  //~ end;
  //~ close;
//~ }
extern class ClientResponse extends node.stream.ReadableImpl{
  public var statusCode:Int;
  public var httpVersion:String;
  public var headers:Dynamic;
  public var trailers:Dynamic;
  // public function pause():Void;
  // public function resume():Void;
}
