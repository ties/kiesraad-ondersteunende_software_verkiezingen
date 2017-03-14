package de.ivu.wahl.modell.ejb;

import java.util.Collection;

import javax.ejb.FinderException;

/**
 * ListenkombinationZulassungHome
 * 
 * @author cos@ivu.de (c) 2003-7 IVU Traffic Technologies AG
 * @version $Id$
 */

public interface ListenkombinationZulassungHome extends BasicListenkombinationZulassungHome {

  /**
   * Find all (non)admitted parties for a given result
   * 
   * @param id_Ergebniseingang input identifier
   * @param zugelassen true if only admitted parties shall be found
   * @return
   * @throws FinderException
   */
  Collection<ListenkombinationZulassung> findAllByErgebniseingangAndZugelassen(String id_Ergebniseingang,
      boolean zugelassen) throws FinderException;

}
