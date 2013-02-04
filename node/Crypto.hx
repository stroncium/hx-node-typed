package node;

private typedef CredentialsDetails{
  pfx:Dynamic, // String/Buffer holding the PFX or PKCS12 encoded private key, certificate and CA certificates
  key:String, // A string holding the PEM encoded private key
  passphrase:String, // A string of passphrase for the private key or pfx
  cert:String, // A string holding the PEM encoded certificate
  ca:Array<String>, // list of strings of PEM encoded CA certificates to trust.
  crl:Array<String>, // list of strings of PEM encoded CRLs (Certificate Revocation List)
  ciphers:String, // SSL cipher list
}

extern class Credentials{}

class Crypto{
  public function createCredentials(details:CredentialsDetails):Credentials;
  public function createHash(algorithm):Hash;
  public function createHmac(algorithm, key):Hmac;

  @overload(function (algorithm:String, password:Buffer):Cipher{})
  public function createCipher(algorithm:String, password:String):Cipher;

  public function createCipheriv(algorithm, key, iv)
  public function createDecipher(algorithm, password)
  public function createDecipheriv(algorithm, key, iv)
  public function createSign(algorithm):Signer;
  public function createVerify(algorithm):Verify;
  public function createDiffieHellman(prime_length):DiffieHellman;
  public function createDiffieHellman(prime, [encoding]):DiffieHellman;
  public function getDiffieHellman(group_name)
  public function pbkdf2(password, salt, iterations, keylen, callback)

  @overload(function(size:Int):Buffer{})
  public function randomBytes(size, cb:Dynamic->Buffer->Void):Void
}

@:fakeEnum(String) enum DigestEncoding{
  hex;
  binary;
  base64;
}
extern class Hash{
  @overload(function(data:String, encoding:String = 'utf8'):Void{})
  public function update(data:String, ?encoding:String):Void;
  public function digest(encoding:DigesetEncoding):String;
}

extern class Hmac{
  public function update(data:String):Void
  public function digest(?encoding:DigestEncoding):String;
}


extern class Cipher{
  public function update(data, [input_encoding], [output_encoding])
  public function final([output_enco3ding])
  public function setAutoPadding(auto_padding=true)
}

extern class Decipher{
  public function update(data, [input_encoding], [output_encoding])
  public function final([output_encoding])
  public function setAutoPadding(auto_padding=true)
}

extern class Signer{
  public function update(data)
  public function sign(private_key, [output_format])
}

extern class Verify{
  public function update(data)
  public function verify(object, signature, [signature_format])
}

extern class DiffieHellman{
  public function generateKeys([encoding])
  public function computeSecret(other_public_key, [input_encoding], [output_encoding])
  public function getPrime([encoding])
  public function getGenerator([encoding])
  public function getPublicKey([encoding])
  public function getPrivateKey([encoding])
  public function setPublicKey(public_key, [encoding])
  public function setPrivateKey(public_key, [encoding])
}
