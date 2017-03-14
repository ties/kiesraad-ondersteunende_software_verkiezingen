/*
 * P5_ExportDirServiceImpl
 * 
 * Copyright (c) 2009 IVU Traffic Technologies AG
 */
package de.ivu.wahl.mbean.exportdir;

import org.jboss.annotation.ejb.Management;
import org.jboss.annotation.ejb.Service;

/**
 * Management of the shadow export directory
 * 
 * @author cos@ivu.de, IVU Traffic Technologies AG
 */
@Service(objectName = "osv:service=P5_Export")
@Management(ExportDirService.class)
public class P5_ExportDirServiceImpl extends AbstractExportDirServiceImpl {
  // only metadata differs
}