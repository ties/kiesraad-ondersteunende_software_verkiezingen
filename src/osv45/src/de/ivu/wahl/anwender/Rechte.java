package de.ivu.wahl.anwender;

import de.ivu.wahl.util.BundleHelper;

/**
 * Konstanten f�r die Abbildung von Funktionen auf Rechte Beinhaltet auch die Zuordnung f�r die
 * Initialisierung der Rechtegruppen
 * 
 * @author P. Kliem Copyright (c) 2002 Statistisches Bundesamt und IVU Traffic Technologies AG
 */

public interface Rechte {

  // Rechte
  // Die namen der Rechte werden als Prim�rschl�ssel verwendet!

  /**
   * output-verzeichnis
   */
  String R_OUTDIR = Recht.R_OUTDIR.getKey();

  /**
   * Einstellungen ver�ndern
   */
  String R_ADM_PROPS = Recht.R_ADM_PROPS.getKey();

  /**
   * Liste der angemeldeten Anwender anzeigen
   */
  String R_ADM_ANGEMELDETE = Recht.R_ADM_ANGEMELDETE.getKey();

  /**
   * Anwender anlegen
   */
  String R_ADM_ANW_ANLEGEN = Recht.R_ADM_ANW_ANLEGEN.getKey();
  /**
   * Anwender ver�ndern
   */
  String R_ADM_ANW_AENDERN = Recht.R_ADM_ANW_AENDERN.getKey();
  /**
   * alle Anwender anzeigen
   */
  String R_ADM_ANW_ANZEIGEN = Recht.R_ADM_ANW_ANZEIGEN.getKey();

  String R_ADM_KANDIDAT_WAEHLBAR = Recht.R_ADM_KANDIDAT_WAEHLBAR.getKey();

  String R_ADM_VOTE_VALUES = Recht.R_ADM_VOTE_VALUES.getKey();

  String R_ADM_EMPTY_EML_EXPORT = Recht.R_ADM_EMPTY_EML_EXPORT.getKey();

  String R_ADM_N10_1_EXPORT = Recht.R_ADM_N10_1_EXPORT.getKey();

  /**
   * Stimmbezirke bearbeiten
   */
  String R_ADM_STIMMBEZIRKE_EDIT = Recht.R_ADM_STIMMBEZIRKE_EDIT.getKey();

  // /////// Wahleinheiten
  /**
   * Wahleinheit eingeben (ist Landesabh�ngig!)
   */
  String R_EINGABE = Recht.R_EINGABE.getKey();

  /**
   * Wahleinheit eingeben (ist Landesabh�ngig!)
   */
  String R_EINGABE_ERLAUBEN = Recht.R_EINGABE_ERLAUBEN.getKey();

  /**
   * Exportieren von Ergebnissen
   */
  String R_EXPORT = Recht.R_EXPORT.getKey();

  /**
   * Import 510-Msg
   */
  String R_IMPORT = Recht.R_IMPORT.getKey();

  /**
   * Import 510-Msg only for Administrator
   */
  String R_IMPORT_ADM = Recht.R_IMPORT_ADM.getKey();

  /**
   * Exportieren von Ergebnissen
   */
  String R_SITZVERTEILUNG_BERECHNEN = Recht.R_SITZVERTEILUNG_BERECHNEN.getKey();

  /**
   * recht, die Freigabe zu zu erteilen
   */
  String R_FREIGABE = Recht.R_FREIGABE.getKey();

  /**
   * recht, die Freigabe zu zu erteilen
   */
  String R_RE_INDEX_DATABASE = Recht.R_RE_INDEX_DATABASE.getKey();

  /**
   * recht, die Freigabe zur�ckzunehmen
   */
  String R_FREIGABE_RUECK = Recht.R_FREIGABE_RUECK.getKey();

  /** Wahl in die Datenbank importieren und aus der Datenbank entfernen */
  String R_ADM_WAHLCREATEREMOVE = Recht.R_ADM_WAHLCREATEREMOVE.getKey();

  String R_EINGABE_STATUS = Recht.R_EINGABE_STATUS.getKey();
  String R_GEB_STATUS = Recht.R_GEB_STATUS.getKey();

  /** Rechtegruppen */
  String RG_ADMIN = "ADMIN"; //$NON-NLS-1$
  String RG_SITZVERTEILUNG = "SITZVERTEILUNG"; //$NON-NLS-1$
  String RG_ANWENDER = "ANWENDER"; //$NON-NLS-1$

  /**
   * Definition der Gruppen f�r die Initialisierung der Datenbank
   */
  String[][] RGRUPPEN_P4 = {{BundleHelper.getBundleString("RG_ADMIN"), //$NON-NLS-1$
      BundleHelper.getBundleString("RG_ADMIN_BESCHREIBUNG"), RG_ADMIN}, //$NON-NLS-1$
      {BundleHelper.getBundleString("RG_ANWENDER"), //$NON-NLS-1$
          BundleHelper.getBundleString("RG_ANWENDER_BESCHREIBUNG"), RG_ANWENDER}}; //$NON-NLS-1$
  /**
   * Definition der Gruppen f�r die Initialisierung der Datenbank
   */
  String[][] RGRUPPEN_P5 = {{BundleHelper.getBundleString("RG_ADMIN"), //$NON-NLS-1$
      BundleHelper.getBundleString("RG_ADMIN_BESCHREIBUNG"), RG_ADMIN}, //$NON-NLS-1$
      {BundleHelper.getBundleString("RG_SITZVERTEILUNG"), //$NON-NLS-1$
          BundleHelper.getBundleString("RG_SITZVERTEILUNG_BESCHREIBUNG"), RG_SITZVERTEILUNG}}; //$NON-NLS-1$

  /**
   * Dieses Array dient sowohl der Auflistung aller Rechte (Anlegen in der DB) als auch der
   * Zusammenstellung der Rechtegruppen
   */
  String[][] RECHTE = {
      // Admin sollte so ziemlich alles d�rfen
      {R_ADM_ANGEMELDETE, RG_ADMIN}, {R_ADM_ANW_AENDERN, RG_ADMIN}, {R_ADM_ANW_ANLEGEN, RG_ADMIN},
      {R_ADM_ANW_ANZEIGEN, RG_ADMIN}, {R_IMPORT, RG_ADMIN}, {R_IMPORT_ADM, RG_ADMIN},
      {R_ADM_STIMMBEZIRKE_EDIT, RG_ADMIN}, {R_ADM_PROPS, RG_ADMIN}, {R_OUTDIR, RG_ADMIN},
      {R_ADM_WAHLCREATEREMOVE, RG_ADMIN}, {R_ADM_VOTE_VALUES, RG_ADMIN},
      {R_ADM_KANDIDAT_WAEHLBAR, RG_ADMIN}, {R_ADM_EMPTY_EML_EXPORT, RG_ADMIN},
      {R_ADM_N10_1_EXPORT, RG_ADMIN}, {R_EXPORT, RG_ADMIN}, {R_FREIGABE, RG_ADMIN},
      {R_FREIGABE_RUECK, RG_ADMIN}, {R_SITZVERTEILUNG_BERECHNEN, RG_ADMIN},
      {R_GEB_STATUS, RG_ADMIN}, {R_EINGABE_STATUS, RG_ADMIN},
      {R_RE_INDEX_DATABASE, RG_ADMIN},
      {R_EINGABE_ERLAUBEN, RG_ADMIN},

      // normalerAnwender
      {R_EINGABE, RG_ANWENDER}, // {R_IMPORT, RG_ANWENDER},

      // Sitzverteilung
      {R_IMPORT, RG_SITZVERTEILUNG}, {R_SITZVERTEILUNG_BERECHNEN, RG_SITZVERTEILUNG},
      {R_EXPORT, RG_SITZVERTEILUNG}, {R_FREIGABE, RG_SITZVERTEILUNG}};
}