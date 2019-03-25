package de.ivu.wahl.modell.ejb;

import java.sql.SQLException;
import java.util.Collection;

import javax.ejb.FinderException;

import de.ivu.ejb.IVUFinderException;
import de.ivu.ejb.fw.DBABase;
import de.ivu.wahl.modell.impl.UnterverteilungDBA;

/**
 * UnterverteilungBean
 * 
 * @author J. Nottebaum (c) 2009 Statistisches Bundesamt und IVU Traffic Technologies AG
 */
public class UnterverteilungBean extends BasicUnterverteilungBean {
  private static final long serialVersionUID = 8121532146432498292L;

  public Collection<String> ejbFindAllForP3(String id_Ergebniseingang) throws FinderException {
    try {
      return DBABase.retrieveIDs("select " + UnterverteilungDBA.ID_UNTERVERTEILUNG //$NON-NLS-1$
          + " from " + UnterverteilungDBA.TABLENAME + " where " //$NON-NLS-1$ //$NON-NLS-2$
          + UnterverteilungDBA.ID_ERGEBNISEINGANG + "=? and " //$NON-NLS-1$
          + UnterverteilungDBA.ID_LISTENKOMBINATION + " IS NOT NULL ", //$NON-NLS-1$
          new Object[]{id_Ergebniseingang});
    } catch (SQLException se) {
      throw new IVUFinderException(se.getMessage(), se);
    }
  }

  public Collection<String> ejbFindAllForP2(String id_Ergebniseingang) throws FinderException {
    try {
      return DBABase.retrieveIDs("select " + UnterverteilungDBA.ID_UNTERVERTEILUNG //$NON-NLS-1$
          + " from " + UnterverteilungDBA.TABLENAME + " where " //$NON-NLS-1$ //$NON-NLS-2$
          + UnterverteilungDBA.ID_ERGEBNISEINGANG + "=? and " //$NON-NLS-1$
          + UnterverteilungDBA.ID_GRUPPE + " IS NOT NULL ", //$NON-NLS-1$
          new Object[]{id_Ergebniseingang});
    } catch (SQLException se) {
      throw new IVUFinderException(se.getMessage(), se);
    }
  }
}
