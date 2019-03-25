package de.ivu.wahl.modell.ejb;

/**
 * RepositoryBean
 */

import javax.ejb.EJBException;
import javax.ejb.FinderException;
import javax.ejb.ObjectNotFoundException;

public class RepositoryBean extends BasicRepositoryBean {
  private static final long serialVersionUID = -1736780541886115766L;

  /**
   * Find repository by given name
   * 
   * @param name
   * @return
   * @throws ObjectNotFoundException
   * @throws FinderException
   * @throws EJBException
   */
  public String ejbFindByName(String name)
      throws ObjectNotFoundException, FinderException, EJBException {
    return findSingle(ejbFindAllByName(name));
  }
}
