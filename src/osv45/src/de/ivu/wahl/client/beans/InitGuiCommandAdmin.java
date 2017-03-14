/*
 * InitGuiCommandAdmin
 * 
 * Created on 12.04.2007
 * Copyright (c) 2007 IVU Traffic Technologies AG
 */
package de.ivu.wahl.client.beans;

import static de.ivu.wahl.client.util.GUICommand.GUI_CLASS_1;

import java.util.Map;

import de.ivu.wahl.anwender.Rechte;
import de.ivu.wahl.client.util.GUICommand;
import de.ivu.wahl.dataimport.AbstractImportEML;
import de.ivu.wahl.modell.GebietModel;

/**
 * @author cos@ivu.de, IVU Traffic Technologies AG
 */
public class InitGuiCommandAdmin extends InitGuiCommand implements ApplicationBeanKonstanten {

  private final int[][] _wahlartLevels;
  private final int _wahlModus;
  private final int _wahlEbene;

  /**
   * @param jspMap Beziehung zwischen work-Kodierung und JSPs
   * @param gebietsartErfassungseinheitMax Gebietsart der hierarchisch <b>niedrigsten</b>
   *          Erfassungseinheit im Gebietsbaum
   * @param modus P4 or P5
   * @param ebene CSB / HSB / PSB
   */
  public InitGuiCommandAdmin(Map<Integer, String> jspMap,
      int gebietsartErfassungseinheitMax,
      int modus,
      int ebene) {
    super(jspMap, gebietsartErfassungseinheitMax);
    _wahlartLevels = new int[][]{};
    _wahlModus = modus;
    _wahlEbene = ebene;
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
  }

  /**
   * initLevelAdmin
   * 
   * @param jspLevelWorkName
   * @param befehleInitial
   */
  private void initLevelAdmin(Map<String, String> jspLevelWorkName, GUICommandList[] befehleInitial) {
    String name;
    GUICommand cmd;

    name = getBundleString("Neue_Wahl_importieren"); //$NON-NLS-1$
    jspLevelWorkName.put(LEVEL_ADMIN + "_" + ADM_NEUE_WAHL, name); //$NON-NLS-1$
    cmd = createCommand(name,
        ADM_NEUE_WAHL,
        Rechte.R_ADM_WAHLCREATEREMOVE,
        false,
        "wahlImport.jsp", //$NON-NLS-1$
        getBundleString("Neue_Wahl_importieren_titel"), //$NON-NLS-1$
        GUICommand.GUI_CLASS_1);
    befehleInitial[LEVEL_ADMIN].add(cmd);

    if (AbstractImportEML.MODE_DB_P4 == _wahlModus && GebietModel.EBENE_PSB == _wahlEbene) {
      name = getBundleString("Neue_Stimmbezirke_erzeugen"); //$NON-NLS-1$
      jspLevelWorkName.put(LEVEL_ADMIN + "_" + ADM_STIMMBEZIRKE, name); //$NON-NLS-1$
      cmd = createCommand(name,
          ADM_STIMMBEZIRKE,
          Rechte.R_ADM_WAHLCREATEREMOVE,
          false,
          "adm_stimmbezirke.jsp", //$NON-NLS-1$
          getBundleString("Neue_Stimmbezirke_erzeugen_titel"), //$NON-NLS-1$
          GUICommand.GUI_CLASS_1);
      befehleInitial[LEVEL_ADMIN].add(cmd);
    }

    name = getBundleString("Passwort_veraendern"); //$NON-NLS-1$
    jspLevelWorkName.put(LEVEL_ADMIN + "_" + ANWENDER_VERAENDERN_PASSWORT, name); //$NON-NLS-1$
    befehleInitial[LEVEL_ADMIN].add(createCommand(name,
        ANWENDER_VERAENDERN_PASSWORT,
        null,
        false,
        "adm_anwender_change_pw.jsp", //$NON-NLS-1$
        getBundleString("Passwort_veraendern_titel"), //$NON-NLS-1$
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
  }

  /**
   * @return Array von Navigationsstrukturen und dazugeh�rigen Gebietsarten
   */
  @Override
  protected int[][] getWahlartLevels() {
    return _wahlartLevels;
  }

  @Override
  protected int[][] getAdminWahlartLevels() {
    return _wahlartLevels;
  }

  @Override
  public boolean isGebieteVorhanden() {
    return false;
  }

  @Override
  public int getAdminWorkDefault() {
    return ADM_NEUE_WAHL;
  }

}