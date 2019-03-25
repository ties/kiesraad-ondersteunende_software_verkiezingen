/*
 * PasswordService
 * 
 * Created on 09.10.2017
 * Copyright (c) 2017 IVU Traffic Technologies AG
 */
package de.ivu.wahl;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Random;

import org.apache.log4j.Category;
import org.bouncycastle.crypto.generators.SCrypt;
import org.bouncycastle.util.encoders.Base64;

import de.ivu.util.debug.Log4J;

/**
 * 
 */
public class PasswordService {

  private static final String DEFAULT_CHAR_SET = "UTF-8"; //$NON-NLS-1$

  public static void main(String[] args) {
    String salt = PasswordService.INSTANCE.getSalt();
    String password = "password!"; //$NON-NLS-1$
    PasswordService.INSTANCE.calcHash(password, salt);
  }

  private final static Category LOGGER = Log4J.configure(PasswordService.class);

  public static PasswordService INSTANCE = new PasswordService();

  private PasswordService() {
  }

  /**
   * References:
   * <ul>
   * <li>
   * https://howtodoinjava.com/security/how-to-generate-secure-password-hash-md5-sha-pbkdf2-bcrypt
   * -examples/</li>
   * <li>https://en.wikipedia.org/wiki/Scrypt</li>
   * <li>https://www.bouncycastle.org/docs/docs1.5on/org/bouncycastle/crypto/generators/SCrypt.html</li>
   * <li>https://tools.ietf.org/html/rfc7914</li>
   * </ul>
   * 
   * @param plainText Klartext-Eingabe
   * @return Passwort-Hash als String-Repraesentation
   */
  public String calcHash(String plainText, String salt) {

    int memoryCostParameter = 8192;
    int blockSize = 4;
    int parallelizationParameter = 8;
    int keyLength = 64;

    byte[] plainTextAsBytes = stringToBytes(plainText);
    byte[] saltAsBytes = stringToBytes(salt);

    long start = System.currentTimeMillis();
    LOGGER.info("Calculating SCrypt hashcode ..."); //$NON-NLS-1$
    byte[] result = SCrypt.generate(plainTextAsBytes,
        saltAsBytes,
        memoryCostParameter,
        blockSize,
        parallelizationParameter,
        keyLength);
    LOGGER.info("Calculation of SCrypt hashcode took " + (System.currentTimeMillis() - start) //$NON-NLS-1$
        + " ms, hashcode: " + truncate(bytesToString(result), 4) + ", salt = " + truncate(salt, 4)); //$NON-NLS-1$ //$NON-NLS-2$
    return bytesToString(result);
  }

  private String truncate(String original, int maxLength) {
    if (original == null || original.length() <= maxLength) {
      return original;
    }
    return original.substring(0, maxLength) + "..."; //$NON-NLS-1$
  }

  /**
   * Note: This is NOT reverse to #stringToBytes.
   * 
   * @param bytes
   * @return base64-String-Repraesentation of the bytes (i.e. uses only a-zA-Z0-9+/)
   */
  private String bytesToString(byte[] bytes) {
    return Base64.toBase64String(bytes);
  }

  /**
   * Note: This is NOT reverse to #bytesToString.
   * 
   * @param string
   * @return Bytes-Repraesentation of any Unicode String
   */
  private byte[] stringToBytes(String string) {
    try {
      return string.getBytes(DEFAULT_CHAR_SET);
    } catch (UnsupportedEncodingException e) {
      e.printStackTrace();
      return string.getBytes();
    }
  }

  private static MessageDigest getDigest(MessageDigest md, String digestMethod) {
    if (md != null) {
      return md;
    }
    try {
      MessageDigest result = MessageDigest.getInstance(digestMethod);
      LOGGER.error("Digest method found: " + digestMethod); //$NON-NLS-1$
      return result;
    } catch (NoSuchAlgorithmException nsae) {
      LOGGER.error("Digest method not found: " + digestMethod); //$NON-NLS-1$
      LOGGER.error(nsae);
      return null;
    }
  }

  private byte[] getSaltAsBytes() {
    try {
      SecureRandom sr = SecureRandom.getInstance("SHA1PRNG"); //$NON-NLS-1$
      byte[] salt = new byte[16];
      sr.nextBytes(salt);
      return salt;
    } catch (NoSuchAlgorithmException e) {
      // Should never happen
      LOGGER.error("Unable to generate salt using SHA1PRNG. Using Random.nextInt() instead."); //$NON-NLS-1$
      int randomInt = new Random().nextInt(1000000000);
      return BigInteger.valueOf(randomInt).toByteArray();
    }
  }

  public String getSalt() {
    byte[] salt = getSaltAsBytes();
    return bytesToString(salt);
  }
}
