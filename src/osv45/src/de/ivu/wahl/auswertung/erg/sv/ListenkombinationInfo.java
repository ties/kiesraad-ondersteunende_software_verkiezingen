/*
 * ListenkombinationInfo
 * 
 * Created on 23.02.2009
 * Copyright (c) 2009 IVU Traffic Technologies AG
 */
package de.ivu.wahl.auswertung.erg.sv;

import java.io.Serializable;

import de.ivu.wahl.modell.GruppeModel;
import de.ivu.wahl.modell.ListenkombinationModel;
import de.ivu.wahl.modell.ListenkombinationZulassungModel;

/**
 * Contains the information of a P3-list (= _gruppeModel) that is part of a combined list. Contains
 * information about seat and votes of the P3-list and the information whether the P3-list is
 * admitted to the combined list or not.
 * 
 * @author mur@ivu.de, IVU Traffic Technologies AG
 */
@SuppressWarnings({"serial"})
public class ListenkombinationInfo implements Serializable, Comparable<ListenkombinationInfo> {

  ListenkombinationModel _listenkombinationModel;
  ListenkombinationZulassungModel _listenkombinationZulassungModel;
  GruppeModel _gruppeModel;
  int _position;
  int _anzahlSitze;
  int _anzahlStimmen;

  /**
   * Constructor
   * 
   * @param listenkombinationZulassungModel
   * @param listenkombinationModel
   * @param gruppeModel
   * @param position
   * @param anzahlSitze
   * @param anzahlStimmen
   */
  public ListenkombinationInfo(ListenkombinationZulassungModel listenkombinationZulassungModel,
      ListenkombinationModel listenkombinationModel,
      GruppeModel gruppeModel,
      int position,
      int anzahlSitze,
      int anzahlStimmen) {
    super();
    _listenkombinationZulassungModel = listenkombinationZulassungModel;
    _listenkombinationModel = listenkombinationModel;
    _gruppeModel = gruppeModel;
    _position = position;
    _anzahlSitze = anzahlSitze;
    _anzahlStimmen = anzahlStimmen;
  }

  public String getBezeichnung() {
    return _listenkombinationModel.getBezeichnung();
  }

  public String getGruppeBezeichnung() {
    return _gruppeModel.getNameKurz();
  }

  public String getID_Listenkombination() {
    return _listenkombinationModel.getID_Listenkombination();
  }

  public String getID_ListenkombinationZulassung() {
    return _listenkombinationZulassungModel.getID_ListenkombinationZulassung();
  }

  public boolean isBeruecksichtigt() {
    return _listenkombinationZulassungModel.isZugelassen();
  }

  public int getAnzahlSitze() {
    return _anzahlSitze;
  }

  public int getAnzahlStimmen() {
    return _anzahlStimmen;
  }

  public void setAnzahlStimmen(int anzahlStimmen) {
    _anzahlStimmen = anzahlStimmen;
  }

  /*
   * (non-Javadoc)
   * @see java.lang.Object#equals(java.lang.Object)
   */
  @Override
  public boolean equals(Object obj) {
    if (obj instanceof ListenkombinationInfo) {
      return _listenkombinationModel.getID_Listenkombination().equals(((ListenkombinationInfo) obj)
          .getID_Listenkombination())
          && _listenkombinationZulassungModel.getID_ListenkombinationZulassung()
              .equals(((ListenkombinationInfo) obj).getID_ListenkombinationZulassung());
    }
    return super.equals(obj);
  }

  /*
   * (non-Javadoc)
   * @see java.lang.Object#hashCode()
   */
  @Override
  public int hashCode() {
    return _listenkombinationModel.getID_Listenkombination().hashCode();
  }

  /*
   * (non-Javadoc)
   * @see java.lang.Comparable#compareTo(java.lang.Object)
   */
  @Override
  public int compareTo(ListenkombinationInfo o) {
    return _position - o.getPosition();
  }

  public int getPosition() {
    return _position;
  }
}
