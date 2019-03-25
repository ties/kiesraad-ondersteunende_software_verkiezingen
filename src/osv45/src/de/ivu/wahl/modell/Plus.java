/*
 * Plus
 * 
 * Created on 10.12.2018
 * Copyright (c) 2018 IVU Traffic Technologies AG
 */
package de.ivu.wahl.modell;

import de.ivu.wahl.i18n.Messages;
import de.ivu.wahl.modell.exception.NumberRangeException;

/**
 * Safer adding and multiplying votes (and vote values). Values > 10^9 (1 billion) are truncated to
 * 10^9.
 */
public class Plus {
  private final static int MAX_VOTE_VALUE = 1000000000; // less than Integer.MAX_VALUE / 2

  public static int plus(Integer x, Integer y, Integer z, boolean throwException) {
    return plus(plus(x, y, throwException), z, throwException);
  }

  public static int plus(Integer x, Integer y, boolean throwException) {
    return truncate(truncate(x, throwException) + truncate(y, throwException), throwException);
  }

  public static int truncate(Integer x, boolean throwException) {
    if (x == null) {
      return 0;
    } else {
      if (x <= MAX_VOTE_VALUE) {
        return x;
      } else {
        if (throwException) {
          throw new NumberRangeException(getErrorMessage());
        } else {
          return MAX_VOTE_VALUE;
        }
      }
    }
  }

  public static String getErrorMessage() {
    return Messages.bind("Error_ValuesAbove_0_notSupported", "1.000.000.000"); //$NON-NLS-1$ //$NON-NLS-2$
  }

  public static int times(int x, int y, boolean throwException) {
    long result = ((long) x) * ((long) y);
    int intResult = (int) result;
    if (intResult == result) {
      return truncate(intResult, throwException);
    } else {
      if (throwException) {
        throw new NumberRangeException(getErrorMessage());
      } else {
        return MAX_VOTE_VALUE;
      }
    }
  }

}
