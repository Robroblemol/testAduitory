import javax.crypto.Cipher;
import java.security.Key;
import javax.crypto.spec.SecretKeySpec;
// import javax.xml.bind.DatatypeConverter;

class Crypter{
  String k = "ABC12345ABC12345"; // 128 bit key
  //String initVector = "ARandoInitVector"; // 16 bytes IV
  //IvParameterSpec iv_encode = null;
  //SecretKeySpec skeySpec_encode = null;
  //Cipher cipher_encode = null;

  Key ky = null;
  Cipher cipher = null;






  Crypter(){
    try{
      ky = new SecretKeySpec(k.getBytes(),"AES");
      cipher = Cipher.getInstance("AES");

      cipher.init(cipher.ENCRYPT_MODE,ky);


    }catch (Exception e){
      println("D'oh");
      e.printStackTrace();
    }
    // try{
    //   iv_encode =
    //     new IvParameterSpec(initVector.getBytes("UTF-8"));
    //   skeySpec_encode =
    //    new SecretKeySpec(k.getBytes("UTF-8"), "AES");
    //   //cipher_encode =
    //   //Cipher.getInstance("AES/ECB/PKCS5PADDING"); //AES-CBC with IV encoding, ECB is used without the IV, example shown on <a href="http://aesencryption.net/" target="_blank" rel="nofollow">http://aesencryption.net/</a>
    //   //cipher_encode.init
    //   //(Cipher.ENCRYPT_MODE, skeySpec_encode,iv_encode);
    // }catch (Exception e){
    //   println("D'oh");
    //   e.printStackTrace();
    // }
  }
  String logEncrypter(String log){
    try{
      byte[] encrypted = cipher.
      doFinal(log.getBytes());
      return new String(encrypted);
    }catch(Exception e){
      e.printStackTrace();
      return null;
    }
  }
}
