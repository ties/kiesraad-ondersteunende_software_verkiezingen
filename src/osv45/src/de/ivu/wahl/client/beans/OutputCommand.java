/*
 * OutputCommand
 * 
 * Created on 27.04.2007
 * Copyright (c) 2007 IVU Traffic Technologies AG
 */
package de.ivu.wahl.client.beans;

import java.io.Writer;

/**
 * @author cos@ivu.de, IVU Traffic Technologies AG
 */
public interface OutputCommand {
  /**
   * Eine Methode, die ihre Ausgaben in den übergebenen Writer schreibt
   * 
   * @param writer
   * @param request
   */
  void execute(Writer writer);
}
