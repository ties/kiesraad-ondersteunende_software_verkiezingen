/*
 * PropertyProvider
 * 
 * Created on 27.11.2018
 * Copyright (c) 2018 IVU Traffic Technologies AG
 */
package de.ivu.wahl.client.beans;

import javax.ejb.EJBException;

public interface PropertyProvider {
  public String getProperty(String key) throws EJBException;
}
