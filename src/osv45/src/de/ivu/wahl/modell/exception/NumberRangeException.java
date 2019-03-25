/*
 * NumberRangeException
 * 
 * Created on 11.12.2018
 * Copyright (c) 2018 IVU Traffic Technologies AG
 */
package de.ivu.wahl.modell.exception;

public class NumberRangeException extends RuntimeException {
  private static final long serialVersionUID = 1L;

  public NumberRangeException(String msg) {
    super(msg);
  }

}
