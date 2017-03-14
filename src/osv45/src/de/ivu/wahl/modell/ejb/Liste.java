/*
 * Liste
 * 
 * Copyright (c) 2002-4 IVU Traffic Technologies AG
 */
package de.ivu.wahl.modell.ejb;

import javax.ejb.EJBException;

/**
 * Liste corresponds to a P2-list, i.e. a set of identical lists of a candidate list that does not
 * belong to a set of identical lists.
 * 
 * @author cos@ivu.de IVU Traffic Technologies AG
 */

public interface Liste extends BasicListe {

  Listenkombination getListenkombination() throws EJBException;

}
