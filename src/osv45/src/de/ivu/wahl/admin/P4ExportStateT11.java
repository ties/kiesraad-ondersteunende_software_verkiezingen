/*
 * P4ExportStateT11
 * 
 * Copyright (c) 2010 IVU Traffic Technologies AG
 */
package de.ivu.wahl.admin;

/**
 * Dialog-State and constant holder for export control of form O3
 * 
 * @author jon@ivu.de, IVU Traffic Technologies AG
 */
public class P4ExportStateT11 extends DialogStateHolder {
  private static final long serialVersionUID = -2181304992069301992L;

  public final static int STATUS_P4_D1 = INITIAL_STATE;
  public final static int STATUS_P4_D2 = 2;
  public final static int STATUS_P4_D3 = 3;

  @Override
  public void back() {
    if (_modus == STATUS_P4_D3) {
      _modus = INITIAL_STATE;
    } else {
      super.back();
    }
  }
}
