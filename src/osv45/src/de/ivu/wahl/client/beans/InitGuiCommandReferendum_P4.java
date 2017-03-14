/*
 * InitGuiCommandTweedeKamerBund
 * 
 * Created on Oct 29, 2008
 * Copyright (c) 2008 IVU Traffic Technologies AG
 */
package de.ivu.wahl.client.beans;

import static de.ivu.wahl.anwender.Rechte.R_ADM_ANGEMELDETE;
import static de.ivu.wahl.anwender.Rechte.R_ADM_ANW_AENDERN;
import static de.ivu.wahl.anwender.Rechte.R_ADM_ANW_ANLEGEN;
import static de.ivu.wahl.anwender.Rechte.R_ADM_EMPTY_EML_EXPORT;
import static de.ivu.wahl.anwender.Rechte.R_ADM_PROPS;
import static de.ivu.wahl.anwender.Rechte.R_ADM_STIMMBEZIRKE_EDIT;
import static de.ivu.wahl.anwender.Rechte.R_EXPORT;
import static de.ivu.wahl.anwender.Rechte.R_FREIGABE;
import static de.ivu.wahl.anwender.Rechte.R_IMPORT;
import static de.ivu.wahl.client.util.GUICommand.GUI_CLASS_1;
import static de.ivu.wahl.modell.GebietModel.GEBIETSART_GEMEINDE;
import static de.ivu.wahl.modell.GebietModel.GEBIETSART_STIMMBEZIRK;
import static de.ivu.wahl.modell.GebietModel.GEBIETSART_WAHLKREIS;

import java.util.Map;

import de.ivu.wahl.anwender.Rechte;
import de.ivu.wahl.client.util.GUICommand;
import de.ivu.wahl.modell.GebietModel;

/**
 * @author mur@ivu.de, IVU Traffic Technologies AG
 */
public class InitGuiCommandReferendum_P4 extends InitGuiCommand
    implements
      ApplicationBeanKonstanten {

  private final int _ebene;

  private static final int[][] WAHL_ART_LEVEL_CSB = {{GEBIETSART_WAHLKREIS}};
  private static final int[][] WAHL_ART_LEVEL_HSB = {{GEBIETSART_GEMEINDE}};
  private static final int[][] WAHL_ART_LEVEL_PSB = {{GEBIETSART_STIMMBEZIRK}};

  private static final int[][] ADMIN_WAHL_ART_LEVEL_CSB = {{GEBIETSART_WAHLKREIS}};
  private static final int[][] ADMIN_WAHL_ART_LEVEL_HSB = {{GEBIETSART_GEMEINDE}};
  private static final int[][] ADMIN_WAHL_ART_LEVEL_PSB = {{GEBIETSART_STIMMBEZIRK}};

  /**
   * @param jspMap Beziehung zwischen work-Kodierung und JSPs
   * @param ebene
   * @param gebietsartErfassungseinheitMax Gebietsart der hierarchisch <b>niedrigsten</b>
   *          Erfassungseinheit im Gebietsbaum
   */
  public InitGuiCommandReferendum_P4(Map<Integer, String> jspMap,
      int gebietsartErfassungseinheitMax,
      int ebene) {
    super(jspMap, gebietsartErfassungseinheitMax);
    _ebene = ebene;
  }

  @Override
  protected int[][] getWahlartLevels() {
    switch (_ebene) {
      case GebietModel.EBENE_CSB :
        return WAHL_ART_LEVEL_CSB;
      case GebietModel.EBENE_HSB :
        return WAHL_ART_LEVEL_HSB;
      case GebietModel.EBENE_PSB :
        return WAHL_ART_LEVEL_PSB;
      default :
        return WAHL_ART_LEVEL_CSB;
    }
  }

  @Override
  protected int[][] getAdminWahlartLevels() {
    switch (_ebene) {
      case GebietModel.EBENE_CSB :
        return ADMIN_WAHL_ART_LEVEL_CSB;
      case GebietModel.EBENE_HSB :
        return ADMIN_WAHL_ART_LEVEL_HSB;
      case GebietModel.EBENE_PSB :
        return ADMIN_WAHL_ART_LEVEL_PSB;
      default :
        return ADMIN_WAHL_ART_LEVEL_CSB;
    }
  }

  /*
   * (non-Javadoc)
   * @see de.ivu.wahl.client.beans.InitGuiCommand#initBefehle(java.util.Map,
   * de.ivu.wahl.client.beans.InitGuiCommand.GUICommandList[],
   * de.ivu.wahl.client.beans.InitGuiCommand.GUICommandList[], int, java.lang.String,
   * java.lang.String, java.lang.String, java.lang.String)
   */
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
  }

  /**
   * initLevelAdmin
   * 
   * @param jspLevelWorkName
   * @param befehleInitial
   */
  private void initLevelAdmin(Map<String, String> jspLevelWorkName, GUICommandList[] befehleInitial) {
    String name;
    String title;

    name = getBundleString("Passwort_veraendern"); //$NON-NLS-1$
    jspLevelWorkName.put(LEVEL_ADMIN + "_" + ANWENDER_VERAENDERN_PASSWORT, name); //$NON-NLS-1$
    befehleInitial[LEVEL_ADMIN].add(createCommand(name,
        ANWENDER_VERAENDERN_PASSWORT,
        null,
        false,
        "adm_anwender_change_pw.jsp", //$NON-NLS-1$
        getBundleString("Passwort_veraendern_titel"), //$NON-NLS-1$
        GUI_CLASS_1));

    name = getBundleString("Angemeldete_Anwender_anzeigen"); //$NON-NLS-1$
    jspLevelWorkName.put(LEVEL_ADMIN + "_" + ADM_ANW_LISTE, name); //$NON-NLS-1$
    befehleInitial[LEVEL_ADMIN].add(createCommand(name,
        ADM_ANW_LISTE,
        R_ADM_ANGEMELDETE,
        false,
        "adm_angemeldeteAnwender.jsp", //$NON-NLS-1$
        getBundleString("Angemeldete_Anwender_anzeigen_titel"), //$NON-NLS-1$
        GUI_CLASS_1));

    name = getBundleString("Anwender_anlegen"); //$NON-NLS-1$
    jspLevelWorkName.put(LEVEL_ADMIN + "_" + ANWENDER_ANLEGEN, name); //$NON-NLS-1$
    befehleInitial[LEVEL_ADMIN].add(createCommand(name,
        ANWENDER_ANLEGEN,
        R_ADM_ANW_ANLEGEN,
        false,
        "adm_anwender_edit.jsp", //$NON-NLS-1$
        getBundleString("Anwender_anlegen_titel"), //$NON-NLS-1$
        GUI_CLASS_1));

    name = getBundleString("Anwender_veraendern"); //$NON-NLS-1$
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

    name = getBundleString("Anwender_loeschen"); //$NON-NLS-1$
    jspLevelWorkName.put(LEVEL_ADMIN + "_" + ANWENDER_LOESCHEN, name); //$NON-NLS-1$
    befehleInitial[LEVEL_ADMIN].add(createCommand(name,
        ANWENDER_LOESCHEN,
        R_ADM_ANW_ANLEGEN,
        false,
        "adm_anwender_select.jsp", //$NON-NLS-1$
        getBundleString("Anwender_loeschen_titel"), //$NON-NLS-1$
        GUI_CLASS_1));

    if (GebietModel.EBENE_PSB == _ebene) {
      name = getBundleString("Stimmbezirke_bearbeiten"); //$NON-NLS-1$
      jspLevelWorkName.put(LEVEL_ADMIN + "_" + ADM_STIMMBEZIRKE_EDIT, name); //$NON-NLS-1$
      befehleInitial[LEVEL_ADMIN].add(createCommand(name,
          ADM_STIMMBEZIRKE_EDIT,
          R_ADM_STIMMBEZIRKE_EDIT,
          false,
          "adm_stimmbezirke.jsp", //$NON-NLS-1$
          getBundleString("Stimmbezirke_bearbeiten_titel"), //$NON-NLS-1$
          GUI_CLASS_1));
    }

    name = getBundleString("Grundeinstellungen_aendern"); //$NON-NLS-1$
    jspLevelWorkName.put(LEVEL_ADMIN + "_" + ADM_PROPS, name); //$NON-NLS-1$
    befehleInitial[LEVEL_ADMIN].add(createCommand(name,
        ADM_PROPS,
        R_ADM_PROPS,
        false,
        "adm_props.jsp", //$NON-NLS-1$
        getBundleString("Grundeinstellungen_aendern_titel"), //$NON-NLS-1$
        GUI_CLASS_1));

    if (GebietModel.EBENE_CSB == _ebene) {
      name = getBundleString("Export_P4_EmptyTotaaltelling"); //$NON-NLS-1$
      title = getBundleString("Export_P4_titel_EmptyTotaaltelling"); //$NON-NLS-1$
    } else {
      name = getBundleString("Export_P4_EmptyTelling"); //$NON-NLS-1$
      title = getBundleString("Export_P4_titel_EmptyTelling"); //$NON-NLS-1$
    }
    jspLevelWorkName.put(LEVEL_ADMIN + "_" + ADM_EMPTY_EML_EXPORT, name); //$NON-NLS-1$
    befehleInitial[LEVEL_ADMIN].add(createCommand(name,
        ADM_EMPTY_EML_EXPORT,
        R_ADM_EMPTY_EML_EXPORT,
        false,
        "adm_empty_export.jsp", //$NON-NLS-1$
        title,
        GUI_CLASS_1));
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
     * Gebietseingabe auf allen Gebieten
     */
    name = getBundleString("Referendum_Eingabe"); //$NON-NLS-1$
    cmd = createCommand(name, GEBE, Rechte.R_EINGABE, false, "gebietEingang.jsp", //$NON-NLS-1$
        getBundleString("Referendum_Eingabe_titel"), //$NON-NLS-1$
        GUI_CLASS_1);
    cmd.setNurErfassungseinheit(true);
    cmd.setPosition(0);
    jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + GEBE, name); //$NON-NLS-1$
    befehleInitial[LEVEL_UNABHAENGIG].add(cmd);

    name = getBundleString("Ergebnisimport_P4"); //$NON-NLS-1$
    jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + IMPORT_ERGEBNISSE, name); //$NON-NLS-1$
    cmd = createCommand(name, IMPORT_ERGEBNISSE, R_IMPORT, false, "ergebnisImport.jsp", //$NON-NLS-1$
        getBundleString("Ergebnisimport_titel_P4"), //$NON-NLS-1$
        GUI_CLASS_1);
    cmd.setNurErfassungseinheit(true);
    cmd.setPosition(1);
    befehleInitial[LEVEL_UNABHAENGIG].add(cmd);

    /*
     * Gebietsergebnis auf allen Gebieten
     */
    name = getBundleString("Referendum_Ergebnis"); //$NON-NLS-1$
    cmd = createCommand(name, GEB_ERG, null, false, "gebietErgebnisKandidat.jsp", //$NON-NLS-1$
        getBundleString("Referendum_Ergebnis_titel"), //$NON-NLS-1$
        GUI_CLASS_1);
    cmd.setNurGebiete(true);
    jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + GEB_ERG, name); //$NON-NLS-1$
    befehleInitial[LEVEL_UNABHAENGIG].add(cmd);

    name = getBundleString("Gebiet_Status"); //$NON-NLS-1$
    cmd = createCommand(name, STATUS_GEB, Rechte.R_GEB_STATUS, false, "Status_Gebiet.jsp", //$NON-NLS-1$
        getBundleString("Gebiet_Status_titel"), //$NON-NLS-1$
        GUI_CLASS_1);
    cmd.setNurErfassungseinheit(true);
    jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + STATUS_GEB, name); //$NON-NLS-1$
    befehleInitial[LEVEL_UNABHAENGIG].add(cmd);

    name = getBundleString("Status"); //$NON-NLS-1$
    final String tooltip = tooltipStatusCommand();
    cmd = createCommand(name, STATUS, Rechte.R_EINGABE, false, "Status.jsp", //$NON-NLS-1$
        tooltip,
        GUI_CLASS_1);
    cmd.setNurWurzelgebiet(true);
    jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + STATUS, name); //$NON-NLS-1$
    befehleInitial[LEVEL_UNABHAENGIG].add(cmd);

    name = getBundleString("Freigabesteuerung_Referendum"); //$NON-NLS-1$
    jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + ADM_FREIGABE, name); //$NON-NLS-1$
    cmd = createCommand(name, ADM_FREIGABE, R_FREIGABE, false, "adm_freigabe.jsp", //$NON-NLS-1$
        getBundleString("Freigabesteuerung_Referendum_titel"), //$NON-NLS-1$
        GUI_CLASS_1);
    cmd.setNurWurzelgebiet(true);
    befehleInitial[LEVEL_UNABHAENGIG].add(cmd);

    name = getBundleString("Export_P4_Referendum"); //$NON-NLS-1$
    jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + REF_EXP, name); //$NON-NLS-1$
    cmd = createCommand(name, REF_EXP, R_EXPORT, false, "P4_Export_Referendum.jsp", //$NON-NLS-1$
        getBundleString("Export_P4_titel_Referendum"), //$NON-NLS-1$
        GUI_CLASS_1);
    cmd.setNurWurzelgebiet(true);
    befehleInitial[LEVEL_UNABHAENGIG].add(cmd);

    // Export N11 only for area Gemeente --> only PSB
    name = getBundleString("ExportVerzeichnis"); //$NON-NLS-1$
    jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + EXPORT_VERZEICHNIS, name); //$NON-NLS-1$
    cmd = createCommand(name, EXPORT_VERZEICHNIS, R_EXPORT, false, "dateiExportVerzeichnis.jsp", //$NON-NLS-1$
        getBundleString("Export_Verzeichnis_titel"), //$NON-NLS-1$
        GUI_CLASS_1);
    cmd.setNurWurzelgebiet(true);
    befehleInitial[LEVEL_UNABHAENGIG].add(cmd);

    name = getBundleString("Referendum"); //$NON-NLS-1$
    // logoutcmd kommt in alle Arrays hinten dran
    cmd = createCommand(name, REFERENDUM, null, false, "referendum.jsp", //$NON-NLS-1$
        getBundleString("Referendum"), //$NON-NLS-1$
        GUICommand.GUI_CLASS_6);
    cmd.setNurGebiete(true);
    jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + REFERENDUM, name); //$NON-NLS-1$
    befehleInitial[LEVEL_UNABHAENGIG].add(cmd);

    name = getBundleString("Hilfe"); //$NON-NLS-1$
    // logoutcmd kommt in alle Arrays hinten dran
    cmd = createCommand(name, HELP, null, false, "", //$NON-NLS-1$
        getBundleString("Hilfe_titel"), //$NON-NLS-1$
        GUICommand.GUI_CLASS_6);
    cmd.setAlleLevel(true);
    jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + HELP, name); //$NON-NLS-1$
    befehleInitial[LEVEL_UNABHAENGIG].add(cmd);

    name = getBundleString("Abmelden"); //$NON-NLS-1$
    // logoutcmd kommt in alle Arrays hinten dran
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

}
