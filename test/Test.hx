import node.Fs;

class Test implements async.Build{

  @async static function goAsync(){
    async(list = Fs.readdir('.'));
    trace(list);
    async(text = Fs.readFile('text', 'utf8'));
    trace(text);

  }
  public static function main(){
    goAsync(afterAsync);
  }

  static function afterAsync(error){
    if(error == null){
      trace('success');
    }
    else{
      trace('error: '+error);
    }
  }
}
