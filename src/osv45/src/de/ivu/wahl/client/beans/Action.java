/*
 * Action
 * 
 * Created on 12.04.2019
 * Copyright (c) 2019 IVU Traffic Technologies AG
 */
package de.ivu.wahl.client.beans;

import de.ivu.wahl.anwender.Recht;

public enum Action {
  CMD_ADM_STIMMBEZIRK_LOESCHEN("adm_Stimmbezirk_loeschen", JspPage.ADM_STIMMBEZIRKE_CREATE), //$NON-NLS-1$
  CMD_ADM_IMPORT_STIMMBEZIRKE("adm_import_Stimmbezirke", JspPage.ADM_STIMMBEZIRKE_EDIT), //$NON-NLS-1$
  CMD_ADM_STIMMBEZIRK_ANZAHL("adm_Stimmbezirk_anzahl", JspPage.ADM_STIMMBEZIRKE_CREATE), //$NON-NLS-1$

  CMD_ADM_CHANGE_PW("adm_change_pw", JspPage.ADM_ANWENDER_CHANGE_PW), //$NON-NLS-1$
  CMD_ADM_DEL_ANWENDER("adm_delAnwender", JspPage.ADM_ANWENDER_SELECT_DELETE), //$NON-NLS-1$
  CMD_ADM_SAVE_ANWENDER("adm_saveAnwender", JspPage.ADM_ANWENDER_EDIT), //$NON-NLS-1$
  CMD_ADM_PROP_EINGABE("adm_propEingabe", JspPage.ADM_PROPS), //$NON-NLS-1$
  CMD_ADM_FREIGABE("adm_freigabe", JspPage.ADM_FREIGABE), //$NON-NLS-1$
  CMD_ADM_RE_INDEX_DATABASE("adm_re_index_database", JspPage.ADM_RE_INDEX_DATABASE), //$NON-NLS-1$
  CMD_ADM_KANDIDATEN_WAEHLBAR("adm_Kandidaten_waehlbar", JspPage.ADM_KANDIDAT_WAEHLBAR), //$NON-NLS-1$
  CMD_ADM_VOTE_VALUES("adm_vote_values", JspPage.ADM_VOTE_VALUES), //$NON-NLS-1$

  CMD_ADM_EXPORT_P22_1("adm_exportP22_1", JspPage.P5_P22_1_EXPORT), //$NON-NLS-1$
  CMD_ADM_EXPORT_P22_1_APPENDIX("adm_exportP22_1Appendix", JspPage.P5_P22_1_APPENDIX_EXPORT), //$NON-NLS-1$
  CMD_ADM_EXPORT_P22_2("adm_exportP22_2", JspPage.P5_P22_2_EXPORT), //$NON-NLS-1$
  CMD_ADM_EXPORT_P22_2_APPENDIX("adm_exportP22_2Appendix", JspPage.P5_P22_2_APPENDIX_EXPORT), //$NON-NLS-1$
  CMD_ADM_EXPORT_U16("adm_exportU16", JspPage.P5_U16_EXPORT), //$NON-NLS-1$
  CMD_ADM_EXPORT_CANDIDATE_ADDRESS(
      "adm_exportCandidateAddress", JspPage.P5_CANDIDATE_ADDRESS_EXPORT), //$NON-NLS-1$
  CMD_ADM_EXPORT_KAN_BEN("adm_exportKanBen", JspPage.P5_BENACHRICHTIGUNG_EXPORT), //$NON-NLS-1$

  CMD_ADM_PROP_EINGABE_P22_1_1("adm_propEingabeP22_1_1", JspPage.P5_P22_1_EXPORT), //$NON-NLS-1$
  CMD_ADM_PROP_EINGABE_P22_1_APPENDIX_1(
      "adm_propEingabeP22_1_Appendix_1", JspPage.P5_P22_1_APPENDIX_EXPORT), //$NON-NLS-1$
  CMD_ADM_PROP_EINGABE_P22_2_1("adm_propEingabeP22_2_1", JspPage.P5_P22_2_EXPORT), //$NON-NLS-1$
  CMD_ADM_PROP_EINGABE_P22_2_APPENDIX_2(
      "adm_propEingabeP22_2_Appendix_2", JspPage.P5_P22_2_APPENDIX_EXPORT), //$NON-NLS-1$
  CMD_ADM_PROP_EINGABE_U16_1("adm_propEingabeU16_1", JspPage.P5_U16_EXPORT), //$NON-NLS-1$
  CMD_ADM_PROP_EINGABE_GEW_BEN("adm_propEingabeGewBen", JspPage.P5_BENACHRICHTIGUNG_EXPORT), //$NON-NLS-1$

  APP_START_SITZBERECHNUNG("app_startSitzberechnung", JspPage.SITZVERTEILUNG_ERG), //$NON-NLS-1$
  APP_SET_KONFLIKT_ALTERNATIVE("app_setKonfliktAlternative", JspPage.SITZVERTEILUNG_ERG), //$NON-NLS-1$

  EINGABE_EINGABE("eingabe_eingabe", JspPage.GEBIET_EINGANG), //$NON-NLS-1$
  EINGABE_ERLAUBEN("eingabe_erlauben", JspPage.GEBIET_MANUELLE_EINGABE_FREIGEBEN), //$NON-NLS-1$

  EXP_P4_EXPORT_P4_EML510C("expP4_exportP4_EML510c", JspPage.P4_EXPORT_EML510C), //$NON-NLS-1$
  EXP_P4_EXPORT_P4_EMPTY_EML("expP4_exportP4_EmptyEml", JspPage.ADM_EMPTY_EXPORT), //$NON-NLS-1$
  EXP_P4_EXPORT_P4_N10_1("expP4_exportP4_N10_1", JspPage.ADM_N10_1_EXPORT), //$NON-NLS-1$
  EXP_P4_EXPORT_P4_N11("expP4_exportP4_N11", JspPage.P4_EXPORT_N11), //$NON-NLS-1$
  EXP_P4_EXPORT_P4_O3("expP4_exportP4_O3", JspPage.P4_EXPORT_O3), //$NON-NLS-1$
  EXP_P4_EXPORT_P4_OSV4_1("expP4_exportP4_OSV4_1", JspPage.P4_EXPORT_OSV4_1), //$NON-NLS-1$
  EXP_P4_EXPORT_P4_OSV4_4("expP4_exportP4_OSV4_4", JspPage.P4_EXPORT_OSV4_4), //$NON-NLS-1$
  EXP_P4_EXPORT_P4_OSV4_5("expP4_exportP4_OSV4_5", JspPage.P4_EXPORT_OSV4_5), //$NON-NLS-1$
  EXP_P4_EXPORT_P4_REFERENDUM("expP4_exportP4_Referendum", JspPage.P4_EXPORT_REFERENDUM), //$NON-NLS-1$
  EXP_P4_EXPORT_P4_T11("expP4_exportP4_T11", JspPage.P4_EXPORT_T11), //$NON-NLS-1$
  EXP_P4_EXPORT_P4_VOTES_CSV("expP4_exportP4_CSV", JspPage.P4_EXPORT_CSV), //$NON-NLS-1$
  EXP_P4_EXPORT_P4_WRR83("expP4_exportP4_WRR83", JspPage.P4_EXPORT_WRR83), //$NON-NLS-1$
  EXP_P4_EXPORT_P4_OSV4_6("expP4_exportP4_OSV4_6", JspPage.P4_EXPORT_OSV4_6), //$NON-NLS-1$

  EXP_P4_PROP_EINGABE_N11("expP4_propEingabeN11", JspPage.P4_EXPORT_N11), //$NON-NLS-1$
  EXP_P4_PROP_EINGABE_O3("expP4_propEingabeO3", JspPage.P4_EXPORT_O3), //$NON-NLS-1$
  EXP_P4_PROP_EINGABE_OSV4_4("expP4_propEingabeOSV4_4", JspPage.P4_EXPORT_OSV4_4), //$NON-NLS-1$
  EXP_P4_PROP_EINGABE_OSV4_5("expP4_propEingabeOSV4_5", JspPage.P4_EXPORT_OSV4_5), //$NON-NLS-1$
  EXP_P4_PROP_EINGABE_T11("expP4_propEingabeT11", JspPage.P4_EXPORT_T11), //$NON-NLS-1$
  EXP_P4_PROP_EINGABE_WRR83("expP4_propEingabeWrr83", JspPage.P4_EXPORT_WRR83); //$NON-NLS-1$

  private final String key;
  private final JspPage jspPage;

  @SuppressWarnings("hiding")
  Action(String key, JspPage jspPage) {
    this.key = key;
    this.jspPage = jspPage;
  }

  public String getKey() {
    return key;
  }

  public boolean hasKey(String anotherKey) {
    return key.equals(anotherKey);
  }

  public JspPage getJspPage() {
    return jspPage;
  }

  public Recht getRecht() {
    return jspPage.getRecht();
  }

}
