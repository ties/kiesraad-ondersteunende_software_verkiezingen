/*
 * Copyright (c) 2010 Statistisches Bundesamt und IVU Traffic Technologies AG
 */
package de.ivu.wahl.client.beans;

import static de.ivu.wahl.client.util.GUICommand.GUI_CLASS_1;
import static de.ivu.wahl.modell.GebietModel.GEBIETSART_WAHLKREIS;

import java.util.Map;

import de.ivu.wahl.client.util.GUICommand;

/**
 * @author J. Nottebaum, IVU Traffic Technologies AG
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
      int levelcount) {
    for (int level = 0; level < levelcount; level++) {
      befehleInitial[level] = new GUICommandArrayList();
      befehle[level] = new GUICommandArrayList();
    }
    initLevelUnabhaengig(jspLevelWorkName, befehleInitial);
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

    helper.addCommand(Command.IMPORT_ERGEBNISSE,
        "Ergebnisimport_P5", "Ergebnisimport_titel_P5", JspPage.ERGEBNIS_IMPORT); //$NON-NLS-1$ //$NON-NLS-2$

    JspPage jspPage = isEKElection() ? JspPage.GEBIET_ERGEBNIS_EK : JspPage.GEBIET_ERGEBNIS;
    helper.addCommand(Command.GEB_ERG,
        getGebietErgebnisBundleString(),
        "Gebiet_Ergebnis_titel", jspPage); //$NON-NLS-1$

    createCommandGebietErgebnisKandidat(helper);

    GUICommand cmd;

    if (isEKElection()) {
      helper.addCommand(Command.ADM_VOTE_VALUES,
          "Vote_Values", "Vote_Values_titel", JspPage.ADM_VOTE_VALUES); //$NON-NLS-1$ //$NON-NLS-2$
    }

    helper.addCommand(Command.ADM_KANDIDAT_WAEHLBAR,
        "Kandidat_waehlbar", "Kandidat_waehlbar_titel", JspPage.ADM_KANDIDAT_WAEHLBAR); //$NON-NLS-1$ //$NON-NLS-2$

    helper.addCommand(Command.AUSW_SITZVERTEILUNG_GEBIET,
        "Sitzverteilung", "Sitzverteilung_titel", JspPage.SITZVERTEILUNG_ERG); //$NON-NLS-1$ //$NON-NLS-2$

    cmd = helper
        .addCommand(Command.NLPA,
            "Gewaehlte_Kandidaten_nach_Partei", "Gewaehlte_Kandidaten_nach_Partei_titel", JspPage.GEWAEHLTE_KANDIDATEN_NACH_PARTEI); //$NON-NLS-1$ //$NON-NLS-2$
    cmd.setAlleLevel(true);

    cmd = helper
        .addCommand(Command.NLA,
            "Gewaehlte_Kandidaten_Alpha", "Gewaehlte_Kandidaten_Alpha_titel", JspPage.GEWAEHLTE_KANDIDATEN_ALPHABETISCH); //$NON-NLS-1$ //$NON-NLS-2$
    cmd.setAlleLevel(true);

    cmd = helper.addCommand(Command.ADM_FREIGABE,
        "Freigabesteuerung", "Freigabesteuerung_titel", JspPage.ADM_FREIGABE); //$NON-NLS-1$ //$NON-NLS-2$
    cmd.setNurWurzelgebiet(true);

    helper.setGebietsabhaengig(false);

    if (modelForProtocol().equals(MODEL_U16)) {
      helper.addCommand(Command.U16, "Export_U16", "Export_U16_titel", JspPage.P5_U16_EXPORT); //$NON-NLS-1$ //$NON-NLS-2$
    } else if (modelForProtocol().equals(MODEL_P22_2)) {
      helper.addCommand(Command.P22, "Export_P22_1", "Export_P22_1_titel", JspPage.P5_P22_2_EXPORT); //$NON-NLS-1$ //$NON-NLS-2$
    } else {
      helper.addCommand(Command.P22, "Export_P22_1", "Export_P22_1_titel", JspPage.P5_P22_1_EXPORT); //$NON-NLS-1$ //$NON-NLS-2$
    }
    JspPage jspProtocolAppendix = modelForProtocol().equals(MODEL_P22_2)
        ? JspPage.P5_P22_2_APPENDIX_EXPORT
        : JspPage.P5_P22_1_APPENDIX_EXPORT;
    helper.addCommand(Command.PROTOCOL_APPENDIX,
        "Export_Protocol_Appendix", "Export_Protocol_Appendix_P5_titel", jspProtocolAppendix); //$NON-NLS-1$ //$NON-NLS-2$
    helper.addCommand(Command.GEW_BEN,
        "Export_Gew_Ben", "Export_Gew_Ben_titel", JspPage.P5_BENACHRICHTIGUNG_EXPORT); //$NON-NLS-1$ //$NON-NLS-2$
    helper.addCommand(Command.CAND_ADDRESS,
        "Export_Cand_Address", "Export_Cand_Address_titel", JspPage.P5_CANDIDATE_ADDRESS_EXPORT); //$NON-NLS-1$ //$NON-NLS-2$
    helper.addCommand(Command.EXPORT_VERZEICHNIS,
        "ExportVerzeichnis", "Export_Verzeichnis_titel", JspPage.DATEI_EXPORT_VERZEICHNIS); //$NON-NLS-1$ //$NON-NLS-2$
  }

  protected boolean isEKElection() {
    return false;
  }

  protected abstract void createCommandGebietErgebnisKandidat(InitGuiCommandHelper helper);

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

    helper.addCommand(Command.ANWENDER_VERAENDERN_PASSWORT,
        "Passwort_veraendern", "Passwort_veraendern_titel", JspPage.ADM_ANWENDER_CHANGE_PW); //$NON-NLS-1$//$NON-NLS-2$

    helper
        .addCommand(Command.ADM_ANW_LISTE,
            "Angemeldete_Anwender_anzeigen", "Angemeldete_Anwender_anzeigen_titel", JspPage.ADM_ANGEMELDETE_ANWENDER); //$NON-NLS-1$//$NON-NLS-2$

    helper.addCommand(Command.ANWENDER_ANLEGEN,
        "Anwender_anlegen", "Anwender_anlegen_titel", JspPage.ADM_ANWENDER_CREATE); //$NON-NLS-1$//$NON-NLS-2$

    helper.addCommand(Command.ANWENDER_VERAENDERN_1_AUSWAHLEN,
        "Anwender_veraendern", "Anwender_veraendern_titel", JspPage.ADM_ANWENDER_SELECT_EDIT); //$NON-NLS-1$//$NON-NLS-2$

    // die zweite Seite in die HashMap
    helper.addJspPage(Command.ANWENDER_VERAENDERN_2_EDIT,
        "Anwender_veraendern", JspPage.ADM_ANWENDER_EDIT); //$NON-NLS-1$

    helper.addCommand(Command.ANWENDER_LOESCHEN,
        "Anwender_loeschen", "Anwender_loeschen_titel", JspPage.ADM_ANWENDER_SELECT_DELETE); //$NON-NLS-1$//$NON-NLS-2$

    helper.addCommand(Command.ADM_RE_INDEX_DATABASE,
        "re_index_database", "re_index_database_titel", JspPage.ADM_RE_INDEX_DATABASE); //$NON-NLS-1$//$NON-NLS-2$
  }

  /**
   * initLevelUnabhaengig
   * 
   * @param jspLevelWorkName
   * @param befehleInitial
   */
  private void initLevelUnabhaengig(Map<String, String> jspLevelWorkName,
      GUICommandList[] befehleInitial) {

    InitGuiCommandHelper helper = new InitGuiCommandHelper(this, jspLevelWorkName,
        befehleInitial[LEVEL_UNABHAENGIG], LEVEL_UNABHAENGIG);

    GUICommand cmd;

    /*
     * Gebietsergebnis auf allen Gebieten
     */
    if (topLevel != _gebietsartErfassungseinheitMax) {
      cmd = helper.addCommand(Command.GEB_ERG,
          getLowerGebietErgebnisBundleString(),
          "Gebiet_Ergebnis_titel", JspPage.GEBIET_ERGEBNIS); //$NON-NLS-1$
      cmd.setNurErfassungseinheit(true); // only deeper level in P5 (top level has another position)
      cmd.setPosition(0);

      // if the Level is CSB the list of candidates are defined for a deeper Level
      JspPage jspPage = isEKElection()
          ? JspPage.GEBIET_ERGEBNIS_KANDIDAT_EK
          : JspPage.GEBIET_ERGEBNIS_KANDIDAT;
      cmd = helper.addCommand(Command.GEB_ERG_KAN,
          "Gebiet_Ergebnis_Kandidat", "Gebiet_Ergebnis_Kandidat_titel", jspPage);//$NON-NLS-1$ //$NON-NLS-2$
      cmd.setNurErfassungseinheit(true);
      cmd.setPosition(1);
    }

    helper.setGuiClass(GUICommand.GUI_CLASS_6);

    // hilfe cmd kommt in alle Arrays hinten dran
    cmd = helper.addCommand(Command.HELP, "Hilfe", "Hilfe_titel", JspPage.HELP); //$NON-NLS-1$ //$NON-NLS-2$
    cmd.setAlleLevel(true);

    // logout cmd kommt in alle Arrays hinten dran
    cmd = helper.addCommand(Command.SONST_LOGOUT, "Abmelden", "Abmelden_titel", JspPage.LOGOUT); //$NON-NLS-1$ //$NON-NLS-2$
    cmd.setAlleLevel(true);

    // wahldetails cmd kommt in alle Arrays hinten dran
    cmd = helper.addCommand(Command.SONST_ELECTIONDETAILS,
        "ElectionDetails", "ElectionDetails_titel", JspPage.ELECTION_DETAILS); //$NON-NLS-1$ //$NON-NLS-2$
    cmd.setAlleLevel(true);
  }

  @Override
  public Command getGebieteWorkDefault() {
    return Command.GEB_ERG;
  }
}
