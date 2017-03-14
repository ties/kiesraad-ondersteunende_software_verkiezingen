/*
 * P4_HSB_DBInitServiceImpl
 * 
 * Created on 03.04.2009
 * Copyright (c) 2009 IVU Traffic Technologies AG
 */
package de.ivu.wahl.mbean.dbinit;

import org.jboss.annotation.ejb.Management;
import org.jboss.annotation.ejb.Service;

/**
 * Database Initialisation for P4_HSB
 * 
 * @author cos@ivu.de, IVU Traffic Technologies AG
 */
@Service(objectName = "osv:service=P4_HSB_DBInitService")
@Management(DBInitService.class)
public class P4_HSB_DBInitServiceImpl extends AbstractDBInitServiceImpl {
  @Override
  public void start() throws Exception {
    super.start();
  }
}
