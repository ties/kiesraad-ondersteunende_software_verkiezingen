/*
 * Created on 03.02.2011
 * Copyright (c) 2011 IVU Traffic Technologies AG
 */
package de.ivu.wahl.wus.reportgen;

public enum ReportLanguage {
  NL("nl", "Dutch"),

  FY("fy", "Frisian");

  private final String abbreviation;
  private final String description;

  private ReportLanguage(String abbreviation, String description) {
    this.abbreviation = abbreviation;
    this.description = description;
  }

  public String getAbbreviation() {
    return abbreviation;
  }

  public String getDescription() {
    return description;
  }

}
