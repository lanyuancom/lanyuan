package test;



import java.security.MessageDigest;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.SecretKeySpec;

public class md5 {

	public String getMD5ofStr(String str){
		return this.getMD5ofStr(str,"utf-8");
	}
	
	public String getMD5ofStr(String str, String encode) {
		try{
		MessageDigest md5 = MessageDigest.getInstance("MD5");
		md5.update(str.getBytes(encode));
		byte[] digest = md5.digest();

		StringBuffer hexString = new StringBuffer();
		String strTemp;
		for (int i = 0; i < digest.length; i++) {
			// byteVar &
			// 0x000000FF的作用是，如果digest[i]是负数，则会清除前面24个零，正的byte整型不受影响。
			// (...) | 0xFFFFFF00的作用是，如果digest[i]是正数，则置前24位为一，
			// 这样toHexString输出一个小于等于15的byte整型的十六进制时，倒数第二位为零且不会被丢弃，这样可以通过substring方法进行截取最后两位即可。
			strTemp = Integer.toHexString(
					(digest[i] & 0x000000FF) | 0xFFFFFF00).substring(6);
			hexString.append(strTemp);
		}
			return hexString.toString();
		}catch(Exception e){
			e.printStackTrace();
			return "";
		}

	}


}
