/*
 * ApplicationBeanKonstanten
 * 
 * Created on 07.11.2003
 * Copyright (c) 2003 IVU Traffic Technologies AG
 */
package de.ivu.wahl.client.beans;

import de.ivu.wahl.i18n.MessageKeys;
import de.ivu.wahl.i18n.Messages;
import de.ivu.wahl.modell.GebietModel;

/**
 * @author mur@ivu.de, IVU Traffic Technologies AG
 */
public interface ApplicationBeanKonstanten {

  // Zentrale steuerung der Nachkommastellen bei Prozentangaben
  String EXC_RECHTEZUGRIFF = Messages.getString(MessageKeys.Msg_KonnteRechteDesAnwendersNichtLesen);

  int MAXIMUM_DIGET_PROZ = 1;
  int MINIMUM_DIGET_PROZ = 1;
  // Kennung f�r die �bermittlung von Anmeldefehlern
  String LOGIN_ERROR = "login_error"; //$NON-NLS-1$
  /**
   * Prefix der in jsp-Seiten vor alle Submitparameter gestellt werden mu�
   */
  String PREFIX = "pre_"; //$NON-NLS-1$
  /**
   * Navigationsparameter zum aufklappen und zuklappen der Navigationsleiste fangen alle mit
   * nachfolgendem Schl�ssel an, um sie gemeinsam aus dem Request zu entfernen
   */
  /**
   * Parameter als anchor in HTML-Seiten f�r die Navigation
   */
  String NAVI_ANKER = "anker"; //$NON-NLS-1$
  String NAVI_ANKERIS = NAVI_ANKER + "="; //$NON-NLS-1$

  /**
   * Parameter wenn aus der unteren Navigation ein WK direkt angesprungen werdne soll
   */
  String NAVI_UNTEN = "naviu"; //$NON-NLS-1$
  String NAVI_UNTENIS = NAVI_UNTEN + "="; //$NON-NLS-1$

  /** Namensliste insgesammt */
  int NL = 1;
  /** Namensliste je Partei */
  int NLP = 2;
  /** Namensliste Wahleinheit */
  int NLW = 3;
  /** Namensliste Alphabetisch */
  int NLA = 4;

  /** Gebietseingabe im Dialog */
  int GEBE = 5;

  /** Gebietsergebnis */
  int GEB_ERG = 6;

  /** Gebietsergebnis */
  int GEB_ERG_KAN = 7;

  /** Gebietsergebnis Kandidaten Zusammenfassung */
  int GEB_ERG_KAN_ZUS = 8;

  /** Erststimmenmehrheit sortiert nach Partei * */
  int ERSTST_MEHRH_PARTEI = 9;
  /** Erststimmenmehrheit sortiert nach Bundesland * */
  int ERSTST_MEHRH_GEBIET = 10;
  /** Uebersicht aller eingegangenen und ausstehenden Wahleinheite * */
  int EIN_AUS_WE = 11;
  /** Erststimmenmehrheitswechsel im Wahleinheit * */
  int ERSTST_MEHRH_WECHSEL_WE = 12;
  /** Erststimmenmehrheitswechsel pro Partei * */
  int ERSTST_MEHRH_WECHSEL_PARTEI = 13;
  /** Lesen der Nachrichten (bestimmte Anzahl) * */
  int NACHRICHT_LESEN = 14;
  /** Schreiben der Nachrichten * */
  int NACHRICHT_SCHREIBEN = 15;
  /** Nachrichten in einem neuen Fenster �ffnen * */
  int NACHRICHT_NEUES_FENSTER = 16;
  /** Nachrichten der aktuellen Wahl l�schen * */
  int NACHRICHTEN_LOESCHEN = 17;
  /**
   * Wahleinheite sortiert nach geringsten Unterschied der Stimmen bei WKGewinner und
   * Erstunterlegenen
   */
  int ERSTST_ERGEBNIS_DIFF = 18;
  /** Sitzverteilung im Bund */
  int AUSW_SITZVERTEILUNG_GEBIET = 19;
  /** Sitzverteilung alle Laender/ein land */
  int AUSW_SITZVERTEILUNG_UNTERGEBIETE = 20;
  /** Ver�nderung der Erfassungseinheiten ab Zeitpunkt */
  int EE_VERAENDERUNG = 21;
  /** NiemeyerZahlen */
  int AUSW_NIEMEYERZAHLEN = 22;
  /** Upload von Wahleinheitergebnissen */
  int UPLOAD_FILE = 23;
  /** Upload of changed texts for the report generator */
  int UPLOAD_RGTEXT = 24;
  /** Reset texts for the report generator */
  int RESET_RGTEXT = 25;
  /** Bekanntmachung Endergebnis */
  int BEKANNTMACHUNG = 28;
  /** Besonderheiten */
  int AUSW_BESONDERHEITEN = 29;
  /** Namensliste Alphabetisch */
  int NLPA = 30;
  /** WahleinheitErststimmenergebnis */
  int WE_ERST_ERG = 31;
  /** Erststimmenmehrheitswechsel im Wahleinheit * */
  int ERSTST_MEHRH_WECHSEL_WE_KOMPAKT = 32;
  /** WKR-Eingang nach Zeitpunkt des Ersteingangs * */
  int WE_ERSTEINGANG = 33;
  /** Hochrechnung * */
  int AUSW_HOCHRECHNUNG = 34;
  /** Filtern der angezeigten Nachrichten */
  int NACHRICHT_FILTER = 36;
  /** alle Nachrichten anzeigen */
  int NACHRICHT_ALLE_LESEN = 37;
  /** Import der Ergebnisse anzeigen */
  int IMPORT_ERGEBNISSE = 38;
  /** Exportverzeichnis anzeigen */
  int EXPORT_VERZEICHNIS = 39;
  /** Sitzverteilung im Bund */
  int AUSW_SITZVERTEILUNG_GEBIET_LISTENKOMBIANTION = 40;
  /** Exportverzeichnis anzeigen */
  int EXPORT = 41;
  /** Stimmendifferenz der einzelnen Parteien zur Vorperiode */
  int STIMMENDIFF_VORPERIODE = 42;

  /** Wahlbveteiligung im Vergleich zur Vorperiode */
  int WAHLBETEILIGUNG = 43;
  /** Schreiben der Fussnote */
  int FUSSNOTE_SCHREIBEN = 44;
  /** Eingabe der abzuziehenden Werte der Zweitstimmen wegen BWG �6 Absatz 1 Satz 2 */
  int WE_ABZUG_6_1_2 = 45;
  /** Export for P22-1 or P22-2 Document */
  int P22 = 46;
  /** Export for kennis verkozen kandidaten */
  int GEW_BEN = 47;
  /** Export for O3-Document */
  int O3 = 48;
  /** Export for N11-Document */
  int N11 = 49;
  /** Export for OSV4_1-Document */
  int OSV4_1 = 50;
  /** Export for Referendum-Document */
  int REF_EXP = 51;
  /** OnlineHelp */
  int HELP = 52;
  /** Gebiet Status */
  int STATUS_GEB = 53;
  /** Status Uebersicht */
  int STATUS = 54;
  /** Referendum Uebersicht */
  int REFERENDUM = 55;
  /** Ergebnisse-CSV export **/
  int VOTES_CSV = 56;
  /** RTF export with objections by voters **/
  int PROTOCOL_APPENDIX = 57;
  /** CSV export with names and addresses of all candidates **/
  int CAND_ADDRESS = 58;
  /** Export for T11-Document (EK election, P4_HSB) */
  int T11 = 59;
  /** Export for U16-Document (EK election, P5) */
  int U16 = 60;
  /** Export for OSV4_4-Document (Appendix to O3) */
  int OSV4_4 = 62;
  /** Export for PS1 elections of EML510c + OSV4_1 document (hashcode) */
  int EML510c = 63;
  /** Export for OSV4_5-Document (Control list for model T11) */
  int OSV4_5 = 64;

  String ADM_NAVI_ANKER = "adm_anker"; //$NON-NLS-1$
  String ADM_NAVI_ANKERIS = ADM_NAVI_ANKER + "="; //$NON-NLS-1$

  /**
   * Hier stehen alle Befehle der Administration Zahlenbereich 100 bis 200 KLIE: die auskommentiert,
   * die nicht verwendet werden!
   */
  int SCHWELLWERTE = 101;

  /**
   * Nachwahl festlegen
   */
  int ADM_WE_NACHWAHL = 102;
  int ANWENDER_ANLEGEN = 106;
  int ANWENDER_VERAENDERN_1_AUSWAHLEN = 107;
  int ANWENDER_VERAENDERN_2_EDIT = 108;
  int ANWENDER_LOESCHEN = 109;
  int ANWENDER_VERAENDERN_PASSWORT = 110;

  /**
   * Anzeigen aller Anwender der Applikation
   */
  int ANWENDER_ANZEIGEN = 111;

  /**
   * eine partei als Minderheit markieren
   */
  int ADM_PARTEI_MINDERHEIT = 112;

  /**
   * Zur�cksetzen einer Wahleinheit (Anwender level)
   */
  int ADM_WE_CLEAR = 113;

  /**
   * Liste der angemeldeten Anwender
   */
  int ADM_ANW_LISTE = 114;

  /**
   * Zur�cksetzen der Wahleinheiten eines Landes
   */
  int ADM_WE_CLEAR_LAND = 115;

  /**
   * Zur�cksetzen der Wahl des Bundes
   */
  int ADM_WE_CLEAR_WAHL = 116;

  /**
   * Zur�cksetzen eines Wahleinheites (Admin level)
   */
  int ADM_WE_CLEAR_ADM = 117;

  /**
   * Exportieren von CSV-Dateien
   */
  int ADM_EXPORT = 118;

  /**
   * F�llen von Erfassungseinheiten
   */
  int ADM_FILL_EE = 119;

  /**
   * Ver�ndern / editieren von Properties
   */
  int ADM_PROPS = 122;

  /**
   * Ver�ndern des Applikationszustandes
   */
  int ADM_APPSTATE = 123;

  /**
   * Landeslisten ausscheren
   */
  int ADM_LL_AUSGESCHERT = 124;

  /**
   * Schwellwerte f�r Parteien
   */
  int ADM_SW_PARTEIEN = 125;

  /**
   * Listenkandidant Landeslisten ausscheren
   */
  int ADM_LK_AUSGESCHIEDEN_LL_1_AUSWAHLEN = 126;
  int ADM_LK_AUSGESCHIEDEN_LL_2_AENDERN = 127;

  /**
   * Art und Vergelcihsart
   */
  int ADM_WAHLART = 128;

  /**
   * �ffnen und Schlie�en einer Wahl
   */
  int ADM_WAHLOPENCLOSE = 129;

  /**
   * Freigabesteuerung
   */
  int ADM_FREIGABE = 130;
  int ADM_STATSPEZ = 131;
  int ADM_OUTDIR = 132;

  /**
   * Telefonformulate erstellen
   */
  int ADM_TELEFONFORM = 133;

  /**
   * Testmaterial erstellen
   */
  int ADM_TESTMATERIAL = 134;

  /**
   * Exportieren von CSV-Dateien
   */
  int ADM_EXPORT_QUEUE = 135;

  /**
   * Stichwahl erzeugen
   */
  int ADM_STICHWAHL = 136;

  /**
   * Export von HTML und SVG Seiten f�r die Pr�sentation
   */
  int ADM_GEN_PRES = 137;

  /** Neue Wahl importieren */
  int ADM_NEUE_WAHL = 138;

  /**
   * Wahl l�schen
   */
  int ADM_WAHL_LOESCHEN = 139;

  /**
   * Wahl l�schen
   */
  int ADM_CMS_INITIALISIEREN = 140;

  /**
   * Kandidat w�hlbar?
   */
  int ADM_KANDIDAT_WAEHLBAR = 141;

  /**
   * new Areas
   */
  int ADM_STIMMBEZIRKE = 142;

  /**
   * export of empty eml files
   */
  int ADM_EMPTY_EML_EXPORT = 143;

  /**
   * edit Areas
   */
  int ADM_STIMMBEZIRKE_EDIT = 144;

  /**
   * Vote values
   */
  int ADM_VOTE_VALUES = 145;

  /**
   * export of empty eml files
   */
  int ADM_N10_1_EXPORT = 146;

  /**
   * ############ Sonstige ab 200
   */

  /**
   * Logout nachfrage
   */
  int SONST_LOGOUT = 201;

  /**
   * Debug: rechte eines Anwenders
   */
  int SONST_DEBUG_RECHTE = 202;

  /**
   * Treffen von Entscheidungen bei Problemf�llen (nur Anzeigen; lokal)
   */
  int SONST_ENTSCHEIDUNGEN = 203;

  /**
   * Liste mit Parteiinformationen
   */
  int SONST_PARTEIENLISTE = 204;

  /** Wahldetails **/
  int SONST_ELECTIONDETAILS = 205;

  /**
   * view: URL-Parameter, welcher die momentane Sicht auf das Wahl-System beschreibt Parameter mu�
   * immer in der URL vorhanden sein
   */
  String VIEW = "view"; //$NON-NLS-1$
  String VIEWIS = VIEW + "="; //$NON-NLS-1$

  /** Sicht auf das WahlAbwicklungsSysytem */
  int VIEW_BASIS = 0;

  /** .... .... initial viewstate */
  int VIEWSTATE_INITIAL = VIEW_BASIS;

  /**
   * level: URL-Parameter, welcher die momentane Ebene beschreibt (Bund / Land / Wahleinheit)
   * Parameter mu� immer in der URL vorhanden sein
   */
  String LEVEL = "level"; //$NON-NLS-1$

  /** level= */
  String LEVELIS = LEVEL + "="; //$NON-NLS-1$

  /**
   * level: URL-Parameter, welcher die momentane Ebene beschreibt (Bund / Land / Wahleinheit)
   * Parameter mu� immer in der URL vorhanden sein
   */
  String LEVELAUFRUFENDER = "aufrufender_level"; //$NON-NLS-1$

  /** level= */
  String LEVELAUFRUFENDERIS = LEVELAUFRUFENDER + "="; //$NON-NLS-1$

  /** Sicht auf ein Nachrichtenfenster */
  int LEVEL_NACHRICHT = GebietModel.ANZAHL_GEBIETSARTEN;

  /** Sicht auf die Adminstration */
  int LEVEL_ADMIN = GebietModel.ANZAHL_GEBIETSARTEN + 1;

  /** f�r LEVEL_unabh�ngige Commands */
  int LEVEL_UNABHAENGIG = GebietModel.ANZAHL_GEBIETSARTEN + 2;

  /** initial LEVEL */
  int LEVEL_INITIAL = GebietModel.GEBIETSART_BUND;

  /**
   * work: was im Arbeitsbereich angezeigt wird
   */
  String WORK = "work"; //$NON-NLS-1$
  /** work= */
  String WORKIS = WORK + "="; //$NON-NLS-1$

  /**
   * work: was im Arbeitsbereich angezeigt wird
   */
  String WORKAUFRUFENDER = "aufrufender_work"; //$NON-NLS-1$
  /** work= */
  String WORKAUFRUFENDERIS = WORKAUFRUFENDER + "="; //$NON-NLS-1$

  /** initial WORK */
  int WORK_INITIAL = GEB_ERG;

  /**
   * gebietnr: URL-Parameter, mit der Gebietnummer Parameter mu� in URL vorhanden sein
   */
  String GEBIETNR = "gebietnr"; //$NON-NLS-1$
  /** wkrnr= */
  String GEBIETNRIS = GEBIETNR + "="; //$NON-NLS-1$
  /** initial WKRNR */
  int GEBIETNR_INITIAL = -1;

  /**
   * Browserkonstante f�r InternetExplorer oder Netscape != 4.x
   */
  int BROWSER_IENS6 = 0;
  /**
   * Browserkonstante f�r Netscape 4.x
   */
  int BROWSER_NS4 = 1;
  /**
   * Schl�ssel mit dem der angemeldete Anwnder in der Session als AnwContext gespeichert wird.
   */
  String CUR_ANW_KEY = "CUR_ANW_KEY"; //$NON-NLS-1$

  String GEBIETART_NACHRICHTEN_KEY = "GEBIETART_NACHRICHTEN_KEY"; //$NON-NLS-1$
}
