/*
 * Copyright (c) 2010 IVU Traffic Technologies AG
 */
package de.ivu.wahl.client.beans;

import static de.ivu.wahl.anwender.Rechte.R_ADM_ANGEMELDETE;
import static de.ivu.wahl.anwender.Rechte.R_ADM_ANW_AENDERN;
import static de.ivu.wahl.anwender.Rechte.R_ADM_ANW_ANLEGEN;
import static de.ivu.wahl.anwender.Rechte.R_ADM_KANDIDAT_WAEHLBAR;
import static de.ivu.wahl.anwender.Rechte.R_ADM_VOTE_VALUES;
import static de.ivu.wahl.anwender.Rechte.R_EXPORT;
import static de.ivu.wahl.anwender.Rechte.R_FREIGABE;
import static de.ivu.wahl.anwender.Rechte.R_IMPORT;
import static de.ivu.wahl.anwender.Rechte.R_UPLOAD;
import static de.ivu.wahl.client.util.GUICommand.GUI_CLASS_1;
import static de.ivu.wahl.modell.GebietModel.GEBIETSART_WAHLKREIS;

import java.util.Map;

import de.ivu.wahl.client.util.GUICommand;

/**
 * @author jon@ivu.de, IVU Traffic Technologies AG
 */
public abstract class InitGuiCommand_P5 extends InitGuiCommand implements ApplicationBeanKonstanten {

  protected final int topLevel = getTopLevel();

  private static final int[][] WAHL_ART_LEVEL = {{GEBIETSART_WAHLKREIS}};
  private static final int[][] ADMIN_WAHL_ART_LEVEL = {{GEBIETSART_WAHLKREIS}};
  protected static final String MODEL_P22_1 = "P22-1"; //$NON-NLS-1$
  protected static final String MODEL_P22_2 = "P22-2"; //$NON-NLS-1$
  protected static final String MODEL_U16 = "U16"; //$NON-NLS-1$

  abstract protected int getTopLevel();

  abstract protected String modelForProtocol();

  abstract protected String getGebietErgebnisBundleString();

  protected String getLowerGebietErgebnisBundleString() {
    return "Gebiet_Ergebnis_WK"; //$NON-NLS-1$
  }

  /**
   * @param jspMap Beziehung zwischen work-Kodierung und JSPs
   * @param gebietsartErfassungseinheitMax Gebietsart der hierarchisch <b>niedrigsten</b>
   *          Erfassungseinheit im Gebietsbaum
   */
  public InitGuiCommand_P5(Map<Integer, String> jspMap, int gebietsartErfassungseinheitMax) {
    super(jspMap, gebietsartErfassungseinheitMax);
  }

  @Override
  protected int[][] getWahlartLevels() {
    return WAHL_ART_LEVEL;
  }

  @Override
  protected int[][] getAdminWahlartLevels() {
    return ADMIN_WAHL_ART_LEVEL;
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
    initTopLevel(jspLevelWorkName, befehleInitial);
  }

  /**
   * initTopLevel
   * 
   * @param jspLevelWorkName
   * @param befehleInitial
   */
  private void initTopLevel(Map<String, String> jspLevelWorkName, GUICommandList[] befehleInitial) {
    InitGuiCommandHelper helper = new InitGuiCommandHelper(this, jspLevelWorkName,
        befehleInitial[topLevel], topLevel);
    helper.setGuiClass(GUI_CLASS_1);
    helper.setRights(R_IMPORT);

    helper.addCommand(IMPORT_ERGEBNISSE,
        "Ergebnisimport_P5", "Ergebnisimport_titel_P5", "ergebnisImport.jsp"); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
    helper.setRights(null);
    String gebietErgebnisJsp = isEKElection() ? "gebietErgebnisEK.jsp" : "gebietErgebnis.jsp"; //$NON-NLS-1$ //$NON-NLS-2$
    helper.addCommand(GEB_ERG,
        getGebietErgebnisBundleString(),
        "Gebiet_Ergebnis_titel", gebietErgebnisJsp); //$NON-NLS-1$

    createCommandGebietErgebnisKandidat(jspLevelWorkName, befehleInitial);

    GUICommand cmd;
    String name;

    if (isEKElection()) {
      name = getBundleString("Vote_Values"); //$NON-NLS-1$
      jspLevelWorkName.put(topLevel + "_" + ADM_VOTE_VALUES, name); //$NON-NLS-1$
      cmd = createCommand(name, ADM_VOTE_VALUES, R_ADM_VOTE_VALUES, true, "adm_vote_values.jsp", //$NON-NLS-1$
          getBundleString("Vote_Values_titel"), //$NON-NLS-1$
          GUI_CLASS_1);
      befehleInitial[topLevel].add(cmd);
    }

    name = getBundleString("Kandidat_waehlbar"); //$NON-NLS-1$
    jspLevelWorkName.put(topLevel + "_" + ADM_KANDIDAT_WAEHLBAR, name); //$NON-NLS-1$
    cmd = createCommand(name,
        ADM_KANDIDAT_WAEHLBAR,
        R_ADM_KANDIDAT_WAEHLBAR,
        true,
        "adm_kandidat_waehlbar.jsp", //$NON-NLS-1$
        getBundleString("Kandidat_waehlbar_titel"), //$NON-NLS-1$
        GUI_CLASS_1);
    befehleInitial[topLevel].add(cmd);

    name = getBundleString("Sitzverteilung"); //$NON-NLS-1$
    jspLevelWorkName.put(topLevel + "_" + AUSW_SITZVERTEILUNG_GEBIET, name); //$NON-NLS-1$
    cmd = createCommand(name, AUSW_SITZVERTEILUNG_GEBIET, null, false, "sitzverteilungErg.jsp", //$NON-NLS-1$
        getBundleString("Sitzverteilung_titel"), //$NON-NLS-1$
        GUI_CLASS_1);
    befehleInitial[topLevel].add(cmd);

    if (!isEKElection()) {
      name = getBundleString("SitzverteilungLK"); //$NON-NLS-1$
      jspLevelWorkName.put(topLevel + "_" + AUSW_SITZVERTEILUNG_GEBIET_LISTENKOMBIANTION, name); //$NON-NLS-1$
      cmd = createCommand(name,
          AUSW_SITZVERTEILUNG_GEBIET_LISTENKOMBIANTION,
          null,
          false,
          "sitzverteilungErgLK.jsp", //$NON-NLS-1$
          getBundleString("SitzverteilungLK_titel"), //$NON-NLS-1$
          GUI_CLASS_1);
      befehleInitial[topLevel].add(cmd);
    }

    name = getBundleString("Gewaehlte_Kandidaten_nach_Partei"); //$NON-NLS-1$
    jspLevelWorkName.put(topLevel + "_" + NLPA, name); //$NON-NLS-1$
    cmd = createCommand(name, NLPA, null, false, "GewaehlteKandidatenNachPartei.jsp", //$NON-NLS-1$
        getBundleString("Gewaehlte_Kandidaten_nach_Partei_titel"), //$NON-NLS-1$
        GUICommand.GUI_CLASS_1);
    cmd.setAlleLevel(true);
    befehleInitial[topLevel].add(cmd);

    name = getBundleString("Gewaehlte_Kandidaten_Alpha"); //$NON-NLS-1$
    jspLevelWorkName.put(topLevel + "_" + NLA, name); //$NON-NLS-1$
    cmd = createCommand(name, NLA, null, false, "GewaehlteKandidatenAlphabetisch.jsp", //$NON-NLS-1$
        getBundleString("Gewaehlte_Kandidaten_Alpha_titel"), //$NON-NLS-1$
        GUICommand.GUI_CLASS_1);
    cmd.setAlleLevel(true);
    befehleInitial[topLevel].add(cmd);

    name = getBundleString("Freigabesteuerung"); //$NON-NLS-1$
    jspLevelWorkName.put(topLevel + "_" + ADM_FREIGABE, name); //$NON-NLS-1$
    cmd = createCommand(name, ADM_FREIGABE, R_FREIGABE, false, "adm_freigabe.jsp", //$NON-NLS-1$
        getBundleString("Freigabesteuerung_titel"), //$NON-NLS-1$
        GUI_CLASS_1);
    cmd.setNurWurzelgebiet(true);
    befehleInitial[topLevel].add(cmd);

    helper.setRights(R_EXPORT);
    helper.setGebietsabhaengig(false);

    if (modelForProtocol().equals(MODEL_U16)) {
      helper.addCommand(U16, "Export_U16", "Export_U16_titel", "P5_U16_Export.jsp"); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
    } else if (modelForProtocol().equals(MODEL_P22_2)) {
      helper.addCommand(P22, "Export_P22_1", "Export_P22_1_titel", "P5_P22_2_Export.jsp"); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
    } else {
      helper.addCommand(P22, "Export_P22_1", "Export_P22_1_titel", "P5_P22_1_Export.jsp"); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
    }
    String jspProtocolAppendix = modelForProtocol().equals(MODEL_P22_2)
        ? "P5_P22_2_Appendix_Export.jsp" //$NON-NLS-1$
        : "P5_P22_1_Appendix_Export.jsp"; //$NON-NLS-1$
    helper.addCommand(PROTOCOL_APPENDIX,
        "Export_Protocol_Appendix", "Export_Protocol_Appendix_P5_titel", jspProtocolAppendix); //$NON-NLS-1$ //$NON-NLS-2$
    helper.addCommand(GEW_BEN,
        "Export_Gew_Ben", "Export_Gew_Ben_titel", "P5_Benachrichtigung_Export.jsp"); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
    helper.addCommand(CAND_ADDRESS,
        "Export_Cand_Address", "Export_Cand_Address_titel", "P5_Candidate_Address_Export.jsp"); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
    helper.addCommand(EXPORT_VERZEICHNIS,
        "ExportVerzeichnis", "Export_Verzeichnis_titel", "dateiExportVerzeichnis.jsp"); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
  }

  protected boolean isEKElection() {
    return false;
  }

  protected abstract void createCommandGebietErgebnisKandidat(Map<String, String> jspLevelWorkName,
      GUICommandList[] befehleInitial);

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

    helper.setRights(R_UPLOAD);
    helper.addCommand(UPLOAD_FILE, "Upload", "Upload_titel", "dateiUpload.jsp"); //$NON-NLS-1$//$NON-NLS-2$ //$NON-NLS-3$

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
  private void initLevelUnabhaengig(Map<String, String> jspLevelWorkName,
      GUICommandList[] befehleInitial,
      @SuppressWarnings("unused") String link_1,
      @SuppressWarnings("unused") String linkButtonName_1,
      @SuppressWarnings("unused") String link_2,
      @SuppressWarnings("unused") String linkButtonName_2) {

    GUICommand cmd;
    String name;

    /*
     * Gebietsergebnis auf allen Gebieten
     */
    if (topLevel != _gebietsartErfassungseinheitMax) {
      name = getBundleString(getLowerGebietErgebnisBundleString());
      cmd = createCommand(name, GEB_ERG, null, false, "gebietErgebnis.jsp", //$NON-NLS-1$
          getBundleString("Gebiet_Ergebnis_titel"), //$NON-NLS-1$
          GUI_CLASS_1);
      cmd.setNurErfassungseinheit(true); // only deeper level in P5 (top level has another position)
      cmd.setPosition(0);
      jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + GEB_ERG, name); //$NON-NLS-1$
      befehleInitial[LEVEL_UNABHAENGIG].add(cmd);

      name = getBundleString("Gebiet_Ergebnis_Kandidat"); //$NON-NLS-1$
      cmd = createCommand(name, GEB_ERG_KAN, null, false, isEKElection()
          ? "gebietErgebnisKandidatEK.jsp" : "gebietErgebnisKandidat.jsp", //$NON-NLS-1$ //$NON-NLS-2$
          getBundleString("Gebiet_Ergebnis_Kandidat_titel"), //$NON-NLS-1$
          GUI_CLASS_1);
      // if the Level is CSB the list of candidates are defined for a deeper Level
      cmd.setNurErfassungseinheit(true);
      cmd.setPosition(1);
      jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + GEB_ERG_KAN, name); //$NON-NLS-1$
      befehleInitial[LEVEL_UNABHAENGIG].add(cmd);
    }

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

  @Override
  public int getGebieteWorkDefault() {
    return GEB_ERG;
  }
}
