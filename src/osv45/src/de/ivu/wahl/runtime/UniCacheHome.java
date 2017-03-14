/*
 * UniCacheHome
 * 
 * Created on 17.03.2005
 * Copyright (c) 2005 IVU Traffic Technologies AG
 */
package de.ivu.wahl.runtime;

import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;

import de.ivu.ejb.IVUBeanBase;

/**
 * @author COS@ivu.de, IVU Traffic Technologies AG
 */
public interface UniCacheHome extends EJBLocalHome {

  public static class HomeFinder {
    public static UniCacheHome findHome(IVUBeanBase caller) {
      String simpleName = UniCacheHome.class.getSimpleName();
      return caller.findLocalHome(simpleName.substring(0, simpleName.length() - 4));
    }
  }

  /**
   * Gibt das UniCache-Objekt für den Schlüssel zurück
   * 
   * @param cachePK Schlüssel des UniCache-Objekts, welches geholt werden soll
   * @param <T> Typ der Objekte, die im Cache gehalten werden
   * @return UniCache-Objekt für den angegebenen Schlüssel
   * @throws FinderException nie, aber notwendig laut Spez.
   */
  <T extends Object> UniCache<T> findByPrimaryKey(UniCachePK cachePK) throws FinderException;
}
