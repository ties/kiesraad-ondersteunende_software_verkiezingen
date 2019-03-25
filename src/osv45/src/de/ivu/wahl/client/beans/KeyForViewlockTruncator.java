/*
 * KeyForViewlockTruncator
 * 
 * Created on 12.02.2019
 * Copyright (c) 2019 IVU Traffic Technologies AG
 */
package de.ivu.wahl.client.beans;

import de.ivu.wahl.AnwContext;

public class KeyForViewlockTruncator {
  public static String truncate(String keyForViewlock) {
    int maxLength = 4;
    if (keyForViewlock == null || keyForViewlock.length() <= maxLength) {
      return keyForViewlock;
    }
    int index = keyForViewlock.indexOf(AnwContext.TRENNER);
    if (index < 0) {
      return keyForViewlock.substring(0, maxLength);
    } else {
      return keyForViewlock.substring(0, maxLength) + "..." + keyForViewlock.substring(index); //$NON-NLS-1$
    }
  }

}
