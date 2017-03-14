/*
 * Copyright (c) 2010 IVU Traffic Technologies AG
 */
package de.ivu.wahl.admin;

/**
 * Dialog-State and constant holder for export control of form OSV4_4
 * 
 * @author jon@ivu.de, IVU Traffic Technologies AG
 */
public class P4ExportStateOSV4_4 extends DialogStateHolder {
  private static final long serialVersionUID = 5773460684683100978L;

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
