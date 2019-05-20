package de.ivu.wahl.anwender;

/**
 * Created on 02.04.2019
 * 
 * @author Joachim Nottebaum, Copyright (c) 2019 IVU Traffic Technologies AG
 */
public enum Recht {

  R_ALWAYS_ALLOWED("R_ALWAYS_ALLOWED"), //$NON-NLS-1$

  /**
   * output-verzeichnis
   */
  R_OUTDIR("outdir"), //$NON-NLS-1$

  /**
   * Einstellungen ver�ndern
   */
  R_ADM_PROPS("adm_props"), //$NON-NLS-1$

  /**
   * Liste der angemeldeten Anwender anzeigen
   */
  R_ADM_ANGEMELDETE("adm_angemeldeteAnw"), //$NON-NLS-1$

  /**
   * Anwender anlegen
   */
  R_ADM_ANW_ANLEGEN("adm_anw_anlegen"), //$NON-NLS-1$
  /**
   * Anwender ver�ndern
   */
  R_ADM_ANW_AENDERN("adm_anw_aendern"), //$NON-NLS-1$
  /**
   * alle Anwender anzeigen
   */
  R_ADM_ANW_ANZEIGEN("adm_anw_anzeigen"), //$NON-NLS-1$

  R_ADM_KANDIDAT_WAEHLBAR("adm_kandidat_waehlbar"), //$NON-NLS-1$

  R_ADM_VOTE_VALUES("adm_vote_values"), //$NON-NLS-1$

  R_ADM_EMPTY_EML_EXPORT("adm_empty_eml_export"), //$NON-NLS-1$

  R_ADM_N10_1_EXPORT("adm_n10_1_export"), //$NON-NLS-1$

  /**
   * Stimmbezirke bearbeiten
   */
  R_ADM_STIMMBEZIRKE_EDIT("adm_stimmbezirke_edit"), //$NON-NLS-1$

  // /////// Wahleinheiten
  /**
   * Wahleinheit eingeben (ist Landesabh�ngig!)
   */
  R_EINGABE("wk_eingeben"), //$NON-NLS-1$

  /**
   * Wahleinheit eingeben (ist Landesabh�ngig!)
   */
  R_EINGABE_ERLAUBEN("wk_eingeben_erlauben"), //$NON-NLS-1$

  /**
   * Exportieren von Ergebnissen
   */
  R_EXPORT("exportieren"), //$NON-NLS-1$

  /**
   * Import 510-Msg
   */
  R_IMPORT("importieren"), //$NON-NLS-1$

  /**
   * Import 510-Msg only for Administrator
   */
  R_IMPORT_ADM("importieren_Adm"), //$NON-NLS-1$

  /**
   * Exportieren von Ergebnissen
   */
  R_SITZVERTEILUNG_BERECHNEN("sitzverteilung_berechnen"), //$NON-NLS-1$

  /**
   * recht, die Freigabe zu zu erteilen
   */
  R_FREIGABE("r_freigabe"), //$NON-NLS-1$

  /**
   * recht, die Freigabe zu zu erteilen
   */
  R_RE_INDEX_DATABASE("r_re_index_database"), //$NON-NLS-1$

  /**
   * recht, die Freigabe zur�ckzunehmen
   */
  R_FREIGABE_RUECK("r_freigabe_rueck"), //$NON-NLS-1$

  /** Wahl in die Datenbank importieren und aus der Datenbank entfernen */
  R_ADM_WAHLCREATEREMOVE("r_adm_wahlcreateremove"), //$NON-NLS-1$

  R_EINGABE_STATUS("EINGABE_STATUS"), //$NON-NLS-1$

  R_GEB_STATUS("GEB_STATUS"); //$NON-NLS-1$

  Recht(String key) {
    this.key = key;
  }

  private final String key;

  public String getKey() {
    return key;
  }

  public boolean isAlwaysAllowed() {
    return this.equals(R_ALWAYS_ALLOWED);
  }
}
