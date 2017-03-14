/*
 * Created on 06.10.2010
 * Copyright (c) 2010 IVU Traffic Technologies AG
 */
package de.ivu.wahl.client.beans;

import static de.ivu.wahl.client.util.GUICommand.GUI_CLASS_1;
import static de.ivu.wahl.modell.GebietModel.GEBIETSART_LAND;

import java.util.Map;

import de.ivu.wahl.client.util.GUICommand;
import de.ivu.wahl.modell.WahlModel;

/**
 * @author jon@ivu.de, IVU Traffic Technologies AG
 */
public class InitGuiCommandEK_P5 extends InitGuiCommand_P5 implements ApplicationBeanKonstanten {
  private static final int[][] WAHL_ART_LEVEL = {{GEBIETSART_LAND}};

  /**
   * @param jspMap Beziehung zwischen work-Kodierung und JSPs
   * @param gebietsartErfassungseinheitMax Gebietsart der hierarchisch <b>niedrigsten</b>
   *          Erfassungseinheit im Gebietsbaum
   */
  public InitGuiCommandEK_P5(Map<Integer, String> jspMap, int gebietsartErfassungseinheitMax) {
    super(jspMap, gebietsartErfassungseinheitMax);
  }

  @Override
  protected int getTopLevel() {
    return WahlModel.GEBIETE_EERSTE_KAMER[0];
  }

  @Override
  protected int[][] getWahlartLevels() {
    return WAHL_ART_LEVEL;
  }

  @Override
  protected boolean isEKElection() {
    return true;
  }

  @Override
  protected String modelForProtocol() {
    return MODEL_U16;
  }

  @Override
  protected String getGebietErgebnisBundleString() {
    return "Gebiet_Ergebnis_BUND"; //$NON-NLS-1$
  }

  @Override
  protected void createCommandGebietErgebnisKandidat(Map<String, String> jspLevelWorkName,
      GUICommandList[] befehleInitial) {
    String name = getBundleString("Gebiet_Ergebnis_Kandidat"); //$NON-NLS-1$
    GUICommand cmd = createCommand(name,
        GEB_ERG_KAN_ZUS,
        null,
        false,
        "gebietErgebnisKandidatZusammenfassungEK.jsp", //$NON-NLS-1$
        getBundleString("Gebiet_Ergebnis_Kandidat_titel"), //$NON-NLS-1$
        GUI_CLASS_1);
    jspLevelWorkName.put(topLevel + "_" + GEB_ERG_KAN_ZUS, name); //$NON-NLS-1$
    befehleInitial[topLevel].add(cmd);
  }

}
