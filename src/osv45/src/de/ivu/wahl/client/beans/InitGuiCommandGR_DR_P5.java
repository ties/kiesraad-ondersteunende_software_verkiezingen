/*
 * Copyright (c) 2010 IVU Traffic Technologies AG
 */
package de.ivu.wahl.client.beans;

import static de.ivu.wahl.client.util.GUICommand.GUI_CLASS_1;
import static de.ivu.wahl.modell.GebietModel.GEBIETSART_GEMEINDE;

import java.util.Map;

import de.ivu.wahl.client.util.GUICommand;

/**
 * Common superclass of InitGuiCommandGemeente_P5 and InitGuiCommandDeelraad_P5.
 * 
 * @author jon@ivu.de, IVU Traffic Technologies AG
 */
public abstract class InitGuiCommandGR_DR_P5 extends InitGuiCommand_P5
    implements
      ApplicationBeanKonstanten {

  private static final int[][] WAHL_ART_LEVEL = {{GEBIETSART_GEMEINDE}};

  private static final int[][] ADMIN_WAHL_ART_LEVEL = {{GEBIETSART_GEMEINDE}};

  @Override
  protected String getLowerGebietErgebnisBundleString() {
    return "Gebiet_Ergebnis_STIMMBEZ"; //$NON-NLS-1$
  }

  /**
   * @param jspMap Beziehung zwischen work-Kodierung und JSPs
   * @param gebietsartErfassungseinheitMax Gebietsart der hierarchisch <b>niedrigsten</b>
   *          Erfassungseinheit im Gebietsbaum
   */
  public InitGuiCommandGR_DR_P5(Map<Integer, String> jspMap, int gebietsartErfassungseinheitMax) {
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
  protected String modelForProtocol() {
    return MODEL_P22_2;
  }

  @Override
  protected String getGebietErgebnisBundleString() {
    return "Gebiet_Ergebnis_GEM"; //$NON-NLS-1$
  }

  @Override
  protected void createCommandGebietErgebnisKandidat(Map<String, String> jspLevelWorkName,
      GUICommandList[] befehleInitial) {
    String name = getBundleString("Gebiet_Ergebnis_Kandidat"); //$NON-NLS-1$
    GUICommand cmd = createCommand(name, GEB_ERG_KAN, null, false, "gebietErgebnisKandidat.jsp", //$NON-NLS-1$
        getBundleString("Gebiet_Ergebnis_Kandidat_titel"), //$NON-NLS-1$
        GUI_CLASS_1);
    jspLevelWorkName.put(topLevel + "_" + GEB_ERG_KAN, name); //$NON-NLS-1$
    befehleInitial[topLevel].add(cmd);
  }

}
