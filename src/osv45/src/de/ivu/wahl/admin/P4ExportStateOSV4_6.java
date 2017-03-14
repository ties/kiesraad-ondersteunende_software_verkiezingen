/*
 * Copyright (c) 2015 Statistisches Bundesamt und IVU Traffic Technologies AG
 */
package de.ivu.wahl.admin;

/**
 * Dialog-State and constant holder for export control of form OSV4_6
 * 
 * @author jon@ivu.de, IVU Traffic Technologies AG
 */
public class P4ExportStateOSV4_6 extends DialogStateHolder {
  private static final long serialVersionUID = 6250291749214706387L;

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
