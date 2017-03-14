/*
 * IImportEML
 * 
 * Created on 02.10.2009
 * Copyright (c) 2009 Statistisches Bundesamt und IVU Traffic Technologies AG
 */
package de.ivu.wahl.dataimport;

import java.net.URL;
import java.util.List;

import de.ivu.wahl.modell.GebietModel;
import de.ivu.wahl.modell.WahlModel;
import de.ivu.wahl.wus.electioncategory.ElectionCategory;

/**
 * @author tdu@ivu.de, IVU Traffic Technologies AG
 */
public interface IImportEML {

  ImportType getImportType();

  void setImportType(ImportType importType);

  URL getDefinition();

  void setDefinition(URL definition);

  boolean isDefinitionAccepted();

  void setDefinitionAccepted(boolean definitionAccepted);

  URL getEML230();

  void setEML230(URL eml230);

  URL getEML510();

  void setEML510(URL eml510);

  /*
   * Hashwert getter/setter
   */
  String getHashWertWahldefinition();

  void setHashWertWahldefinition(String hashWert);

  String getHashWert230();

  void setHashWert230(String hashWert);

  String getHashWert510();

  void setHashWert510(String hashWert);

  String getTeilHashWertWahldefinition();

  String getTeilHashWert230();

  void setTeilHashWert230(String teil1);

  String getTeilHashWert510();

  void setTeilHashWert510(String teil1);

  WahlModel getElectionDetails();

  void setElectionDetails(WahlModel wahlModel);

  SecurityLevel getSecurityLevel();

  /**
   * Initializing program with or without database
   * 
   * @return the _modus
   */
  int getModus();

  /**
   * Election level (HSB,CSB,...)
   */
  int getLevel();

  public ElectionCategory getElectionCategory();

  public void setElectionCategory(ElectionCategory electionCategory);

  /**
   * returning election domain from election definition file
   */
  String getElectionDomain();

  /**
   * returning election domain id from election definition file
   */
  String getElectionDomainId();

  /**
   * Region category for (root) region.
   */
  int getGebietsart();

  /**
   * Setting region category for (root) region.
   * 
   * @param gebietsart Region category for (root) region.
   */
  void setGebietsart(int gebietsart);

  /**
   * Region number for (root) region.
   */
  int getGebietsNr();

  /**
   * Setting Region number for (root) region.
   * 
   * @param gebietsNr Region number for (root) region.
   */
  void setGebietsNr(int gebietsNr);

  List<GebietModel> getGebietsauswahl();

  /**
   * The import state
   * 
   * @return status.
   */
  int getStatus();

  /**
   * Setting the import state
   * 
   * @param status neuer Wert f�r status
   */
  void setStatus(int status);

  /**
   * @return fehlermeldung or <code>null</code>, if empty
   */
  String getFehlermeldung();

  void setFehlermeldung(String fehlermeldung);

  /**
   * Initializing for a new Import
   */
  void reset();

  void updateStatus();

}