/*
 * Copyright (c) 2010-2014 IVU Traffic Technologies AG
 */
package de.ivu.wahl.client.beans;

import static de.ivu.wahl.anwender.Rechte.R_ADM_ANGEMELDETE;
import static de.ivu.wahl.anwender.Rechte.R_ADM_ANW_AENDERN;
import static de.ivu.wahl.anwender.Rechte.R_ADM_ANW_ANLEGEN;
import static de.ivu.wahl.anwender.Rechte.R_ADM_EMPTY_EML_EXPORT;
import static de.ivu.wahl.anwender.Rechte.R_ADM_N10_1_EXPORT;
import static de.ivu.wahl.anwender.Rechte.R_ADM_PROPS;
import static de.ivu.wahl.anwender.Rechte.R_ADM_STIMMBEZIRKE_EDIT;
import static de.ivu.wahl.anwender.Rechte.R_EXPORT;
import static de.ivu.wahl.anwender.Rechte.R_FREIGABE;
import static de.ivu.wahl.anwender.Rechte.R_IMPORT;
import static de.ivu.wahl.anwender.Rechte.R_UPLOAD;
import static de.ivu.wahl.client.util.GUICommand.GUI_CLASS_1;
import static de.ivu.wahl.modell.GebietModel.GEBIETSART_GEMEINDE;
import static de.ivu.wahl.modell.GebietModel.GEBIETSART_STIMMBEZIRK;
import static de.ivu.wahl.modell.GebietModel.GEBIETSART_WAHLKREIS;

import java.util.Map;

import de.ivu.wahl.WahlInfo;
import de.ivu.wahl.anwender.Rechte;
import de.ivu.wahl.client.util.GUICommand;
import de.ivu.wahl.modell.ErgebniseingangKonstanten;
import de.ivu.wahl.modell.GebietModel;
import de.ivu.wahl.wus.electioncategory.ElectionSubcategory;

/**
 * Common super class for all InitGuiCommand subclasses for program P4 (except Referendum)
 */
public abstract class InitGuiCommand_P4 extends InitGuiCommand implements ApplicationBeanKonstanten {

  protected final int _ebene;
  protected final int TOP_LEVEL = getTopLevel();

  protected final int LEVEL_WKR = getGebiete()[1];
  protected final int LEVEL_GEM = getGebiete()[2];
  protected final int LEVEL_STIMMBEZ = getGebiete().length <= 3 ? 0 : getGebiete()[3];

  abstract protected int[] getGebiete();

  /**
   * May be overwriten in subclasses
   */
  protected int getTopLevel() {
    return GEBIETSART_WAHLKREIS;
  }

  protected boolean isGrOrBcOrGc() {
    return false;
  }

  protected boolean isEk() {
    return false;
  }

  /**
   * @param jspMap Beziehung zwischen work-Kodierung und JSPs
   * @param ebene
   * @param gebietsartErfassungseinheitMax Gebietsart der hierarchisch <b>niedrigsten</b>
   *          Erfassungseinheit im Gebietsbaum
   */
  public InitGuiCommand_P4(Map<Integer, String> jspMap,
      int gebietsartErfassungseinheitMax,
      int ebene) {
    super(jspMap, gebietsartErfassungseinheitMax);
    _ebene = ebene;
  }

  @Override
  protected int[][] getWahlartLevels() {
    switch (_ebene) {
      case GebietModel.EBENE_CSB :
        return new int[][]{{TOP_LEVEL}};
      case GebietModel.EBENE_HSB :
        return new int[][]{{GEBIETSART_GEMEINDE}};
      case GebietModel.EBENE_PSB :
        return new int[][]{{GEBIETSART_STIMMBEZIRK}};
      default :
        return new int[][]{{TOP_LEVEL}};
    }
  }

  @Override
  protected int[][] getAdminWahlartLevels() {
    return getWahlartLevels();
  }

  @Override
  protected void initBefehle(Map<String, String> jspLevelWorkName,
      GUICommandList[] befehleInitial,
      GUICommandList[] befehle,
      int levelcount,
      String link_1,
      String linkButtonName_1,
      String link_2,
      String linkButtonName_2) {
    for (int level = 0; level < levelcount; level++) {
      befehleInitial[level] = new GUICommandArrayList();
      befehle[level] = new GUICommandArrayList();
    }
    initLevelUnabhaengig(jspLevelWorkName,
        befehleInitial,
        link_1,
        linkButtonName_1,
        link_2,
        linkButtonName_2);
    initLevelAdmin(jspLevelWorkName, befehleInitial);
    if (isGrOrBcOrGc()) {
      initLevelStimmbezirk(jspLevelWorkName, befehleInitial);
    } else {
      switch (_ebene) {
        case GebietModel.EBENE_CSB :
          initLevelWahlkreis(jspLevelWorkName, befehleInitial);
          break;
        case GebietModel.EBENE_HSB :
          initLevelGemeinde(jspLevelWorkName, befehleInitial);
          break;
        case GebietModel.EBENE_PSB :
          initLevelStimmbezirk(jspLevelWorkName, befehleInitial);
          break;
      }
    }
  }

  private void initLevelWahlkreis(Map<String, String> jspLevelWorkName,
      GUICommandList[] befehleInitial) {
    GUICommand cmd;
    String name;
    name = getBundleString("Ergebnisimport_P4"); //$NON-NLS-1$
    jspLevelWorkName.put(LEVEL_WKR + "_" + IMPORT_ERGEBNISSE, name); //$NON-NLS-1$
    cmd = createCommand(name, IMPORT_ERGEBNISSE, R_IMPORT, false, "ergebnisImport.jsp", //$NON-NLS-1$
        getBundleString("Ergebnisimport_titel_P4"), //$NON-NLS-1$
        GUI_CLASS_1);
    befehleInitial[LEVEL_WKR].add(cmd);
  }

  protected void initLevelGemeinde(Map<String, String> jspLevelWorkName,
      GUICommandList[] befehleInitial) {
    GUICommand cmd;
    String name;

    name = getBundleString("Ergebnisimport_P4"); //$NON-NLS-1$
    jspLevelWorkName.put(LEVEL_GEM + "_" + IMPORT_ERGEBNISSE, name); //$NON-NLS-1$
    cmd = createCommand(name, IMPORT_ERGEBNISSE, R_IMPORT, false, "ergebnisImport.jsp", //$NON-NLS-1$
        getBundleString("Ergebnisimport_titel_P4"), //$NON-NLS-1$
        GUI_CLASS_1);
    befehleInitial[LEVEL_GEM].add(cmd);
  }

  private void initLevelStimmbezirk(Map<String, String> jspLevelWorkName,
      GUICommandList[] befehleInitial) {
    GUICommand cmd;
    String name;
    if (isGrOrBcOrGc()) {
      // Gebietseingabe auf allen Gebieten
      name = getBundleString("Gebiet_Eingabe"); //$NON-NLS-1$
      cmd = createCommand(name, GEBE, Rechte.R_EINGABE, false, "gebietEingang.jsp", //$NON-NLS-1$
          getBundleString("Gebiet_Eingabe_titel"), //$NON-NLS-1$
          GUI_CLASS_1);
      cmd.setNurErfassungseinheit(true);
      cmd.setPosition(0);
      jspLevelWorkName.put(LEVEL_STIMMBEZ + "_" + GEBE, name); //$NON-NLS-1$
      befehleInitial[LEVEL_STIMMBEZ].add(cmd);
    }

    name = getBundleString("Ergebnisimport_P4"); //$NON-NLS-1$
    jspLevelWorkName.put(LEVEL_STIMMBEZ + "_" + IMPORT_ERGEBNISSE, name); //$NON-NLS-1$
    cmd = createCommand(name, IMPORT_ERGEBNISSE, Rechte.R_IMPORT_ADM, false, "ergebnisImport.jsp", //$NON-NLS-1$
        getBundleString("Ergebnisimport_titel_P4"), //$NON-NLS-1$
        GUI_CLASS_1);
    befehleInitial[LEVEL_STIMMBEZ].add(cmd);
  }

  /**
   * initLevelAdmin
   * 
   * @param jspLevelWorkName
   * @param befehleInitial
   */
  private void initLevelAdmin(Map<String, String> jspLevelWorkName, GUICommandList[] befehleInitial) {

    InitGuiCommandHelper helper = new InitGuiCommandHelper(this, jspLevelWorkName,
        befehleInitial[LEVEL_ADMIN], LEVEL_ADMIN);
    helper.setGuiClass(GUI_CLASS_1);

    helper.setRights(null);
    helper.addCommand(ANWENDER_VERAENDERN_PASSWORT,
        "Passwort_veraendern", "Passwort_veraendern_titel", "adm_anwender_change_pw.jsp"); //$NON-NLS-1$//$NON-NLS-2$ //$NON-NLS-3$

    helper.setRights(R_ADM_ANGEMELDETE);
    helper
        .addCommand(ADM_ANW_LISTE,
            "Angemeldete_Anwender_anzeigen", "Angemeldete_Anwender_anzeigen_titel", "adm_angemeldeteAnwender.jsp"); //$NON-NLS-1$//$NON-NLS-2$ //$NON-NLS-3$

    helper.setRights(R_ADM_ANW_ANLEGEN);
    helper.addCommand(ANWENDER_ANLEGEN,
        "Anwender_anlegen", "Anwender_anlegen_titel", "adm_anwender_edit.jsp"); //$NON-NLS-1$//$NON-NLS-2$ //$NON-NLS-3$

    // Without helper ...
    String name = getBundleString("Anwender_veraendern"); //$NON-NLS-1$
    jspLevelWorkName.put(LEVEL_ADMIN + "_" + ANWENDER_VERAENDERN_1_AUSWAHLEN, name); //$NON-NLS-1$
    jspLevelWorkName.put(LEVEL_ADMIN + "_" + ANWENDER_VERAENDERN_2_EDIT, name); //$NON-NLS-1$
    befehleInitial[LEVEL_ADMIN].add(createCommand(name,
        ANWENDER_VERAENDERN_1_AUSWAHLEN,
        R_ADM_ANW_AENDERN,
        false,
        "adm_anwender_select.jsp", //$NON-NLS-1$
        getBundleString("Anwender_veraendern_titel"), //$NON-NLS-1$
        GUI_CLASS_1));
    // die zweite Seite in die HashMap
    _jspMap.put(ANWENDER_VERAENDERN_2_EDIT, "adm_anwender_edit.jsp"); //$NON-NLS-1$

    helper.setRights(R_ADM_ANW_ANLEGEN);
    helper.addCommand(ANWENDER_LOESCHEN,
        "Anwender_loeschen", "Anwender_loeschen_titel", "adm_anwender_select.jsp"); //$NON-NLS-1$//$NON-NLS-2$ //$NON-NLS-3$

    if (GebietModel.EBENE_PSB == _ebene) {
      helper.setRights(R_ADM_STIMMBEZIRKE_EDIT);
      helper.addCommand(ADM_STIMMBEZIRKE_EDIT,
          "Stimmbezirke_bearbeiten", "Stimmbezirke_bearbeiten_titel", "adm_stimmbezirke.jsp"); //$NON-NLS-1$//$NON-NLS-2$ //$NON-NLS-3$
    }

    helper.setRights(R_ADM_PROPS);
    helper.addCommand(ADM_PROPS,
        "Grundeinstellungen_aendern", "Grundeinstellungen_aendern_titel", "adm_props.jsp"); //$NON-NLS-1$//$NON-NLS-2$ //$NON-NLS-3$

    final String titleKey;
    final String nameKey;
    if (isGrOrBcOrGc()) {
      titleKey = "Export_P4_titel_EmptyTellingTotaaltelling"; //$NON-NLS-1$
      nameKey = "Export_P4_EmptyTellingTotaaltelling"; //$NON-NLS-1$
    } else {
      if (GebietModel.EBENE_CSB == _ebene) {
        nameKey = "Export_P4_EmptyTotaaltelling"; //$NON-NLS-1$
        titleKey = "Export_P4_titel_EmptyTotaaltelling"; //$NON-NLS-1$
      } else {
        nameKey = "Export_P4_EmptyTelling"; //$NON-NLS-1$
        titleKey = "Export_P4_titel_EmptyTelling"; //$NON-NLS-1$
      }
    }
    helper.setRights(R_ADM_EMPTY_EML_EXPORT);
    helper.addCommand(ADM_EMPTY_EML_EXPORT, nameKey, titleKey, "adm_empty_export.jsp"); //$NON-NLS-1$

    if (GebietModel.EBENE_PSB == _ebene) {
      helper.setRights(R_ADM_N10_1_EXPORT);
      helper.addCommand(ADM_N10_1_EXPORT,
          "Export_P4_N10_1", "Export_P4_titel_N10_1", "adm_n10_1_export.jsp"); //$NON-NLS-1$//$NON-NLS-2$ //$NON-NLS-3$
    }

    helper.setRights(R_UPLOAD);
    helper.addCommand(UPLOAD_RGTEXT, "Upload_rgtext", "Upload_rgtext_titel", "rgtextUpload.jsp"); //$NON-NLS-1$//$NON-NLS-2$ //$NON-NLS-3$

    helper.setRights(R_UPLOAD);
    helper.addCommand(RESET_RGTEXT, "Reset_rgtext", "Reset_rgtext_titel", "rgtextReset.jsp"); //$NON-NLS-1$//$NON-NLS-2$ //$NON-NLS-3$
  }

  /**
   * initLevelUnabhaengig
   * 
   * @param jspLevelWorkName
   * @param befehleInitial
   */
  protected void initLevelUnabhaengig(Map<String, String> jspLevelWorkName,
      GUICommandList[] befehleInitial,
      @SuppressWarnings("unused") String link_1,
      @SuppressWarnings("unused") String linkButtonName_1,
      @SuppressWarnings("unused") String link_2,
      @SuppressWarnings("unused") String linkButtonName_2) {

    GUICommand cmd;
    String name;
    /*
     * Gebietseingabe auf allen Gebieten
     */
    if (!isGrOrBcOrGc()) {
      name = getBundleString("Gebiet_Eingabe"); //$NON-NLS-1$
      cmd = createCommand(name, GEBE, Rechte.R_EINGABE, false, "gebietEingang.jsp", //$NON-NLS-1$
          getBundleString("Gebiet_Eingabe_titel"), //$NON-NLS-1$
          GUI_CLASS_1);
      cmd.setNurErfassungseinheit(true);
      cmd.setPosition(0);
      jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + GEBE, name); //$NON-NLS-1$
      befehleInitial[LEVEL_UNABHAENGIG].add(cmd);
    }

    /*
     * Gebietsergebnis auf allen Gebieten
     */
    name = getBundleString("Gebiet_Ergebnis"); //$NON-NLS-1$
    cmd = createCommand(name, GEB_ERG, null, false, "gebietErgebnis.jsp", //$NON-NLS-1$
        getBundleString("Gebiet_Ergebnis_titel"), //$NON-NLS-1$
        GUI_CLASS_1);
    cmd.setNurGebiete(true);
    // cmd.setPosition(1);
    initCommandGebietErgebnis(cmd);
    jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + GEB_ERG, name); //$NON-NLS-1$
    befehleInitial[LEVEL_UNABHAENGIG].add(cmd);

    createCommandGebietErgebnisKandidat(jspLevelWorkName, befehleInitial);

    name = getBundleString("Gebiet_Status"); //$NON-NLS-1$
    cmd = createCommand(name, STATUS_GEB, Rechte.R_GEB_STATUS, false, "Status_Gebiet.jsp", //$NON-NLS-1$
        getBundleString("Gebiet_Status_titel"), //$NON-NLS-1$
        GUI_CLASS_1);
    cmd.setNurErfassungseinheit(true);
    jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + STATUS_GEB, name); //$NON-NLS-1$
    befehleInitial[LEVEL_UNABHAENGIG].add(cmd);

    name = getBundleString("Status"); //$NON-NLS-1$
    cmd = createCommand(name, STATUS, Rechte.R_EINGABE, false, "Status.jsp", //$NON-NLS-1$
        tooltipStatusCommand(),
        GUI_CLASS_1);
    cmd.setNurWurzelgebiet(true);
    jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + STATUS, name); //$NON-NLS-1$
    befehleInitial[LEVEL_UNABHAENGIG].add(cmd);

    name = getBundleString("Freigabesteuerung"); //$NON-NLS-1$
    jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + ADM_FREIGABE, name); //$NON-NLS-1$
    cmd = createCommand(name, ADM_FREIGABE, R_FREIGABE, false, "adm_freigabe.jsp", //$NON-NLS-1$
        name = getBundleString("Freigabesteuerung_titel"), //$NON-NLS-1$
        GUI_CLASS_1);
    cmd.setNurWurzelgebiet(true);
    befehleInitial[LEVEL_UNABHAENGIG].add(cmd);

    if (GebietModel.EBENE_PSB == _ebene) {
      name = getBundleString("Export_P4_N11"); //$NON-NLS-1$
      jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + N11, name); //$NON-NLS-1$
      cmd = createCommand(name, N11, R_EXPORT, false, "P4_Export_N11.jsp", //$NON-NLS-1$
          getBundleString("Export_P4_titel_N11"), //$NON-NLS-1$
          GUI_CLASS_1);
      cmd.setNurWurzelgebiet(true);
      befehleInitial[LEVEL_UNABHAENGIG].add(cmd);
    }
    // Export O3 only, when 510c will be exported--> only HSB
    if (GebietModel.EBENE_HSB == _ebene) {
      if (isEk()) {
        name = getBundleString("Export_P4_T11"); //$NON-NLS-1$
        jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + T11, name); //$NON-NLS-1$
        cmd = createCommand(name, T11, R_EXPORT, false, "P4_Export_T11.jsp", //$NON-NLS-1$
            getBundleString("Export_P4_titel_T11"), //$NON-NLS-1$
            GUI_CLASS_1);
        cmd.setNurWurzelgebiet(true);
        befehleInitial[LEVEL_UNABHAENGIG].add(cmd);

        name = getBundleString("Export_P4_OSV4_5"); //$NON-NLS-1$
        jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + OSV4_5, name); //$NON-NLS-1$
        cmd = createCommand(name, OSV4_5, R_EXPORT, false, "P4_Export_OSV4_5.jsp", //$NON-NLS-1$
            getBundleString("Export_P4_titel_OSV4_5"), //$NON-NLS-1$
            GUI_CLASS_1);
        cmd.setNurWurzelgebiet(true);
        befehleInitial[LEVEL_UNABHAENGIG].add(cmd);
      } else if (ElectionSubcategory.PS1.equals(WahlInfo.getWahlInfo().getElectionSubcategory())) {
        name = getBundleString("Export_P4_EML510c"); //$NON-NLS-1$
        jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + EML510c, name); //$NON-NLS-1$
        cmd = createCommand(name, EML510c, R_EXPORT, false, "P4_Export_EML510c.jsp", //$NON-NLS-1$
            getBundleString("Export_P4_titel_EML510c"), //$NON-NLS-1$
            GUI_CLASS_1);
        cmd.setNurWurzelgebiet(true);
        befehleInitial[LEVEL_UNABHAENGIG].add(cmd);
      } else {
        name = getBundleString("Export_P4_O3"); //$NON-NLS-1$
        jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + O3, name); //$NON-NLS-1$
        cmd = createCommand(name, O3, R_EXPORT, false, "P4_Export_O3.jsp", //$NON-NLS-1$
            getBundleString("Export_P4_titel_O3"), //$NON-NLS-1$
            GUI_CLASS_1);
        cmd.setNurWurzelgebiet(true);
        befehleInitial[LEVEL_UNABHAENGIG].add(cmd);

        name = getBundleString("Export_P4_Appendix_O3"); //$NON-NLS-1$
        jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + OSV4_4, name); //$NON-NLS-1$
        cmd = createCommand(name, OSV4_4, R_EXPORT, false, "P4_Export_OSV4_4.jsp", //$NON-NLS-1$
            getBundleString("Export_P4_titel_Appendix_O3"), //$NON-NLS-1$
            GUI_CLASS_1);
        cmd.setNurWurzelgebiet(true);
        befehleInitial[LEVEL_UNABHAENGIG].add(cmd);
      }
    }
    // Export OSV4_1 only, when 510d will be exported --> only CSB
    if (GebietModel.EBENE_CSB == _ebene) {
      name = getBundleString("Export_P4_OSV4_1"); //$NON-NLS-1$
      jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + OSV4_1, name); //$NON-NLS-1$
      cmd = createCommand(name, OSV4_1, R_EXPORT, false, "P4_Export_OSV4_1.jsp", //$NON-NLS-1$
          getBundleString("Export_P4_titel_OSV4_1"), //$NON-NLS-1$
          GUI_CLASS_1);
      cmd.setNurWurzelgebiet(true);
      befehleInitial[LEVEL_UNABHAENGIG].add(cmd);
    }
    // Export CSV
    name = getBundleString("Export_P4_CSV"); //$NON-NLS-1$
    jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + VOTES_CSV, name); //$NON-NLS-1$
    cmd = createCommand(name, VOTES_CSV, R_EXPORT, false, "P4_Export_CSV.jsp", //$NON-NLS-1$
        getBundleString("Export_P4_titel_CSV"), //$NON-NLS-1$
        GUI_CLASS_1);
    cmd.setNurWurzelgebiet(true);
    befehleInitial[LEVEL_UNABHAENGIG].add(cmd);
    // export directory
    name = getBundleString("ExportVerzeichnis"); //$NON-NLS-1$
    jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + EXPORT_VERZEICHNIS, name); //$NON-NLS-1$
    cmd = createCommand(name, EXPORT_VERZEICHNIS, R_EXPORT, false, "dateiExportVerzeichnis.jsp", //$NON-NLS-1$
        getBundleString("Export_Verzeichnis_titel"), //$NON-NLS-1$
        GUI_CLASS_1);
    cmd.setNurWurzelgebiet(true);
    befehleInitial[LEVEL_UNABHAENGIG].add(cmd);

    name = getBundleString("Hilfe"); //$NON-NLS-1$
    // hilfe cmd kommt in alle Arrays hinten dran
    cmd = createCommand(name, HELP, null, false, "", //$NON-NLS-1$
        getBundleString("Hilfe_titel"), //$NON-NLS-1$
        GUICommand.GUI_CLASS_6);
    cmd.setAlleLevel(true);
    jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + HELP, name); //$NON-NLS-1$
    befehleInitial[LEVEL_UNABHAENGIG].add(cmd);

    name = getBundleString("Abmelden"); //$NON-NLS-1$
    // logout cmd kommt in alle Arrays hinten dran
    cmd = createCommand(name, SONST_LOGOUT, null, false, "logout.jsp", //$NON-NLS-1$
        getBundleString("Abmelden_titel"), //$NON-NLS-1$
        GUICommand.GUI_CLASS_6);
    cmd.setAlleLevel(true);
    jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + SONST_LOGOUT, name); //$NON-NLS-1$
    befehleInitial[LEVEL_UNABHAENGIG].add(cmd);

    name = getBundleString("ElectionDetails"); //$NON-NLS-1$
    // wahldetails cmd kommt in alle Arrays hinten dran
    cmd = createCommand(name, SONST_ELECTIONDETAILS, null, false, "electiondetails.jsp", //$NON-NLS-1$
        getBundleString("ElectionDetails_titel"), //$NON-NLS-1$
        GUICommand.GUI_CLASS_6);
    cmd.setAlleLevel(true);
    jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + SONST_ELECTIONDETAILS, name); //$NON-NLS-1$
    befehleInitial[LEVEL_UNABHAENGIG].add(cmd);
  }

  private String tooltipStatusCommand() {
    if (isEk()) {
      return getBundleString("Status_titel_EK"); //$NON-NLS-1$
    }
    if (_ebene == GebietModel.EBENE_CSB) {
      return getBundleString("Status_titel_CSB"); //$NON-NLS-1$
    } else if (_ebene == GebietModel.EBENE_HSB) {
      return getBundleString("Status_titel_HSB"); //$NON-NLS-1$
    } else {
      return getBundleString("Status_titel"); //$NON-NLS-1$
    }
  }

  @Override
  public int getGebieteWorkDefault() {
    return GEB_ERG;
  }

  @Override
  public int getErfassungseinheitUnvollstaendigWork(int ergebniseingangStatus) {
    switch (_ebene) {
      case GebietModel.EBENE_PSB :
        return GEBE;

      case GebietModel.EBENE_HSB :
      case GebietModel.EBENE_CSB :
        if (ergebniseingangStatus == ErgebniseingangKonstanten.STATE_FIRST_RESULT_OK
            || ergebniseingangStatus == ErgebniseingangKonstanten.STATE_WARNING
            || ergebniseingangStatus == ErgebniseingangKonstanten.STATE_ERROR) {
          return GEBE;
        }
        return IMPORT_ERGEBNISSE;

      default :
        return GEB_ERG;
    }
  }

  protected abstract void initCommandGebietErgebnis(GUICommand cmd);

  protected abstract void createCommandGebietErgebnisKandidat(Map<String, String> jspLevelWorkName,
      GUICommandList[] befehleInitial);

}
