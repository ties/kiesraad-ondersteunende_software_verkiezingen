/*
 * RightsChecker
 * 
 * Created on 12.04.2019
 * Copyright (c) 2019 IVU Traffic Technologies AG
 */
package de.ivu.wahl.client.beans;

import de.ivu.wahl.AnwContext;

public class RightsChecker {
  public boolean checkRights(Action action, AnwContext anwContext, String cmd) {
    if (action == null || !action.hasKey(cmd)) {
      return false;
    }
    String rechteFehler = AnwContext.getErrorIfRightsAreMissing(action.getJspPage(), anwContext);
    if (rechteFehler.isEmpty()) {
      return true;
    }
    throw new RuntimeException(rechteFehler);
  }

}
