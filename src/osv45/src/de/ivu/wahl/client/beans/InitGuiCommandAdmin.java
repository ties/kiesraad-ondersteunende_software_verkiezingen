/*
 * InitGuiCommandAdmin
 * 
 * Created on 12.04.2007
 * Copyright (c) 2007 Statistisches Bundesamt und IVU Traffic Technologies AG
 */
package de.ivu.wahl.client.beans;

import java.util.Map;

import de.ivu.wahl.client.util.GUICommand;
import de.ivu.wahl.dataimport.AbstractImportEML;
import de.ivu.wahl.modell.GebietModel;

/**
 * @author D. Cosic, IVU Traffic Technologies AG
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
      int levelcount) {

    for (int level = 0; level < levelcount; level++) {
      befehleInitial[level] = new GUICommandArrayList();
      befehle[level] = new GUICommandArrayList();
    }

    initLevelUnabhaengig(jspLevelWorkName, befehleInitial);
    initLevelAdmin(jspLevelWorkName, befehleInitial);
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

    helper.addCommand(Command.ADM_NEUE_WAHL,
        "Neue_Wahl_importieren", "Neue_Wahl_importieren_titel", JspPage.WAHL_IMPORT); //$NON-NLS-1$//$NON-NLS-2$

    if (AbstractImportEML.MODE_DB_P4 == _wahlModus && GebietModel.EBENE_PSB == _wahlEbene) {
      helper
          .addCommand(Command.ADM_STIMMBEZIRKE,
              "Neue_Stimmbezirke_erzeugen", "Neue_Stimmbezirke_erzeugen_titel", JspPage.ADM_STIMMBEZIRKE_CREATE); //$NON-NLS-1$//$NON-NLS-2$
    }

    helper.addCommand(Command.ANWENDER_VERAENDERN_PASSWORT,
        "Passwort_veraendern", "Passwort_veraendern_titel", JspPage.ADM_ANWENDER_CHANGE_PW); //$NON-NLS-1$//$NON-NLS-2$
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

    helper.setGuiClass(GUICommand.GUI_CLASS_6);

    // hilfe cmd kommt in alle Arrays hinten dran
    cmd = helper.addCommand(Command.HELP, "Hilfe", "Hilfe_titel", JspPage.HELP); //$NON-NLS-1$ //$NON-NLS-2$
    cmd.setAlleLevel(true);

    // logout cmd kommt in alle Arrays hinten dran
    cmd = helper.addCommand(Command.SONST_LOGOUT, "Abmelden", "Abmelden_titel", JspPage.LOGOUT); //$NON-NLS-1$ //$NON-NLS-2$
    cmd.setAlleLevel(true);
  }

  /**
   * @return Array von Navigationsstrukturen und dazugehoerigen Gebietsarten
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
  public Command getAdminWorkDefault() {
    return Command.ADM_NEUE_WAHL;
  }

}