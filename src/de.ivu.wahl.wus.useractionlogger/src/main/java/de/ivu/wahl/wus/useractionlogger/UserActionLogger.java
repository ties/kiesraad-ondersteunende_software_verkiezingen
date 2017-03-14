package de.ivu.wahl.wus.useractionlogger;

import java.security.Principal;

import org.apache.commons.codec.digest.DigestUtils;

import de.ivu.wahl.wus.loggerinterface.IUserActionLogger;

/**
 * logs users actions write log message into two loggers containing: USER_ACTION_LOGGER:
 * "hashCode(<userName> + " - " + <logMessage>) - <UserName> - <logMessage> USER_ACTION_SHA_LOGGER:
 * <UserName> - hashCode(<userName> + " - " + <logMessage>)
 * 
 * @author msc
 * @author tdu
 */
public class UserActionLogger implements IUserActionLogger {

  public UserActionLogger() {
  }

  private static final String SEPERATOR = " - ";
  private static final org.apache.log4j.Logger USER_ACTION_LOGGER = org.apache.log4j.Logger.getLogger("UserActionLOG");
  private static final org.apache.log4j.Logger USER_ACTION_SHA_LOGGER = org.apache.log4j.Logger.getLogger("UserActionSHALOG");
  private static final String LAST_SHA_HASH_CODE = "LastSHAHashCode";

  // private static Principal UNKNOWN = new Principal() {
  //
  // public String getName() {
  // return "UNKNOWN";
  // }
  // };

  public void logInfo(final Object message) {
    info(null, message);
  }

  public static void info(final Object message) {
    info(null, message);
  }

  public static void info(final Principal principal, final Object message) {

    String logPrincipal = "";
    if (principal != null && principal.getName() != null) {
      logPrincipal = principal.getName() + SEPERATOR;
    }
    if (message != null) {
      final String messageString = message.toString();
      final StringBuilder logMessages = new StringBuilder(messageString.length()
          + logPrincipal.length() + SEPERATOR.length());
      logMessages.append(logPrincipal);
      logMessages.append(messageString);

      final String principalLogMessageString = logMessages.toString();

      // OSVI-580
      final String shaHash = DigestUtils.shaHex(getLastHashCode() + principalLogMessageString);
      setLastHashCode(shaHash);
      final StringBuilder finalLogBuilder = new StringBuilder(shaHash.length() + SEPERATOR.length()
          + principalLogMessageString.length());
      finalLogBuilder.append(shaHash);
      finalLogBuilder.append(SEPERATOR);
      finalLogBuilder.append(principalLogMessageString);
      USER_ACTION_LOGGER.info(finalLogBuilder.toString());

      // no builder needed since short strings only
      USER_ACTION_SHA_LOGGER.info(logPrincipal + shaHash);
    }
  }

  private static String getLastHashCode() {
    String result = UserActionLoggerActivator.getDefault()
        .getPluginPreferences()
        .getString(LAST_SHA_HASH_CODE);
    if (result == null) {
      result = "";
    }
    return result;
  }

  private static void setLastHashCode(final String hashCode) {
    UserActionLoggerActivator.getDefault().getPluginPreferences().setValue(LAST_SHA_HASH_CODE,
        hashCode);
    UserActionLoggerActivator.getDefault().savePluginPreferences();
  }

}
