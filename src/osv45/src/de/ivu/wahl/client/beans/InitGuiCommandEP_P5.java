/*
 * Created on Oct 29, 2008
 * Copyright (c) 2008 IVU Traffic Technologies AG
 */
package de.ivu.wahl.client.beans;

import static de.ivu.wahl.client.util.GUICommand.GUI_CLASS_1;

import java.util.Map;

import de.ivu.wahl.client.util.GUICommand;
import de.ivu.wahl.modell.WahlModel;

/**
 * @author mur@ivu.de, IVU Traffic Technologies AG
 */
public class InitGuiCommandEP_P5 extends InitGuiCommand_P5 implements ApplicationBeanKonstanten {

  /**
   * @param jspMap Beziehung zwischen work-Kodierung und JSPs
   * @param gebietsartErfassungseinheitMax Gebietsart der hierarchisch <b>niedrigsten</b>
   *          Erfassungseinheit im Gebietsbaum
   */
  public InitGuiCommandEP_P5(Map<Integer, String> jspMap, int gebietsartErfassungseinheitMax) {
    super(jspMap, gebietsartErfassungseinheitMax);
  }

  @Override
  protected int getTopLevel() {
    return WahlModel.GEBIETE_EP_NL[0];
  }

  @Override
  protected String modelForProtocol() {
    return MODEL_P22_1;
  }

  @Override
  protected String getGebietErgebnisBundleString() {
    return "Gebiet_Ergebnis_BUND"; //$NON-NLS-1$
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
