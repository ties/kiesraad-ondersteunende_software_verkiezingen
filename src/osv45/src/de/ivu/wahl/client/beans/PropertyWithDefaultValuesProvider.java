/*
 * PropertyWithDefaultValuesProvider
 * 
 * Created on 27.11.2018
 * Copyright (c) 2018 IVU Traffic Technologies AG
 */
package de.ivu.wahl.client.beans;

import javax.ejb.EJBException;

import de.ivu.wahl.Konstanten;
import de.ivu.wahl.WahlInfo;
import de.ivu.wahl.export.XMLTags;
import de.ivu.wahl.i18n.MessageKeys;
import de.ivu.wahl.i18n.Messages;
import de.ivu.wahl.modell.ejb.Wahl;

/**
 * @author J. Nottebaum, IVU Traffic Technologies AG
 */
public class PropertyWithDefaultValuesProvider implements PropertyProvider {
  private final PropertyProvider propertyProvider;

  @SuppressWarnings("hiding")
  public PropertyWithDefaultValuesProvider(PropertyProvider propertyProvider) {
    this.propertyProvider = propertyProvider;
  }

  @Override
  public String getProperty(String name) throws EJBException {
    String propertyValue = getPropertyInternal(name);
    return replaceWithDefaultValueIfNull(name, propertyValue);
  }

  public String getPropertyInternal(String key) throws EJBException {
    return propertyProvider.getProperty(key);
  }

  /**
   * Replaces the propertyValue with the default value, if propertyValue is null.
   * 
   * @param propertyName property name
   * @param propertyValue property value
   * @return value to use
   */
  private String replaceWithDefaultValueIfNull(String propertyName, String propertyValue) {
    if (propertyValue != null) {
      return propertyValue;
    }
    if (XMLTags.RG_REJECTION_LOCATION.equals(propertyName)
        || XMLTags.RG_ACCEPTANCE_LOCATION.equals(propertyName)) {
      return getProperty(XMLTags.RG_PLACE_LETTER); // OSV-2045: RG_PLACE_LETTER = City of the CSB
    }
    if (XMLTags.RG_PLACE_LETTER.equals(propertyName)) {
      return getCityOfWurzelgebiet();
    }
    if (XMLTags.RG_REPRESENTATIVE_BODY.equals(propertyName)) {
      return getCityOfWurzelgebiet();
    }
    if (XMLTags.RG_ORGANIZING_MUNICIPALITY.equals(propertyName)) {
      return getOrganizingMunicipality();
    }
    if (Konstanten.PROP_BACKGROUND_COLOR_RED.equals(propertyName)
        || Konstanten.PROP_BACKGROUND_COLOR_GREEN.equals(propertyName)
        || Konstanten.PROP_BACKGROUND_COLOR_BLUE.equals(propertyName)) {
      return String.valueOf(Konstanten.DEFAULT_BACKGROUND_COLOR_GREY);
    }
    return propertyValue;
  }

  /**
   * @return name of the city of the wurzelgebiet
   */
  private String getCityOfWurzelgebiet() {
    Wahl wahl = WahlInfo.getWahlInfo().getWahl();
    String wahlkategorie = wahl.getWahlkategorie();
    if ("TK".equals(wahlkategorie) || "EK".equals(wahlkategorie) || "EP".equals(wahlkategorie)) { //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
      return Messages.getString(MessageKeys.LocationOfDeKiesraad);
    }
    return getProperty(Konstanten.KEY_CSB_REGION_NAME);
  }

  private String getOrganizingMunicipality() {
    Wahl wahl = WahlInfo.getWahlInfo().getWahl();
    return wahl.getWurzelgebiet().getName();
  }
}
