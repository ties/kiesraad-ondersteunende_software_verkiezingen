package de.ivu.wahl.modell.ejb;

/**
 * ListenkandidaturErgebnisBean
 *
 * @author D. Cosic  (c) 2003-7 Statistisches Bundesamt und IVU Traffic Technologies AG

 */

import static de.ivu.ejb.fw.DBABase.retrieveIDs;

import java.sql.SQLException;
import java.util.Collection;

import javax.ejb.FinderException;

import de.ivu.ejb.IVUFinderException;
import de.ivu.wahl.modell.impl.ListenkandidaturDBA;
import de.ivu.wahl.modell.impl.ListenkandidaturErgebnisDBA;

public class ListenkandidaturErgebnisBean extends BasicListenkandidaturErgebnisBean {
  private static final long serialVersionUID = 1989508301869923292L;

  /**
   * Find list candidature results by result and list candidature
   * 
   * @param id_Ergebniseingang
   * @param id_Listenkandidatur
   * @return
   * @throws IVUFinderException
   */
  public String ejbFindByErgebniseingangAndListenkandidatur(String id_Ergebniseingang,
      String id_Listenkandidatur) throws FinderException {
    try {
      String query = "select " + ListenkandidaturErgebnisDBA.ID_LISTENKANDIDATURERGEBNIS_QUAL //$NON-NLS-1$
          + " from " + ListenkandidaturErgebnisDBA.TABLENAME + " where " //$NON-NLS-1$ //$NON-NLS-2$
          + ListenkandidaturErgebnisDBA.ID_ERGEBNISEINGANG_QUAL + " = ? and " //$NON-NLS-1$
          + ListenkandidaturErgebnisDBA.ID_LISTENKANDIDATUR_QUAL + " = ?"; //$NON-NLS-1$
      return findSingle(retrieveIDs(query, new Object[]{id_Ergebniseingang, id_Listenkandidatur}));
    } catch (SQLException se) {
      throw new IVUFinderException(se.getMessage(), se);
    }
  }

  /**
   * Find all list candidatures results filtered by selected and ordered by list position
   * 
   * @param id_Ergebniseingang
   * @return
   * @throws FinderException
   */
  public Collection<String> ejbFindAllByErgebniseingangAndGewaehlt(String id_Ergebniseingang)
      throws FinderException {

    try {
      String query = "select " + ListenkandidaturErgebnisDBA.ID_LISTENKANDIDATURERGEBNIS_QUAL //$NON-NLS-1$
          + " from " + ListenkandidaturErgebnisDBA.TABLENAME + " where " //$NON-NLS-1$ //$NON-NLS-2$
          + ListenkandidaturErgebnisDBA.ID_ERGEBNISEINGANG_QUAL + " = ? and " //$NON-NLS-1$
          + ListenkandidaturErgebnisDBA.GEWAEHLT_QUAL + " = 1" + " order by " //$NON-NLS-1$ //$NON-NLS-2$
          + ListenkandidaturErgebnisDBA.LISTENPLATZ_QUAL;
      return retrieveIDs(query, new Object[]{id_Ergebniseingang});
    } catch (SQLException se) {
      throw new IVUFinderException(se.getMessage(), se);
    }
  }

  /**
   * Find all list candidature results by result and list
   * 
   * @param id_Ergebniseingang
   * @param id_Liste
   * @return
   * @throws FinderException
   */
  public Collection<String> ejbFindAllByErgebniseingangAndListe(String id_Ergebniseingang,
      String id_Liste) throws FinderException {

    try {
      String query = "select " + ListenkandidaturErgebnisDBA.ID_LISTENKANDIDATURERGEBNIS + " from " //$NON-NLS-1$ //$NON-NLS-2$
          + ListenkandidaturErgebnisDBA.TABLENAME + " lke, " + ListenkandidaturDBA.TABLENAME //$NON-NLS-1$
          + " lk " + " where lke." + ListenkandidaturErgebnisDBA.ID_LISTENKANDIDATUR + "=lk." //$NON-NLS-1$//$NON-NLS-2$ //$NON-NLS-3$
          + ListenkandidaturDBA.ID_LISTENKANDIDATUR + " and lk." + ListenkandidaturDBA.ID_LISTE //$NON-NLS-1$
          + "=?" + " and " + ListenkandidaturErgebnisDBA.ID_ERGEBNISEINGANG + " = ? order by lk." //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
          + ListenkandidaturErgebnisDBA.LISTENPLATZ;
      return retrieveIDs(query, new Object[]{id_Liste, id_Ergebniseingang});
    } catch (SQLException se) {
      throw new IVUFinderException(se.getMessage(), se);
    }
  }

  /**
   * Find all list candidature results by result and list, ordered by list position
   * 
   * @param id_Ergebniseingang
   * @param id_Liste
   * @return
   * @throws FinderException
   */
  public Collection<String> ejbFindAllByErgebniseingangAndListeAndGewaehlt(String id_Ergebniseingang,
      String id_Liste) throws FinderException {

    try {
      String query = "select " + ListenkandidaturErgebnisDBA.ID_LISTENKANDIDATURERGEBNIS + " from " //$NON-NLS-1$ //$NON-NLS-2$
          + ListenkandidaturErgebnisDBA.TABLENAME + " lke, " + ListenkandidaturDBA.TABLENAME //$NON-NLS-1$
          + " lk " + " where lke." + ListenkandidaturErgebnisDBA.ID_LISTENKANDIDATUR + "=lk." //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
          + ListenkandidaturDBA.ID_LISTENKANDIDATUR + " and lk." + ListenkandidaturDBA.ID_LISTE //$NON-NLS-1$
          + "=? and lke." + ListenkandidaturErgebnisDBA.ID_ERGEBNISEINGANG + " = ? and lke." //$NON-NLS-1$ //$NON-NLS-2$
          + ListenkandidaturErgebnisDBA.GEWAEHLT + " = 1 order by lk." //$NON-NLS-1$
          + ListenkandidaturErgebnisDBA.LISTENPLATZ;
      return retrieveIDs(query, new Object[]{id_Liste, id_Ergebniseingang});
    } catch (SQLException se) {
      throw new IVUFinderException(se.getMessage(), se);
    }
  }

}
