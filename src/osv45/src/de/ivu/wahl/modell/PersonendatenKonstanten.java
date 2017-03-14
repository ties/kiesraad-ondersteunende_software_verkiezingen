/*
 * PersonendatenKonstanten
 * 
 * Created on 19.12.2008
 * Copyright (c) 2008 IVU Traffic Technologies AG
 */
package de.ivu.wahl.modell;

import de.ivu.wahl.i18n.MessageKeys;
import de.ivu.wahl.i18n.Messages;
import de.ivu.wahl.util.BundleHelper;

/**
 * @author ugo@ivu.de, IVU Traffic Technologies AG
 * @version $Id$
 */
public interface PersonendatenKonstanten {

  public static enum Geschlecht {
    WEIBLICH(0, "female"), WEIBLICH_FRIESISCH(1, "unknown"), MAENNLICH(2, "male"), KEINE_ANGABE(-1, //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
        ""); //$NON-NLS-1$

    private static final String UNKNOWN_GENDER = Messages
        .getString(MessageKeys.Msg_UnbekanntesGeschlecht);

    public String name;
    public String nameEML;
    public int id;

    @SuppressWarnings("hiding")
    Geschlecht(int id, String nameEML) {
      this.id = id;
      this.name = BundleHelper.getBundleString("PersonendatenKonstanten." + this.name()); //$NON-NLS-1$
      this.nameEML = nameEML;
    }

    public static int getId(String nameEML) {
      for (Geschlecht geschlecht : values()) {
        if (geschlecht.nameEML.equals(nameEML)) {
          return geschlecht.id;
        }
      }
      throw new RuntimeException(UNKNOWN_GENDER + nameEML);
    }

    public static String getName(int id) {
      for (Geschlecht geschlecht : values()) {
        if (geschlecht.id == id) {
          return geschlecht.name;
        }
      }
      throw new RuntimeException(UNKNOWN_GENDER + id);
    }

    public static String getNameEML(int id) {
      for (Geschlecht geschlecht : values()) {
        if (geschlecht.id == id) {
          return geschlecht.nameEML;
        }
      }
      throw new RuntimeException(UNKNOWN_GENDER + id);
    }
  }
}
