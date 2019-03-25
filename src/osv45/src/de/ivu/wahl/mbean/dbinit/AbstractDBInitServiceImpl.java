/*
 * DBInitServiceImpl
 * 
 * Created on 27.03.2009
 * Copyright (c) 2009 Statistisches Bundesamt und IVU Traffic Technologies AG
 */
package de.ivu.wahl.mbean.dbinit;

import static de.ivu.wahl.modell.impl.WahlDBA.TABLENAME;

import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.sql.DataSource;

import org.jboss.logging.Logger;

import de.ivu.ejb.EJBUtil;
import de.ivu.util.misc.CharacterStreamCopy;

/**
 * Database Initialisation
 * 
 * @author D. Cosic, IVU Traffic Technologies AG
 */
public abstract class AbstractDBInitServiceImpl implements DBInitService {
  private static final Logger LOGGER = Logger.getLogger(AbstractDBInitServiceImpl.class);

  private static final String JDBC_DERBY = "jdbc:derby:"; //$NON-NLS-1$
  private static final String CREATE_SCRIPT_DERBY = "create_db_derby.sql"; //$NON-NLS-1$
  private static final String CREATE_SCRIPT_MYSQL = "create_db_mysql.sql"; //$NON-NLS-1$

  @Override
  public void start() throws Exception {
    try {
      DataSource ds = (DataSource) EJBUtil.getInitialContext()
          .lookup("java:/jdbc/wahlDB-" + EJBUtil.getInstallationSpecificAffix()); //$NON-NLS-1$
      Connection connection = ds.getConnection();
      boolean isDerby = connection.getMetaData().getURL().startsWith(JDBC_DERBY);
      try {
        Statement statement = connection.createStatement();
        try {
          ResultSet resultSet = statement.executeQuery("select * from " + TABLENAME); //$NON-NLS-1$
          resultSet.close();
        } catch (Exception e) {
          // load database script
          StringWriter sw = new StringWriter();
          String scriptName = isDerby ? CREATE_SCRIPT_DERBY : CREATE_SCRIPT_MYSQL;
          Reader reader = new InputStreamReader(getClass().getClassLoader()
              .getResourceAsStream(scriptName));
          CharacterStreamCopy.copy(reader, sw);
          reader.close();
          sw.close();
          for (String line : sw.toString().split(";")) { //$NON-NLS-1$
            String lineOutput = line;
            int index = lineOutput.indexOf("derby.user.APP"); //$NON-NLS-1$
            if (index > 0) {
              lineOutput = line.substring(0, index) + "derby.user.APP', '<password>')"; //$NON-NLS-1$
            }
            LOGGER.info(lineOutput);
            statement.execute(line);
          }
          LOGGER.info("Database schema succesfully created"); //$NON-NLS-1$
        } finally {
          statement.close();
        }
      } catch (Exception e) {
        LOGGER.error(e, e);
      } finally {
        connection.close();
      }
    } catch (Exception e) {
      LOGGER.fatal(e);
    }
  }
}