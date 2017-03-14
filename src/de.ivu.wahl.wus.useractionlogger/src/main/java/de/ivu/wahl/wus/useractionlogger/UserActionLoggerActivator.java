package de.ivu.wahl.wus.useractionlogger;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.eclipse.core.runtime.Plugin;
import org.osgi.framework.BundleContext;

public class UserActionLoggerActivator extends Plugin {

  // The plug-in ID
  public static final String PLUGIN_ID = "de.ivu.wahl.wus.foundation";
  /**
   * system property specifying the log file.
   */
  private static final String DE_IVU_WAHL_USER_ACTION_LOGFILE = "de.ivu.wahl.wus.user.action.logfile";

  // private static final String DE_IVU_WAHL_USER_ACTION_SHA_LOGFILE =
  // "de.ivu.wahl.wus.user.action.sha.logfile";

  protected org.apache.log4j.Logger getLogger() {
    return org.apache.log4j.Logger.getLogger(this.getClass());
  }

  // The shared instance
  private static UserActionLoggerActivator plugin;

  /**
   * The constructor
   */
  public UserActionLoggerActivator() {
    super();
  }

  /*
   * (non-Javadoc)
   * @see org.eclipse.core.runtime.Plugins#start(org.osgi.framework.BundleContext)
   */
  @Override
  public void start(final BundleContext context) throws Exception {
    super.start(context);
    initLogging(getStateLocation().toFile());
    plugin = this;
  }

  /*
   * (non-Javadoc)
   * @see org.eclipse.core.runtime.Plugin#stop(org.osgi.framework.BundleContext)
   */
  @Override
  public void stop(final BundleContext context) throws Exception {
    plugin = null;
    super.stop(context);
  }

  /**
   * Returns the shared instance
   * 
   * @return the shared instance
   */
  public static UserActionLoggerActivator getDefault() {
    return plugin;
  }

  public void initLogging(final File baseDir) {
    final InputStream in = getClass().getResourceAsStream("log4j.properties"); //$NON-NLS-1$
    if (null == in) {
      throw new IllegalStateException("Failed to read logging config!"); //$NON-NLS-1$
    }

    final Properties log4jProperties = new Properties();
    try {
      log4jProperties.load(in);
    } catch (final IOException e) {
      throw new IllegalStateException("Failed to read logging config!", e); //$NON-NLS-1$
    }

    final String userActionLogFile = System.getProperty(DE_IVU_WAHL_USER_ACTION_LOGFILE, new File(
        baseDir, "UserAction.log").getAbsolutePath()); //$NON-NLS-1$
    final String userActionSHALogFile = System.getProperty(DE_IVU_WAHL_USER_ACTION_LOGFILE,
        new File(baseDir, "UserActionSHA.log").getAbsolutePath()); //$NON-NLS-1$
    getLogger().info("UserAction log file location: " + userActionLogFile); //$NON-NLS-1$
    getLogger().info("UserAction SHA log file location: " + userActionSHALogFile); //$NON-NLS-1$
    log4jProperties.put("log4j.appender.UserActionLOG.File", userActionLogFile); //$NON-NLS-1$
    log4jProperties.put("log4j.appender.UserActionSHALOG.File", userActionSHALogFile); //$NON-NLS-1$

    org.apache.log4j.PropertyConfigurator.configure(log4jProperties);
    getLogger().info("Logging initialized."); //$NON-NLS-1$

  }
}
