/*
 * P4ExportStateWrr83
 * 
 * Copyright (c) 2015 Statistisches Bundesamt und IVU Traffic Technologies AG
 */
package de.ivu.wahl.admin;

/**
 * Dialog-State and constant holder for export control of form Wrr 83
 * 
 * @author jon@ivu.de, IVU Traffic Technologies AG
 */
public class P4ExportStateWrr83 extends DialogStateHolder {
  private static final long serialVersionUID = 3652391506894645208L;

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
