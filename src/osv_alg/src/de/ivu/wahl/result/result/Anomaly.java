/*
 * Anomaly
 * 
 * Created on 12.10.2009
 * Copyright (c) 2009 IVU Traffic Technologies AG
 */
package de.ivu.wahl.result.result;

/**
 * An Anomaly contains a piece of information about an exceptional event in the seat distribution
 * process, like
 * <ul>
 * <li>exhausted list</li>
 * <li>absolute majority</li>
 * </ul>
 * For one exceptional event usually more than one Anomaly object will be created.
 * 
 * @author jon@ivu.de, IVU Traffic Technologies AG
 */
public class Anomaly {
  private final String _text;
  private final int _number;

  Anomaly(String text, int number) {
    this._text = text;
    this._number = number;
  }

  public String getText() {
    return _text;
  }

  public int getNumber() {
    return _number;
  }

}
