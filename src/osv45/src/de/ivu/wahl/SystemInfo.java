/*
 * SystemInfo
 * 
 * Copyright (c) 2009 Statistisches Bundesamt und IVU Traffic Technologies AG
 */
package de.ivu.wahl;

import static de.ivu.ejb.EJBUtil.lookupLocal;
import static de.ivu.wahl.Konstanten.PROP_ELECTION_LEVEL;
import static de.ivu.wahl.Konstanten.PROP_ELECTION_MODE;

import java.io.Serializable;

import de.ivu.ejb.EJBUtil;
import de.ivu.wahl.admin.PropertyHandling;
import de.ivu.wahl.admin.PropertyHandlingBean;
import de.ivu.wahl.i18n.MessageKeys;
import de.ivu.wahl.modell.AuthorityLevel;
import de.ivu.wahl.modell.WahlModel;
import de.ivu.wahl.wus.reportgen.i18n.Messages;

/**
 * @author D. Cosic, IVU Traffic Technologies AG
 */
public class SystemInfo implements Serializable, Cloneable {
  private static final long serialVersionUID = -6961353557086785634L;

  static PropertyHandling _propHandling = null;

  private static PropertyHandling getPropertyHandling() {
    if (_propHandling == null) {
      _propHandling = lookupLocal(PropertyHandlingBean.class.getSimpleName());
    }
    return _propHandling;
  }

  private final transient AuthorityLevel _wahlEbene;
  private final transient int _wahlModus;
  private final transient String _installationSuffix;

  static SystemInfo __systemInfo;

  public static SystemInfo getSystemInfo() {
    if (__systemInfo == null) {
      __systemInfo = new SystemInfo();
    }
    return __systemInfo;
  }

  private SystemInfo() {
    _wahlModus = getPropertyHandling().getIntProperty(PROP_ELECTION_MODE);
    _wahlEbene = AuthorityLevel.byId(getPropertyHandling().getIntProperty(PROP_ELECTION_LEVEL));
    _installationSuffix = getPropertyHandling().getProperty(Konstanten.PROP_INSTALLATION_SUFFIX);
  }

  public int getWahlEbene() {
    return _wahlEbene == null ? 0 : _wahlEbene.getId();
  }

  public String getEbenenklartext() {
    return _wahlEbene.getShortName();
  }

  public String getEbenenklartextTitel() {
    if (AuthorityLevel.EBENE_PSB.equals(_wahlEbene)) {
      return "plaatselijk stembureau"; //$NON-NLS-1$
    }
    return getEbenenklartext();
  }

  public String getInstallationSuffix() {
    return _installationSuffix == null ? "" : _installationSuffix; //$NON-NLS-1$
  }

  /**
   * @return wahlModus.
   */
  public int getWahlModus() {
    return _wahlModus;
  }

  /**
   * @return Either "P4" or "P5"
   */
  public String getModusklartext() {
    return WahlModel.WAHLMODUS_KLARTEXT.get(_wahlModus);
  }

  public InputMode getInputMode() {
    return InputMode.fromProperty(getPropertyHandling().getProperty(Konstanten.PROP_DOUBLE_INPUT));
  }

  public boolean isFileInputWithManualConfirmation() {
    return getInputMode().isFileInputWithManualConfirmation();
  }

  /**
   * This is the case if the input mode is INPUT_MODE_FILE_WITH_MANUAL_CONFIRMATION or if the input
   * mode is INPUT_MODE_DOUBLE in P4_HSB and P4_CSB. See OSV-2087.
   * 
   * @return true, if a manual confirmation is needed after the result has been imported as EML
   *         file.
   */
  public boolean isManualConfirmationNeededAfterFileImport() {
    return getInputMode().isFileInputWithManualConfirmation() //
        || (getInputMode().isDoubleInput() //
        && ("P4_HSB".equals(EJBUtil.getProgramSpecificAffix()) //$NON-NLS-1$
        || "P4_CSB".equals(EJBUtil.getProgramSpecificAffix()))); //$NON-NLS-1$
  }

  /**
   * @return <code>true</code> if the input of candidate votes is required, otherwise
   *         <code>false</code>
   */
  public boolean isInputmodusComplete() {
    return getPropertyHandling().getBooleanProperty(Konstanten.PROP_IS_INPUT_MODE_COMPLETE);
  }

  public String getInputmodusCompleteKlartext() {
    if (AuthorityLevel.EBENE_PSB.equals(_wahlEbene)) {
      if (isInputmodusComplete()) {
        return Konstanten.KANDIDATENNIVEAU;
      }
      return Konstanten.PARTEINIVEAU;
    }
    return ""; //$NON-NLS-1$

  }

  public String getDoubleInputKlartext() {
    if (isSingleInput()) {
      return Konstanten.SINGLE_INPUT;
    }
    if (getInputMode().isDoubleInput()) {
      return Konstanten.DOUBLE_INPUT;
    }
    if (isFileInputWithManualConfirmation()) {
      return Konstanten.FILE_INPUT_WITH_MANUAL_CONFIRMATION;
    }
    throw new IllegalStateException(Messages.bind(MessageKeys.Error_IllegalInputModus_0,
        getInputMode()));
  }

  public boolean isSingleInput() {
    return getInputMode().isSingleInput();
  }

}
