/*
 * Copyright (c) 2010-2014 Statistisches Bundesamt und IVU Traffic Technologies AG
 */
package de.ivu.wahl.client.beans;

import static de.ivu.wahl.client.util.GUICommand.GUI_CLASS_1;
import static de.ivu.wahl.modell.GebietModel.GEBIETSART_GEMEINDE;
import static de.ivu.wahl.modell.GebietModel.GEBIETSART_STIMMBEZIRK;
import static de.ivu.wahl.modell.GebietModel.GEBIETSART_WAHLKREIS;

import java.util.Map;

import de.ivu.wahl.WahlInfo;
import de.ivu.wahl.client.util.GUICommand;
import de.ivu.wahl.modell.ErgebniseingangKonstanten;
import de.ivu.wahl.modell.GebietModel;
import de.ivu.wahl.wus.electioncategory.ElectionCategory;
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
      int levelcount) {
    for (int level = 0; level < levelcount; level++) {
      befehleInitial[level] = new GUICommandArrayList();
      befehle[level] = new GUICommandArrayList();
    }
    initLevelUnabhaengig(jspLevelWorkName, befehleInitial);
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
    InitGuiCommandHelper helper = new InitGuiCommandHelper(this, jspLevelWorkName,
        befehleInitial[LEVEL_WKR], LEVEL_WKR);

    helper.addCommand(Command.IMPORT_ERGEBNISSE,
        "Ergebnisimport_P4", "Ergebnisimport_titel_P4", JspPage.ERGEBNIS_IMPORT); //$NON-NLS-1$ //$NON-NLS-2$
  }

  protected void initLevelGemeinde(Map<String, String> jspLevelWorkName,
      GUICommandList[] befehleInitial) {
    InitGuiCommandHelper helper = new InitGuiCommandHelper(this, jspLevelWorkName,
        befehleInitial[LEVEL_GEM], LEVEL_GEM);

    helper.addCommand(Command.IMPORT_ERGEBNISSE,
        "Ergebnisimport_P4", "Ergebnisimport_titel_P4", JspPage.ERGEBNIS_IMPORT); //$NON-NLS-1$ //$NON-NLS-2$
  }

  private void initLevelStimmbezirk(Map<String, String> jspLevelWorkName,
      GUICommandList[] befehleInitial) {
    InitGuiCommandHelper helper = new InitGuiCommandHelper(this, jspLevelWorkName,
        befehleInitial[LEVEL_STIMMBEZ], LEVEL_STIMMBEZ);

    GUICommand cmd;
    
    if (isGrOrBcOrGc()) {
      // Gebietseingabe auf allen Gebieten
      cmd = helper.addCommand(Command.GEBE,
          "Gebiet_Eingabe", "Gebiet_Eingabe_titel", JspPage.GEBIET_EINGANG); //$NON-NLS-1$ //$NON-NLS-2$
      cmd.setNurErfassungseinheit(true);
      cmd.setPosition(0);
    }

    if (GebietModel.EBENE_PSB == _ebene) {
      cmd = helper
          .addCommand(Command.MANUELLE_EINGABE_FREIGEBEN,
              "Gebiet_ManuelleEingabeFreigeben", "Gebiet_ManuelleEingabeFreigeben_titel", JspPage.GEBIET_MANUELLE_EINGABE_FREIGEBEN); //$NON-NLS-1$//$NON-NLS-2$
      cmd.setNurErfassungseinheit(true);
    }

    helper.addCommand(Command.IMPORT_ERGEBNISSE,
        "Ergebnisimport_P4", "Ergebnisimport_titel_P4", JspPage.ERGEBNIS_IMPORT_ADMIN); //$NON-NLS-1$ //$NON-NLS-2$
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

    if (GebietModel.EBENE_PSB == _ebene) {
      helper
          .addCommand(Command.ADM_STIMMBEZIRKE_EDIT,
              "Stimmbezirke_bearbeiten", "Stimmbezirke_bearbeiten_titel", JspPage.ADM_STIMMBEZIRKE_EDIT); //$NON-NLS-1$//$NON-NLS-2$
    }

    helper.addCommand(Command.ADM_PROPS,
        "Grundeinstellungen_aendern", "Grundeinstellungen_aendern_titel", JspPage.ADM_PROPS); //$NON-NLS-1$//$NON-NLS-2$

    helper.addCommand(Command.ADM_RE_INDEX_DATABASE,
        "re_index_database", "re_index_database_titel", JspPage.ADM_RE_INDEX_DATABASE); //$NON-NLS-1$//$NON-NLS-2$

    final String titleKey;
    final String nameKey;
    if (isGrOrBcOrGc()) {
      nameKey = "Export_P4_EmptyTellingTotaaltelling"; //$NON-NLS-1$
      titleKey = "Export_P4_titel_EmptyTellingTotaaltelling"; //$NON-NLS-1$
    } else if (GebietModel.EBENE_CSB == _ebene) {
      nameKey = "Export_P4_EmptyTotaaltelling"; //$NON-NLS-1$
      titleKey = "Export_P4_titel_EmptyTotaaltelling"; //$NON-NLS-1$
    } else {
      nameKey = "Export_P4_EmptyTelling"; //$NON-NLS-1$
      titleKey = "Export_P4_titel_EmptyTelling"; //$NON-NLS-1$
    }
    helper.addCommand(Command.ADM_EMPTY_EML_EXPORT, nameKey, titleKey, JspPage.ADM_EMPTY_EXPORT);

    if (GebietModel.EBENE_PSB == _ebene) {
      helper.addCommand(Command.ADM_N10_1_EXPORT,
          "Export_P4_N10_1", "Export_P4_titel_N10_1", JspPage.ADM_N10_1_EXPORT); //$NON-NLS-1$//$NON-NLS-2$
    }
  }

  /**
   * initLevelUnabhaengig
   * 
   * @param jspLevelWorkName
   * @param befehleInitial
   */
  protected void initLevelUnabhaengig(Map<String, String> jspLevelWorkName,
      GUICommandList[] befehleInitial) {

    InitGuiCommandHelper helper = new InitGuiCommandHelper(this, jspLevelWorkName,
        befehleInitial[LEVEL_UNABHAENGIG], LEVEL_UNABHAENGIG);
    helper.setGuiClass(GUI_CLASS_1);

    GUICommand cmd;
    /*
     * Gebietseingabe auf allen Gebieten
     */
    if (!isGrOrBcOrGc()) {
      cmd = helper.addCommand(Command.GEBE,
          "Gebiet_Eingabe", "Gebiet_Eingabe_titel", JspPage.GEBIET_EINGANG); //$NON-NLS-1$//$NON-NLS-2$
      cmd.setNurErfassungseinheit(true);
      cmd.setPosition(0);
    }

    /*
     * Gebietsergebnis auf allen Gebieten
     */
    cmd = helper.addCommand(Command.GEB_ERG,
        "Gebiet_Ergebnis", "Gebiet_Ergebnis_titel", JspPage.GEBIET_ERGEBNIS); //$NON-NLS-1$//$NON-NLS-2$
    cmd.setNurGebiete(true);
    // cmd.setPosition(1);
    initCommandGebietErgebnis(cmd);

    createCommandGebietErgebnisKandidat(helper);

    cmd = helper.addCommand(Command.STATUS_GEB,
        "Gebiet_Status", "Gebiet_Status_titel", JspPage.STATUS_GEBIET); //$NON-NLS-1$//$NON-NLS-2$
    cmd.setNurErfassungseinheit(true);

    cmd = helper.addCommand(Command.STATUS, "Status", tooltipStatusCommandKey(), JspPage.STATUS); //$NON-NLS-1$
    cmd.setNurWurzelgebiet(true);

    cmd = helper.addCommand(Command.ADM_FREIGABE,
        "Freigabesteuerung", "Freigabesteuerung_titel", JspPage.ADM_FREIGABE); //$NON-NLS-1$//$NON-NLS-2$
    cmd.setNurWurzelgebiet(true);

    if (GebietModel.EBENE_PSB == _ebene) {
      cmd = helper.addCommand(Command.N11,
          "Export_P4_N11", "Export_P4_titel_N11", JspPage.P4_EXPORT_N11); //$NON-NLS-1$//$NON-NLS-2$
      cmd.setNurWurzelgebiet(true);
    }
    // Export O3 only, when 510c will be exported--> only HSB
    if (GebietModel.EBENE_HSB == _ebene) {
      if (isEk()) {
        cmd = helper.addCommand(Command.T11,
            "Export_P4_T11", "Export_P4_titel_T11", JspPage.P4_EXPORT_T11); //$NON-NLS-1$//$NON-NLS-2$
        cmd.setNurWurzelgebiet(true);

        cmd = helper.addCommand(Command.OSV4_5,
            "Export_P4_OSV4_5", "Export_P4_titel_OSV4_5", JspPage.P4_EXPORT_OSV4_5); //$NON-NLS-1$//$NON-NLS-2$
        cmd.setNurWurzelgebiet(true);

      } else {
        ElectionSubcategory electionSubcategory = WahlInfo.getWahlInfo().getElectionSubcategory();
        ElectionCategory electionCategory = WahlInfo.getWahlInfo().getElectionCategory();
        if (ElectionSubcategory.PS1.equals(electionSubcategory)
            || ElectionCategory.AB.equals(electionCategory)) {
          cmd = helper.addCommand(Command.EML510c,
              "Export_P4_EML510c", "Export_P4_titel_EML510c", JspPage.P4_EXPORT_EML510C); //$NON-NLS-1$//$NON-NLS-2$
          cmd.setNurWurzelgebiet(true);

          // OSV-2080: Export OSV4_1 and 510d in P4_HSB for PS1 and AB elections
          cmd = helper.addCommand(Command.OSV4_1,
              "Export_P4_OSV4_1", "Export_P4_titel_OSV4_1", JspPage.P4_EXPORT_OSV4_1); //$NON-NLS-1$//$NON-NLS-2$
          cmd.setNurWurzelgebiet(true);
        } else {
          cmd = helper.addCommand(Command.O3,
              "Export_P4_O3", "Export_P4_titel_O3", JspPage.P4_EXPORT_O3); //$NON-NLS-1$//$NON-NLS-2$
          cmd.setNurWurzelgebiet(true);

          cmd = helper.addCommand(Command.OSV4_4,
              "Export_P4_Appendix_O3", "Export_P4_titel_Appendix_O3", JspPage.P4_EXPORT_OSV4_4); //$NON-NLS-1$//$NON-NLS-2$
          cmd.setNurWurzelgebiet(true);
        }
      }
    }
    // Export OSV4_1 only, when 510d will be exported --> only CSB
    if (GebietModel.EBENE_CSB == _ebene) {
      cmd = helper.addCommand(Command.OSV4_1,
          "Export_P4_OSV4_1", "Export_P4_titel_OSV4_1", JspPage.P4_EXPORT_OSV4_1); //$NON-NLS-1$//$NON-NLS-2$
      cmd.setNurWurzelgebiet(true);
    }
    // Export CSV
    cmd = helper.addCommand(Command.VOTES_CSV,
        "Export_P4_CSV", "Export_P4_titel_CSV", JspPage.P4_EXPORT_CSV); //$NON-NLS-1$//$NON-NLS-2$
    cmd.setNurWurzelgebiet(true);
    // export directory
    cmd = helper.addCommand(Command.EXPORT_VERZEICHNIS,
        "ExportVerzeichnis", "Export_Verzeichnis_titel", JspPage.DATEI_EXPORT_VERZEICHNIS); //$NON-NLS-1$//$NON-NLS-2$
    cmd.setNurWurzelgebiet(true);

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

  private String tooltipStatusCommandKey() {
    if (isEk()) {
      return "Status_titel_EK"; //$NON-NLS-1$
    }
    if (_ebene == GebietModel.EBENE_CSB) {
      return "Status_titel_CSB"; //$NON-NLS-1$
    } else if (_ebene == GebietModel.EBENE_HSB) {
      return "Status_titel_HSB"; //$NON-NLS-1$
    } else {
      return "Status_titel"; //$NON-NLS-1$
    }
  }

  @Override
  public Command getGebieteWorkDefault() {
    return Command.GEB_ERG;
  }

  @Override
  public Command getErfassungseinheitUnvollstaendigWork(int ergebniseingangStatus) {
    switch (_ebene) {
      case GebietModel.EBENE_PSB :
        return Command.GEBE;

      case GebietModel.EBENE_HSB :
      case GebietModel.EBENE_CSB :
        if ((_ebene == GebietModel.EBENE_HSB && isEk())
            || ergebniseingangStatus == ErgebniseingangKonstanten.STATE_FIRST_RESULT_OK
            || ergebniseingangStatus == ErgebniseingangKonstanten.STATE_WARNING
            || ergebniseingangStatus == ErgebniseingangKonstanten.STATE_ERROR) {
          return Command.GEBE;
        }
        return Command.IMPORT_ERGEBNISSE;

      default :
        return Command.GEB_ERG;
    }
  }

  protected abstract void initCommandGebietErgebnis(GUICommand cmd);

  protected abstract void createCommandGebietErgebnisKandidat(InitGuiCommandHelper helper);

}
