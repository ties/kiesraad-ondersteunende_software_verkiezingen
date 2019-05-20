package de.ivu.wahl.client.beans;

import static de.ivu.wahl.anwender.Recht.R_ADM_ANGEMELDETE;
import static de.ivu.wahl.anwender.Recht.R_ADM_ANW_AENDERN;
import static de.ivu.wahl.anwender.Recht.R_ADM_ANW_ANLEGEN;
import static de.ivu.wahl.anwender.Recht.R_ADM_EMPTY_EML_EXPORT;
import static de.ivu.wahl.anwender.Recht.R_ADM_KANDIDAT_WAEHLBAR;
import static de.ivu.wahl.anwender.Recht.R_ADM_N10_1_EXPORT;
import static de.ivu.wahl.anwender.Recht.R_ADM_PROPS;
import static de.ivu.wahl.anwender.Recht.R_ADM_STIMMBEZIRKE_EDIT;
import static de.ivu.wahl.anwender.Recht.R_ADM_VOTE_VALUES;
import static de.ivu.wahl.anwender.Recht.R_ADM_WAHLCREATEREMOVE;
import static de.ivu.wahl.anwender.Recht.R_ALWAYS_ALLOWED;
import static de.ivu.wahl.anwender.Recht.R_EINGABE;
import static de.ivu.wahl.anwender.Recht.R_EINGABE_ERLAUBEN;
import static de.ivu.wahl.anwender.Recht.R_EINGABE_STATUS;
import static de.ivu.wahl.anwender.Recht.R_EXPORT;
import static de.ivu.wahl.anwender.Recht.R_FREIGABE;
import static de.ivu.wahl.anwender.Recht.R_GEB_STATUS;
import static de.ivu.wahl.anwender.Recht.R_IMPORT;
import static de.ivu.wahl.anwender.Recht.R_IMPORT_ADM;
import static de.ivu.wahl.anwender.Recht.R_RE_INDEX_DATABASE;

import de.ivu.wahl.anwender.Recht;

/**
 * Created on 03.04.2019 Eingentlich ein Paar aus Dateiname einer JSP-Datei und einem Recht. Beides
 * ist nicht eindeutig.
 * 
 * @author Joachim Nottebaum, Copyright (c) 2019 IVU Traffic Technologies AG
 */
public enum JspPage {
  ADM_ANGEMELDETE_ANWENDER("adm_angemeldeteAnwender.jsp", R_ADM_ANGEMELDETE), //$NON-NLS-1$
  ADM_ANWENDER_CHANGE_PW("adm_anwender_change_pw.jsp", R_ALWAYS_ALLOWED), //$NON-NLS-1$
  ADM_ANWENDER_CREATE("adm_anwender_edit.jsp", R_ADM_ANW_ANLEGEN), //$NON-NLS-1$
  ADM_ANWENDER_EDIT("adm_anwender_edit.jsp", R_ADM_ANW_AENDERN), //$NON-NLS-1$
  ADM_ANWENDER_SELECT_DELETE("adm_anwender_select.jsp", R_ADM_ANW_ANLEGEN), //$NON-NLS-1$
  ADM_ANWENDER_SELECT_EDIT("adm_anwender_select.jsp", R_ADM_ANW_AENDERN), //$NON-NLS-1$
  ADM_EMPTY_EXPORT("adm_empty_export.jsp", R_ADM_EMPTY_EML_EXPORT), //$NON-NLS-1$
  ADM_FREIGABE("adm_freigabe.jsp", R_FREIGABE), //$NON-NLS-1$
  ADM_KANDIDAT_WAEHLBAR("adm_kandidat_waehlbar.jsp", R_ADM_KANDIDAT_WAEHLBAR), //$NON-NLS-1$
  ADM_N10_1_EXPORT("adm_n10_1_export.jsp", R_ADM_N10_1_EXPORT), //$NON-NLS-1$
  ADM_PROPS("adm_props.jsp", R_ADM_PROPS), //$NON-NLS-1$
  ADM_RE_INDEX_DATABASE("adm_re_index_database.jsp", R_RE_INDEX_DATABASE), //$NON-NLS-1$
  ADM_STIMMBEZIRKE_CREATE("adm_stimmbezirke.jsp", R_ADM_WAHLCREATEREMOVE), //$NON-NLS-1$
  ADM_STIMMBEZIRKE_EDIT("adm_stimmbezirke.jsp", R_ADM_STIMMBEZIRKE_EDIT), //$NON-NLS-1$
  ADM_VOTE_VALUES("adm_vote_values.jsp", R_ADM_VOTE_VALUES), //$NON-NLS-1$
  DATEI_EXPORT_VERZEICHNIS("dateiExportVerzeichnis.jsp", R_EXPORT), //$NON-NLS-1$
  ELECTION_DETAILS("electiondetails.jsp", R_ALWAYS_ALLOWED), //$NON-NLS-1$
  ERGEBNIS_IMPORT("ergebnisImport.jsp", R_IMPORT), //$NON-NLS-1$
  ERGEBNIS_IMPORT_ADMIN("ergebnisImport.jsp", R_IMPORT_ADM), //$NON-NLS-1$
  GEBIET_EINGANG("gebietEingang.jsp", R_EINGABE), //$NON-NLS-1$
  GEBIET_ERGEBNIS("gebietErgebnis.jsp", R_ALWAYS_ALLOWED), //$NON-NLS-1$
  GEBIET_ERGEBNIS_EK("gebietErgebnisEK.jsp", R_ALWAYS_ALLOWED), //$NON-NLS-1$
  GEBIET_ERGEBNIS_KANDIDAT("gebietErgebnisKandidat.jsp", R_ALWAYS_ALLOWED), //$NON-NLS-1$
  GEBIET_ERGEBNIS_KANDIDAT_EK("gebietErgebnisKandidatEK.jsp", R_ALWAYS_ALLOWED), //$NON-NLS-1$
  GEBIET_ERGEBNIS_KANDIDAT_ZUSAMMENFASSUNG(
      "gebietErgebnisKandidatZusammenfassung.jsp", R_ALWAYS_ALLOWED), //$NON-NLS-1$
  GEBIET_ERGEBNIS_KANDIDAT_ZUSAMMENFASSUNG_EK(
      "gebietErgebnisKandidatZusammenfassungEK.jsp", R_ALWAYS_ALLOWED), //$NON-NLS-1$
  GEBIET_MANUELLE_EINGABE_FREIGEBEN("gebietManuelleEingabeFreigeben.jsp", R_EINGABE_ERLAUBEN), //$NON-NLS-1$
  GEWAEHLTE_KANDIDATEN_ALPHABETISCH("GewaehlteKandidatenAlphabetisch.jsp", R_ALWAYS_ALLOWED), //$NON-NLS-1$
  GEWAEHLTE_KANDIDATEN_NACH_PARTEI("GewaehlteKandidatenNachPartei.jsp", R_ALWAYS_ALLOWED), //$NON-NLS-1$
  HELP("", R_ALWAYS_ALLOWED), //$NON-NLS-1$
  LOGOUT("logout.jsp", R_ALWAYS_ALLOWED), //$NON-NLS-1$
  P4_EXPORT_CSV("P4_Export_CSV.jsp", R_EXPORT), //$NON-NLS-1$
  P4_EXPORT_EML510C("P4_Export_EML510c.jsp", R_EXPORT), //$NON-NLS-1$
  P4_EXPORT_N11("P4_Export_N11.jsp", R_EXPORT), //$NON-NLS-1$
  P4_EXPORT_O3("P4_Export_O3.jsp", R_EXPORT), //$NON-NLS-1$
  P4_EXPORT_OSV4_1("P4_Export_OSV4_1.jsp", R_EXPORT), //$NON-NLS-1$
  P4_EXPORT_OSV4_4("P4_Export_OSV4_4.jsp", R_EXPORT), //$NON-NLS-1$
  P4_EXPORT_OSV4_5("P4_Export_OSV4_5.jsp", R_EXPORT), //$NON-NLS-1$
  P4_EXPORT_OSV4_6("P4_Export_OSV4_6.jsp", R_EXPORT), //$NON-NLS-1$
  P4_EXPORT_REFERENDUM("P4_Export_Referendum.jsp", R_EXPORT), //$NON-NLS-1$
  P4_EXPORT_T11("P4_Export_T11.jsp", R_EXPORT), //$NON-NLS-1$
  P4_EXPORT_WRR83("P4_Export_Wrr83.jsp", R_EXPORT), //$NON-NLS-1$
  P5_BENACHRICHTIGUNG_EXPORT("P5_Benachrichtigung_Export.jsp", R_EXPORT), //$NON-NLS-1$
  P5_CANDIDATE_ADDRESS_EXPORT("P5_Candidate_Address_Export.jsp", R_EXPORT), //$NON-NLS-1$
  P5_P22_1_APPENDIX_EXPORT("P5_P22_1_Appendix_Export.jsp", R_EXPORT), //$NON-NLS-1$
  P5_P22_1_EXPORT("P5_P22_1_Export.jsp", R_EXPORT), //$NON-NLS-1$
  P5_P22_2_APPENDIX_EXPORT("P5_P22_2_Appendix_Export.jsp", R_EXPORT), //$NON-NLS-1$
  P5_P22_2_EXPORT("P5_P22_2_Export.jsp", R_EXPORT), //$NON-NLS-1$
  P5_U16_EXPORT("P5_U16_Export.jsp", R_EXPORT), //$NON-NLS-1$
  PARTEIEN_LISTE("parteienListe.jsp", R_ALWAYS_ALLOWED), //$NON-NLS-1$
  REFERENDUM("referendum.jsp", R_ALWAYS_ALLOWED), //$NON-NLS-1$
  SITZVERTEILUNG_ERG("sitzverteilungErg.jsp", R_ALWAYS_ALLOWED), //$NON-NLS-1$
  STATUS_GEBIET("Status_Gebiet.jsp", R_GEB_STATUS), //$NON-NLS-1$
  STATUS("Status.jsp", R_EINGABE_STATUS), //$NON-NLS-1$
  WAHL_IMPORT("wahlImport.jsp", R_ADM_WAHLCREATEREMOVE); //$NON-NLS-1$

  private final String filename;
  private final Recht recht;

  JspPage(String filename, Recht recht) {
    this.filename = filename;
    this.recht = recht;
  }

  public String getFilename() {
    return filename;
  }

  public Recht getRecht() {
    return recht;
  }
}
