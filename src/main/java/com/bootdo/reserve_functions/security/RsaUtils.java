package com.bootdo.reserve_functions.security;


import org.apache.commons.codec.binary.Base64;

import javax.crypto.Cipher;
import java.security.*;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;

/**
 * @author wushiqiang
 * @date Created in 11:05 2022/11/8
 * RsaUtils.decryptByPrivateKey(password)
 */
public class RsaUtils {

	// Rsa 私钥
	public static String privateKey = "MIICeAIBADANBgkqhkiG9w0BAQEFAASCAmIwggJeAgEAAoGBANnNURVJgnhsioax9LOkOm3vYrgpMD1lYQvgQq0Lz2hvSTn4d/a4ShHh9hReHPmq1++wu7U3lQ25n9Wb0RppCxNtxEoI40IofGlSBmvb4aPhJkfoJwSPbHQGnUPv+LRdQTEebqKOIwds/fDwI3/FG0SENuWkmVxIjRzAe7mEvHbdAgMBAAECgYEA0jfYdfpggokI317tt2Hgv3EZUHT4yZmLJKJM2KcYhk07WUeXyjsvyrjVAe2ge93I0+E6G3vNUtUCD3N4TMxsUYl9ZMjsOeIzHZF4ZlD2JrlhRFj7dX9DVUmXtOK1odQrQLEHQjWRqumYsF96DYvIGs9gVidE6Q16gYM2M7T6IeECQQDue21DQ5cZuWt6GKc3yOoaEZ2GorC0/3SNzZLZtWdM86UIv9zLu4o0vBxgYzvxTHkhh2nrTE4u2FSHz84/m4oVAkEA6c0B7mcAVzieJKNKPiXhTLI1YtMs69AW1xnVN8dqsosNPS/PQ0Cr3Z2ZQzj1MlyinfNmVyqYv7I4Z4WmXgPTqQJBAIh4KxNl107KM33AI9ihaY2XbPyBlvtMf+cxr4pT65Q2jMdP+8q+PB1nVBm4T7IKn/qW4f7bQJZAB0dcnFr75+0CQQCVVYCaSegJzfwU4seVEpTpbBp1WPUkWfF8yt9JlXItQGvgXR1Bk5kzIGq4aTUUSd8EjGcd3fNa3fbxCIjPHBqhAkAF7UrukfFPtWJ2xl2kKvCNLXsu39VM8mI6t6w07vsi/5ZDBnrkMlm8tRsLBgb+AEwwFRBfYmlBKnL2egb4ocfp";
	public static String publicKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDZzVEVSYJ4bIqGsfSzpDpt72K4KTA9ZWEL4EKtC89ob0k5+Hf2uEoR4fYUXhz5qtfvsLu1N5UNuZ/Vm9EaaQsTbcRKCONCKHxpUgZr2+Gj4SZH6CcEj2x0Bp1D7/i0XUExHm6ijiMHbP3w8CN/xRtEhDblpJlcSI0cwHu5hLx23QIDAQAB";

	/**
	 * 公钥加密私钥解密
	 */
	public static void test1(RsaKeyPair keyPair, String source) throws Exception {
		System.out.println("***************** 公钥加密私钥解密开始 *****************");
		String text1 = encryptByPublicKey(keyPair.getPublicKey(), source);
		String text2 = decryptByPrivateKey(keyPair.getPrivateKey(), text1);
		System.out.println("加密前：" + source);
		System.out.println("加密后：" + text1);
		System.out.println("解密后：" + text2);
		if (source.equals(text2)) {
			System.out.println("解密字符串和原始字符串一致，解密成功");
		} else {
			System.out.println("解密字符串和原始字符串不一致，解密失败");
		}
		System.out.println("***************** 公钥加密私钥解密结束 *****************");
//		RsaKeyPair rsaKeyPair = generateKeyPair();
//		System.out.println(JSONUtil.toJsonPrettyStr(rsaKeyPair));
	}

	public static void main(String[] args) throws Exception {
		RsaKeyPair rsaKeyPair = new RsaKeyPair(publicKey, privateKey);
		test1(rsaKeyPair, "123");

	}

	/**
	 * 私钥解密
	 *
	 * @param text 待解密的文本
	 * @return 解密后的文本
	 */
	public static String decryptByPrivateKey(String text) throws Exception {
		return decryptByPrivateKey(privateKey, text);
	}

	/**
	 * 公钥解密
	 *
	 * @param publicKeyString 公钥
	 * @param text            待解密的信息
	 * @return 解密后的文本
	 */
	public static String decryptByPublicKey(String publicKeyString, String text) throws Exception {
		X509EncodedKeySpec x509EncodedKeySpec = new X509EncodedKeySpec(Base64.decodeBase64(publicKeyString));
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
		PublicKey publicKey = keyFactory.generatePublic(x509EncodedKeySpec);
		Cipher cipher = Cipher.getInstance("RSA");
		cipher.init(Cipher.DECRYPT_MODE, publicKey);
		byte[] result = cipher.doFinal(Base64.decodeBase64(text));
		return new String(result);
	}

	/**
	 * 私钥加密
	 *
	 * @param privateKeyString 私钥
	 * @param text             待加密的信息
	 * @return 加密后的文本
	 */
	public static String encryptByPrivateKey(String privateKeyString, String text) throws Exception {
		PKCS8EncodedKeySpec pkcs8EncodedKeySpec = new PKCS8EncodedKeySpec(Base64.decodeBase64(privateKeyString));
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
		PrivateKey privateKey = keyFactory.generatePrivate(pkcs8EncodedKeySpec);
		Cipher cipher = Cipher.getInstance("RSA");
		cipher.init(Cipher.ENCRYPT_MODE, privateKey);
		byte[] result = cipher.doFinal(text.getBytes());
		return Base64.encodeBase64String(result);
	}

	/**
	 * 私钥解密
	 *
	 * @param privateKeyString 私钥
	 * @param text             待解密的文本
	 * @return 解密后的文本
	 */
	public static String decryptByPrivateKey(String privateKeyString, String text) throws Exception {
		PKCS8EncodedKeySpec pkcs8EncodedKeySpec5 = new PKCS8EncodedKeySpec(Base64.decodeBase64(privateKeyString));
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
		PrivateKey privateKey = keyFactory.generatePrivate(pkcs8EncodedKeySpec5);
		Cipher cipher = Cipher.getInstance("RSA");
		cipher.init(Cipher.DECRYPT_MODE, privateKey);
		byte[] result = cipher.doFinal(Base64.decodeBase64(text));
		return new String(result);
	}

	/**
	 * 公钥加密
	 *
	 * @param publicKeyString 公钥
	 * @param text            待加密的文本
	 * @return 加密后的文本
	 */
	public static String encryptByPublicKey(String publicKeyString, String text) throws Exception {
		X509EncodedKeySpec x509EncodedKeySpec2 = new X509EncodedKeySpec(Base64.decodeBase64(publicKeyString));
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
		PublicKey publicKey = keyFactory.generatePublic(x509EncodedKeySpec2);
		Cipher cipher = Cipher.getInstance("RSA");
		cipher.init(Cipher.ENCRYPT_MODE, publicKey);
		byte[] result = cipher.doFinal(text.getBytes());
		return Base64.encodeBase64String(result);
	}

	/**
	 * 构建RSA密钥对
	 *
	 * @return 生成后的公私钥信息
	 */
	public static RsaKeyPair generateKeyPair() throws NoSuchAlgorithmException {
		KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
		keyPairGenerator.initialize(1024);
		KeyPair keyPair = keyPairGenerator.generateKeyPair();
		RSAPublicKey rsaPublicKey = (RSAPublicKey) keyPair.getPublic();
		RSAPrivateKey rsaPrivateKey = (RSAPrivateKey) keyPair.getPrivate();
		String publicKeyString = Base64.encodeBase64String(rsaPublicKey.getEncoded());
		String privateKeyString = Base64.encodeBase64String(rsaPrivateKey.getEncoded());
		return new RsaKeyPair(publicKeyString, privateKeyString);
	}

	/**
	 * RSA密钥对对象
	 */
	public static class RsaKeyPair {
		private final String publicKey;
		private final String privateKey;

		public RsaKeyPair(String publicKey, String privateKey) {
			this.publicKey = publicKey;
			this.privateKey = privateKey;
		}

		public String getPublicKey() {
			return publicKey;
		}

		public String getPrivateKey() {
			return privateKey;
		}
	}


}
