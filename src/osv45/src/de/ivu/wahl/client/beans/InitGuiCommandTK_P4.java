/*
 * InitGuiCommandTweedeKamerBund
 * 
 * Created on Oct 29, 2008
 * Copyright (c) 2008 IVU Traffic Technologies AG
 */
package de.ivu.wahl.client.beans;

import static de.ivu.wahl.client.util.GUICommand.GUI_CLASS_1;

import java.util.Map;

import de.ivu.wahl.client.util.GUICommand;
import de.ivu.wahl.modell.GebietModel;
import de.ivu.wahl.modell.WahlModel;

/**
 * @author mur@ivu.de, IVU Traffic Technologies AG
 */
public class InitGuiCommandTK_P4 extends InitGuiCommand_P4 implements ApplicationBeanKonstanten {

  /**
   * @param jspMap Beziehung zwischen work-Kodierung und JSPs
   * @param gebietsartErfassungseinheitMax Gebietsart der hierarchisch <b>niedrigsten</b>
   *          Erfassungseinheit im Gebietsbaum
   */
  public InitGuiCommandTK_P4(Map<Integer, String> jspMap,
      int gebietsartErfassungseinheitMax,
      int ebene) {
    super(jspMap, gebietsartErfassungseinheitMax, ebene);
  }

  @Override
  protected int[] getGebiete() {
    return WahlModel.GEBIETE_TWEEDE_KAMER;
  }

  @Override
  protected void initCommandGebietErgebnis(GUICommand cmd) {
    cmd.setBezeichnung(GebietModel.GEBIETSART_BUND, getBundleString("Gebiet_Ergebnis_BUND")); //$NON-NLS-1$
    cmd.setBezeichnung(LEVEL_WKR, getBundleString("Gebiet_Ergebnis_WK")); //$NON-NLS-1$
    cmd.setBezeichnung(LEVEL_GEM, getBundleString("Gebiet_Ergebnis_GEM")); //$NON-NLS-1$
    cmd.setBezeichnung(LEVEL_STIMMBEZ, getBundleString("Gebiet_Ergebnis_STIMMBEZ")); //$NON-NLS-1$
  }

  @Override
  protected void createCommandGebietErgebnisKandidat(Map<String, String> jspLevelWorkName,
      GUICommandList[] befehleInitial) {
    String name = getBundleString("Gebiet_Ergebnis_Kandidat"); //$NON-NLS-1$
    GUICommand cmd = createCommand(name, GEB_ERG_KAN, null, false, "gebietErgebnisKandidat.jsp", //$NON-NLS-1$
        getBundleString("Gebiet_Ergebnis_Kandidat_titel"), //$NON-NLS-1$
        GUI_CLASS_1);
    cmd.setNurGebiete(true);

    // if the Level is CSB the list of candidates are defined for a deeper Level
    if (_ebene == GebietModel.EBENE_CSB) {
      cmd.setNurErfassungseinheit(true);
    }
    jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + GEB_ERG_KAN, name); //$NON-NLS-1$
    befehleInitial[LEVEL_UNABHAENGIG].add(cmd);

    if (_ebene == GebietModel.EBENE_CSB) {
      name = getBundleString("Gebiet_Ergebnis_Kandidat"); //$NON-NLS-1$
      cmd = createCommand(name,
          GEB_ERG_KAN_ZUS,
          null,
          false,
          "gebietErgebnisKandidatZusammenfassung.jsp", //$NON-NLS-1$
          getBundleString("Gebiet_Ergebnis_Kandidat_titel"), //$NON-NLS-1$
          GUI_CLASS_1);
      // if the Level is CSB the list of candidates are defined for a deeper Level
      cmd.setNurWurzelgebiet(true);
      jspLevelWorkName.put(LEVEL_UNABHAENGIG + "_" + GEB_ERG_KAN_ZUS, name); //$NON-NLS-1$
      befehleInitial[LEVEL_UNABHAENGIG].add(cmd);
    }
  }

}
