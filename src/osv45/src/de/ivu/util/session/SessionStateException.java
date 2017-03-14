package de.ivu.util.session;

/**
 * Copyright: Copyright (c) 2001 <BR>
 * Organisation: IVU Traffic Technologies AG <BR>
 * 
 * @author Dr. Domagoj Cosic (cos@ivu.de)
 * @created 29. Mai 2001
 */

public class SessionStateException extends Exception {

  /** long */
  private static final long serialVersionUID = -2692861958893759331L;

  /**
   * Constructor for the SessionStateException object
   * 
   * @param message error message.
   */
  public SessionStateException(String message) {
    super(message);
  }
}
