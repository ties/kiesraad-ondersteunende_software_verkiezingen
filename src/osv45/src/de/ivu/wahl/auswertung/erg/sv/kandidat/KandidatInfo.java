/*
 * Created on 17.12.2003
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package de.ivu.wahl.auswertung.erg.sv.kandidat;

import java.io.Serializable;

import org.apache.log4j.Category;

import de.ivu.util.debug.Log4J;
import de.ivu.wahl.modell.GebietModel;
import de.ivu.wahl.modell.GruppeModel;
import de.ivu.wahl.modell.ListeModel;
import de.ivu.wahl.modell.ListenkandidaturErgebnisModel;
import de.ivu.wahl.modell.PersonendatenModel;

/**
 * Information about a candidate. Immutable.
 * 
 * @author ugo@ivu.de, IVU Traffic Technologies AG
 */
public class KandidatInfo implements Serializable {
  public final static int KEIN_SATZ = -1;

  private static final long serialVersionUID = 3752443305297710657L;
  private static final Category LOGGER = Log4J.configure(KandidatInfo.class);

  static {
    LOGGER.info(Log4J.dumpVersion(KandidatInfo.class, Log4J.extractVersion("$Revision$"))); //$NON-NLS-1$
  }

  private final PersonendatenModel _personendatenModel;

  private final ListenkandidaturErgebnisModel _listenkandidaturModel;
  private final GebietModel _gebietModel;
  private final GruppeModel _gruppeModel;

  private final int _stimmenAnzahl;

  private final boolean _isGeschlechtSichtbar;
  private final int _satz;
  private final int _urspruenglicherListenplatz;

  /**
   * @param personendatenModel Wertobjekt der Personendaten des Kandidaten
   * @param listenkandidaturModel
   * @param gebietModel Wertobjekt des Gebiets auf dem der Kandidat aufgestellt ist
   * @param gruppeModel
   * @param stimmen
   * @param urspruenglicherListenplatz
   * @param geschlecht Geschlecht des Kandidaten
   */
  public KandidatInfo(PersonendatenModel personendatenModel,
      ListenkandidaturErgebnisModel listenkandidaturModel,
      GebietModel gebietModel,
      GruppeModel gruppeModel,
      int stimmen,
      ListeModel listeModel,
      int urspruenglicherListenplatz) {

    _personendatenModel = personendatenModel;
    _listenkandidaturModel = listenkandidaturModel;
    _gebietModel = gebietModel;
    _gruppeModel = gruppeModel;
    _stimmenAnzahl = stimmen;
    _isGeschlechtSichtbar = listeModel.isGeschlechtSichtbar();
    _satz = listeModel.getSatz() > 0 ? listeModel.getSatz() : KEIN_SATZ;
    _urspruenglicherListenplatz = urspruenglicherListenplatz;
  }

  public String getID_Gebiet() {
    return _gebietModel.getID_Gebiet();
  }

  public String getID_Gruppe() {
    return _gruppeModel.getID_Gruppe();
  }

  public String getGruppennameLang() {
    return _gruppeModel.getNameLang();
  }

  public String getGruppennameKurz() {
    return _gruppeModel.getNameKurz();
  }

  public int getGeschlecht() {
    return _personendatenModel.getGeschlecht();
  }

  public boolean isGeschlechtSichtbar() {
    return _isGeschlechtSichtbar;
  }

  public String getID_Listenkandidatur() {
    return _listenkandidaturModel == null ? null : _listenkandidaturModel.getID_Listenkandidatur();
  }

  public String getID_Personendaten() {
    return _personendatenModel == null ? null : _personendatenModel.getID_Personendaten();
  }

  public String getNachname() {
    return _personendatenModel == null ? "" : _personendatenModel.getNachname(); //$NON-NLS-1$
  }

  public String getPraefix() {
    return _personendatenModel != null && _personendatenModel.getPraefix() != null
        ? _personendatenModel.getPraefix()
        : ""; //$NON-NLS-1$
  }

  /**
   * @return Name des Kandidaten, formatiert für die GUI
   */
  public String getNameAnzeige() {
    if (_personendatenModel == null) {
      return ""; //$NON-NLS-1$
    }
    String name = _personendatenModel.getTitel();
    name += name == null || name.length() == 0 ? "" : " "; //$NON-NLS-1$ //$NON-NLS-2$
    name += _personendatenModel.getVorname() + " "; //$NON-NLS-1$
    name += _personendatenModel.getNachname();
    return name;
  }

  public String getInitialen() {
    return _personendatenModel.getInitialen();
  }

  public String getKontaktPlz() {
    return _personendatenModel == null ? "" : _personendatenModel.getKontakt_PLZ(); //$NON-NLS-1$
  }

  public String getKontaktStrasse() {
    return _personendatenModel == null ? "" : _personendatenModel.getKontakt_Strasse(); //$NON-NLS-1$
  }

  public String getKontaktWohnort() {
    return _personendatenModel != null && _personendatenModel.getKontakt_Wohnort() != null
        ? _personendatenModel.getKontakt_Wohnort()
        : "-"; //$NON-NLS-1$
  }

  public String getKontaktLand() {
    return _personendatenModel != null && _personendatenModel.getKontakt_Land() != null ? "(" //$NON-NLS-1$
        + _personendatenModel.getKontakt_Land() + ")" : ""; //$NON-NLS-1$ //$NON-NLS-2$
  }

  public String getTitel() {
    return _personendatenModel == null ? "" : _personendatenModel.getTitel(); //$NON-NLS-1$
  }

  public String getVorname() {
    return _personendatenModel == null ? "" : _personendatenModel.getVorname(); //$NON-NLS-1$
  }

  public String getWohnort() {
    return _personendatenModel != null && _personendatenModel.getWohnort() != null
        ? _personendatenModel.getWohnort()
        : "-"; //$NON-NLS-1$
  }

  public String getLand() {
    return _personendatenModel != null && _personendatenModel.getLand() != null ? "(" //$NON-NLS-1$
        + _personendatenModel.getLand() + ")" : ""; //$NON-NLS-1$ //$NON-NLS-2$
  }

  public int getGebietsnummer() {
    return _gebietModel.getNummer();
  }

  public int getGebietsart() {
    return _gebietModel.getGebietsart();
  }

  public int getGebietsPosition() {
    return _gebietModel.getPosition();
  }

  public GebietModel getGebietModel() {
    return _gebietModel;
  }

  public PersonendatenModel getPersonendatenModel() {
    return _personendatenModel;
  }

  public int getGruppenSchluessel() {
    return _gruppeModel.getSchluessel();
  }

  public int getListenplatz() {
    return _listenkandidaturModel.getListenplatz();
  }

  public int getUrspruenglicherListenplatz() {
    return _urspruenglicherListenplatz;
  }

  /**
   * @return number of votes for the candidate in the whole P3-list (i.e. Gruppe)
   */
  public int getStimmenAnzahl() {
    return _stimmenAnzahl;
  }

  /**
   * Gibt bevorzugtGewaehlt zurück.
   * 
   * @return bevorzugtGewaehlt.
   */
  public boolean isBevorzugtGewaehlt() {
    return _listenkandidaturModel.isBevorzugtGewaehlt();
  }

  /**
   * Was elected by loting.
   * 
   * @return bevorzugtGewaehlt.
   */
  public boolean isLosgewinner() {
    return _listenkandidaturModel.isLosgewinner();
  }

  /**
   * @return the id of the set of identical lists on which the candidate was elected. If he / she
   *         was not elected on a set of identical lists, return KEIN_SATZ.
   */
  public int getSatz() {
    return _satz;
  }

  public String getSatzOrRegionNumber4Display() {
    if (_satz == KEIN_SATZ) {
      return "Kieskring " + _gebietModel.getNummer();
    } else {
      return "Stel " + _satz;
    }
  }

  /**
   * @return Utility for
   */
  public int getSortKeyForSatzOrRegion() {
    if (_satz == KEIN_SATZ) {
      return _gebietModel.getNummer();
    } else {
      return _satz - 100;
    }
  }
}
