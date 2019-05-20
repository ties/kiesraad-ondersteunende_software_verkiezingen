/*
 * Created on 26.08.2010
 * Copyright (c) 2010 Statistisches Bundesamt und IVU Traffic Technologies AG
 */
package de.ivu.wahl.client.beans;

import static de.ivu.wahl.client.beans.Action.EXP_P4_EXPORT_P4_EML510C;
import static de.ivu.wahl.client.beans.Action.EXP_P4_EXPORT_P4_EMPTY_EML;
import static de.ivu.wahl.client.beans.Action.EXP_P4_EXPORT_P4_N10_1;
import static de.ivu.wahl.client.beans.Action.EXP_P4_EXPORT_P4_N11;
import static de.ivu.wahl.client.beans.Action.EXP_P4_EXPORT_P4_O3;
import static de.ivu.wahl.client.beans.Action.EXP_P4_EXPORT_P4_OSV4_1;
import static de.ivu.wahl.client.beans.Action.EXP_P4_EXPORT_P4_OSV4_4;
import static de.ivu.wahl.client.beans.Action.EXP_P4_EXPORT_P4_OSV4_5;
import static de.ivu.wahl.client.beans.Action.EXP_P4_EXPORT_P4_OSV4_6;
import static de.ivu.wahl.client.beans.Action.EXP_P4_EXPORT_P4_REFERENDUM;
import static de.ivu.wahl.client.beans.Action.EXP_P4_EXPORT_P4_T11;
import static de.ivu.wahl.client.beans.Action.EXP_P4_EXPORT_P4_VOTES_CSV;
import static de.ivu.wahl.client.beans.Action.EXP_P4_EXPORT_P4_WRR83;
import static de.ivu.wahl.client.beans.Action.EXP_P4_PROP_EINGABE_N11;
import static de.ivu.wahl.client.beans.Action.EXP_P4_PROP_EINGABE_O3;
import static de.ivu.wahl.client.beans.Action.EXP_P4_PROP_EINGABE_OSV4_4;
import static de.ivu.wahl.client.beans.Action.EXP_P4_PROP_EINGABE_OSV4_5;
import static de.ivu.wahl.client.beans.Action.EXP_P4_PROP_EINGABE_T11;
import static de.ivu.wahl.client.beans.Action.EXP_P4_PROP_EINGABE_WRR83;

import de.ivu.wahl.BasiseinstellungMultiMap;
import de.ivu.wahl.Konstanten;
import de.ivu.wahl.i18n.MessageKeys;
import de.ivu.wahl.wus.reportgen.ReportTemplateEnum;

/**
 * Summary of the most important properties of the different exports of P4.
 * 
 * @author J. Nottebaum, IVU Traffic Technologies AG
 */
enum ExportP4Type {
  O3(EXP_P4_EXPORT_P4_O3, ReportTemplateEnum.O3, EXP_P4_PROP_EINGABE_O3, Konstanten.PROP_O3_D1,
      MessageKeys.Error_O3_KonnteNichtExportiertWerden),

  N10_1(EXP_P4_EXPORT_P4_N10_1, ReportTemplateEnum.N10_1,
      MessageKeys.Error_N10_1_KonnteNichtExportiertWerden),

  N11(EXP_P4_EXPORT_P4_N11, ReportTemplateEnum.N11, EXP_P4_PROP_EINGABE_N11,
      Konstanten.PROP_N11_D1, MessageKeys.Error_N11_KonnteNichtExportiertWerden),

  T11(EXP_P4_EXPORT_P4_T11, ReportTemplateEnum.T11, EXP_P4_PROP_EINGABE_T11,
      Konstanten.PROP_T11_D1, MessageKeys.Error_T11_KonnteNichtExportiertWerden),

  EML510C(EXP_P4_EXPORT_P4_EML510C, ReportTemplateEnum.OSV4_1,
      MessageKeys.Error_EML510c_KonnteNichtExportiertWerden),

  OSV4_1(EXP_P4_EXPORT_P4_OSV4_1, ReportTemplateEnum.OSV4_1,
      MessageKeys.Error_OSV4_1_KonnteNichtExportiertWerden),

  OSV4_4(EXP_P4_EXPORT_P4_OSV4_4, ReportTemplateEnum.OSV4_4, EXP_P4_PROP_EINGABE_OSV4_4,
      Konstanten.PROP_OSV4_4_D1, MessageKeys.Error_OSV4_4_KonnteNichtExportiertWerden),

  OSV4_5(EXP_P4_EXPORT_P4_OSV4_5, ReportTemplateEnum.OSV4_5, EXP_P4_PROP_EINGABE_OSV4_5,
      Konstanten.PROP_OSV4_5_D1, MessageKeys.Error_OSV4_5_KonnteNichtExportiertWerden),

  REF(EXP_P4_EXPORT_P4_REFERENDUM, ReportTemplateEnum.OSV4_2,
      MessageKeys.Error_Referendum_KonnteNichtExportiertWerden),

  EMPTY_EML(EXP_P4_EXPORT_P4_EMPTY_EML, ReportTemplateEnum.EML,
      MessageKeys.Error_EmptyEml_KonnteNichtExportiertWerden),

  VOTES_CSV(EXP_P4_EXPORT_P4_VOTES_CSV, ReportTemplateEnum.OSV4_3,
      MessageKeys.Error_CSV_KonnteNichtExportiertWerden),

  WRR83(EXP_P4_EXPORT_P4_WRR83, ReportTemplateEnum.Wrr83, EXP_P4_PROP_EINGABE_WRR83,
      Konstanten.PROP_WRR83_D1, MessageKeys.Error_WRR83_KonnteNichtExportiertWerden),

  OSV4_6(EXP_P4_EXPORT_P4_OSV4_6, ReportTemplateEnum.OSV4_6,
      MessageKeys.Error_OSV4_6_KonnteNichtExportiertWerden);

  private final Action exportAction;
  private final ReportTemplateEnum template;
  private final String errorMsgKey;
  private final Action propertiesAction;
  private final BasiseinstellungMultiMap propertiesMap;

  @SuppressWarnings("hiding")
  ExportP4Type(Action exportAction,
      ReportTemplateEnum template,
      Action propertiesAction,
      BasiseinstellungMultiMap propertiesMap,
      String errorMsgKey) {
    this.exportAction = exportAction;
    this.template = template;
    this.propertiesAction = propertiesAction;
    this.propertiesMap = propertiesMap;
    this.errorMsgKey = errorMsgKey;
  }

  @SuppressWarnings("hiding")
  ExportP4Type(Action exportAction, ReportTemplateEnum template, String errorMsgKey) {
    this(exportAction, template, null, null, errorMsgKey);
  }

  public Action getExportAction() {
    return exportAction;
  }

  public ReportTemplateEnum getTemplate() {
    return template;
  }

  public String getErrorMsgKey() {
    return errorMsgKey;
  }

  public Action getPropertiesAction() {
    return propertiesAction;
  }

  public BasiseinstellungMultiMap getPropertiesMap() {
    return propertiesMap;
  }

  public boolean isWithParameters() {
    return propertiesMap != null;
  }
}