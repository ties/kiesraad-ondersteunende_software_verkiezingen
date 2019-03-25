/*
 * BasicGebiet_GebietDBA
 * 
 * WARNING! Automatically generated file! Do not edit!
 * Code Generator by IVU
 * Definition Version: $Id: tablegen.properties,v 1.36 2009/10/12 09:33:21 jon Exp $
 */

package de.ivu.wahl.modell.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;

import org.apache.log4j.Category;

import de.ivu.util.debug.Log4J;
import de.ivu.ejb.fw.DBABase;


/**
  * Implementation of the persistency layer for the entity Gebiet_Gebiet.
  * Contains all SQL access functions.
  *
  * @author D. Cosic  (c) 2003-2016 Statistisches Bundesamt und IVU Traffic Technologies AG
  * @version $Id: tablegen.properties,v 1.36 2009/10/12 09:33:21 jon Exp $
  */
public abstract class BasicGebiet_GebietDBA extends DBABase {
   private static final Category LOGGER = Log4J.configure(BasicGebiet_GebietDBA.class);
   static {
      LOGGER.info(Log4J.dumpVersion(BasicGebiet_GebietDBA.class, Log4J.extractVersion("$Revision: 1.36 $"))); //$NON-NLS-1$
   }

   public static final String TABLENAME = "Gebiet_Gebiet"; //$NON-NLS-1$
   public static final String ID_ELTERNGEBIET = "ID_Elterngebiet"; //$NON-NLS-1$
   public static final String ID_ELTERNGEBIET_QUAL = "Gebiet_Gebiet.ID_Elterngebiet"; //$NON-NLS-1$
   public static final String ID_UNTERGEBIET = "ID_Untergebiet"; //$NON-NLS-1$
   public static final String ID_UNTERGEBIET_QUAL = "Gebiet_Gebiet.ID_Untergebiet"; //$NON-NLS-1$

   private static final String[] COLUMNS = {ID_ELTERNGEBIET,ID_UNTERGEBIET};
   private static final MetaContainer META_CONTAINER = new MetaContainer(TABLENAME, COLUMNS);

   /**
     * Writes the data from a <code>ResultSet</code> to <code>Gebiet_GebietModelImpl</code> object.
     *
     * @param r the ResultSet with the data
     * @param m the object to be filled
     * @throws SQLException Communication with database is failing
     */
   protected static void getFromResultSet (ResultSet r, Gebiet_GebietModelImpl m) throws SQLException {
      Integer idx;
      Map<String, Integer> columns = META_CONTAINER.getColumns();
      if ((idx = columns.get(ID_ELTERNGEBIET.toUpperCase())) != null) {
         m._id_Elterngebiet = r.getString(idx.intValue());
      }
      if ((idx = columns.get(ID_ELTERNGEBIET)) != null) {
         m._id_Elterngebiet = r.getString(idx.intValue());
      }
      if ((idx = columns.get(ID_UNTERGEBIET.toUpperCase())) != null) {
         m._id_Untergebiet = r.getString(idx.intValue());
      }
      if ((idx = columns.get(ID_UNTERGEBIET)) != null) {
         m._id_Untergebiet = r.getString(idx.intValue());
      }
   }

   /**
     * Writes the data from a <code>Gebiet_GebietModelImpl</code> object into a <code>PreparedStatement</code>.
     *
     * @param m Model object with the data
     * @param p PreparedStatement
     * @throws SQLException Communication with database is failing
     */
   protected static void putIntoPreparedStatement(Gebiet_GebietModelImpl m, PreparedStatement p) throws SQLException {
      int idx = 1;
      p.setQueryTimeout(QUERY_TIMEOUT);
      p.setString(idx++, m._id_Elterngebiet);
      p.setString(idx++, m._id_Untergebiet);
   }

   /**
     * Inserts or changes the data of the given object in the table Gebiet_Gebiet (generic)
     *
     * @param m Model object, which's current state has to be written into the database
     * @param query Query, which runs the operations
     * @return <code>true</code> if the object was written or changed successfully
     *         <code>false</code> otherwise
     * @throws SQLException Communication with database is failing
     */
   public static boolean insertOrUpdate (Gebiet_GebietModelImpl m, String query) throws SQLException {
      Connection con = connect();
      try {
         PreparedStatement prepstatement = con.prepareStatement(query);
         try {
            putIntoPreparedStatement(m, prepstatement);
            return calculateModificationSuccessStatus(prepstatement.executeUpdate());
         } finally {
            prepstatement.close();
         }
      } catch (SQLException se) {
         logError(LOGGER, se, query, convertModelToStringArray(m));
         throw se;
      } finally {
         release(con);
      }
   }

   /**
     * Writes the data from a <code>Gebiet_GebietModelImpl</code> object in <code>String[]</code> for diagnostical reasons.
     *
     * @param m Model object with the data
     * @return String[] with the data from the model object
     */
   protected static String[] convertModelToStringArray(Gebiet_GebietModelImpl m) {
      List<String> values = new ArrayList<String>();
      values.add(toString(m.getID_Elterngebiet()));
      values.add(toString(m.getID_Untergebiet()));
      return values.toArray(new String[values.size()]);
   }

   /**
     * Method returns the number of rows of the table Gebiet_Gebiet
     *
     * @return Number of rows
     * @throws SQLException Communication with database is failing
     */
   public static int count() throws SQLException {
      return count("select count(*) from " + TABLENAME); //$NON-NLS-1$
   }

   /**
     * Method returns the number of objects, which were limited by a WHERE-clause by the parameters 
     *
     * @param id_Elterngebiet searching condition
     * @param id_Untergebiet searching condition
     * @return Number of objects
     * @throws SQLException Communication with database is failing
     */
   public static int countByKey(String id_Elterngebiet, String id_Untergebiet) throws SQLException {
      return count(
         "select count(*) from " + TABLENAME + " where ID_Elterngebiet=? and ID_Untergebiet=?",  //$NON-NLS-1$ //$NON-NLS-2$
         new Object[]{id_Elterngebiet, id_Untergebiet});
   }

   /**
     * Query for the method retrieveByKey
     */
   final static String queryRetrieveByKey = 
      "select * from " + TABLENAME + " where ID_Elterngebiet=? and ID_Untergebiet=?"; //$NON-NLS-1$ //$NON-NLS-2$

   /**
     * Fills the first parameter by a WHERE-clause from other parameters.
     *
     * @param  m the object to be filled
     * @param id_Elterngebiet searching condition
     * @param id_Untergebiet searching condition
     * @return <code>true</code> if the row was found in the database, else <code>false</code>
     * @throws SQLException Communication with database is failing
     */
   public static boolean retrieveByKey(Gebiet_GebietModelImpl m, String id_Elterngebiet, String id_Untergebiet)
      throws SQLException {

      Connection con = connect();
      try {
         PreparedStatement prepstatement = con.prepareStatement(queryRetrieveByKey);
         try {
            prepstatement.setQueryTimeout(QUERY_TIMEOUT);
            prepstatement.setString(1, id_Elterngebiet);
            prepstatement.setString(2, id_Untergebiet);
            ResultSet r = prepstatement.executeQuery();
            try {
               if (r.next()) {
                  getFromResultSet(r, m);
                  return true;
               } else {
                  return false;
               }
            } finally {
               r.close ();
            }
         } finally {
            prepstatement.close();
         }
      } catch (SQLException se) {
         String[] values = new String[2];
         int idx = 0;
         values[idx++] = toString(id_Elterngebiet);
         values[idx++] = toString(id_Untergebiet);
         logError(LOGGER, se, queryRetrieveByKey, values);
         throw se;
      } finally {
         release(con);
      }
   }

   /**
     * Method retrieveAllIDs returns a {@link Collection} of Gebiet_Gebiet IDs
     *

     * @return a {@link Collection} of Gebiet_Gebiet IDs
     * @throws SQLException Communication with database is failing
     */
   public static Collection<String> retrieveAllIDs() throws SQLException {
      return retrieveIDs(
         "select ID_Elterngebiet, ID_Untergebiet from Gebiet_Gebiet",  //$NON-NLS-1$
         new Object[]{});
   }

   /**
     * Deletes from the table Gebiet_Gebiet by a from parameters builded WHERE-clause
     *
     * @param id_Elterngebiet searching condition
     * @param id_Untergebiet searching condition
     * @return <code>true</code> if the object was deleted successfully
     *         <code>false</code> otherwise
     * @throws SQLException Communication with database is failing
     */
   public static boolean deleteByKey(String id_Elterngebiet, String id_Untergebiet) throws SQLException {
      return delete(
         "delete from " + TABLENAME + " where ID_Elterngebiet=? and ID_Untergebiet=?", //$NON-NLS-1$ //$NON-NLS-2$
         new Object[]{id_Elterngebiet, id_Untergebiet});
   }

   /**
     * Inserts the given object into the database
     *
     * @param m the object Gebiet_GebietModelImplto be written 
     * @return <code>true</code> if the object was written successfully
     *         <code>false</code> otherwise
     * @throws SQLException Communication with database is failing
     */
   public static boolean insert (Gebiet_GebietModelImpl m) throws SQLException {
      if (m != null) {
         return insertOrUpdate(m, 
            "insert into " + TABLENAME + " (" + META_CONTAINER.getPropertyList() + ") " +  //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
            "values (" + META_CONTAINER.getValuesWildCards() + ")"); //$NON-NLS-1$ //$NON-NLS-2$
      } else {
         return true;
      }
   }

   /**
     * Gets a {@link Collection} of IDs from Untergebiet-entities, which is described by
     * N:M relation Gebiet_Gebiet and ID_Elterngebiet.
     *
     * @param id_Elterngebiet searching condition

     * @return a {@link Collection} of Untergebiet IDs
     * @throws SQLException Communication with database is failing
     */
   public static Collection<String> retrieveIDsByID_Elterngebiet(String id_Elterngebiet)
      throws SQLException {

      return retrieveIDs(
         "select ID_Untergebiet from " + TABLENAME + " where ID_Elterngebiet=?",  //$NON-NLS-1$
          //$NON-NLS-1$
         new Object[]{id_Elterngebiet});
   }

   /**
     * Gets a {@link Collection} of IDs from Elterngebiet-entities, which is described by
     * N:M relation Gebiet_Gebiet and ID_Untergebiet.
     *
     * @param id_Untergebiet searching condition

     * @return a {@link Collection} of Elterngebiet IDs
     * @throws SQLException Communication with database is failing
     */
   public static Collection<String> retrieveIDsByID_Untergebiet(String id_Untergebiet)
      throws SQLException {

      return retrieveIDs(
         "select ID_Elterngebiet from " + TABLENAME + " where ID_Untergebiet=?",  //$NON-NLS-1$
          //$NON-NLS-1$
         new Object[]{id_Untergebiet});
   }
}
