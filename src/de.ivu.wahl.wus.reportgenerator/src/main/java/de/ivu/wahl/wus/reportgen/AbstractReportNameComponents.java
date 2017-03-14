/*
 * AbstractReportNameComponents
 * 
 * Created on 27.01.2009
 * Copyright (c) 2009 IVU Traffic Technologies AG
 */
package de.ivu.wahl.wus.reportgen;

import java.util.List;

import de.ivu.wahl.wus.electioncategory.ElectionCategory;

public abstract class AbstractReportNameComponents
    implements
      ReportNameComponents,
      ReportNameComponentsSetter {
  private String electionIdentifier;
  private String electionDomain;
  private String electoralDistrict;
  private ElectionCategory _electionCategory;

  public String getElectionIdentifier() {
    return electionIdentifier;
  }

  public void setElectionIdentifier(String electionIdentifier) {
    this.electionIdentifier = electionIdentifier;
  }

  public String getElectionDomain() {
    return electionDomain;
  }

  public void setElectionDomain(String electionDomain) {
    this.electionDomain = electionDomain;
  }

  public String getElectoralDistrict() {
    return electoralDistrict;
  }

  public void setElectoralDistrict(String electoralDistrict) {
    this.electoralDistrict = electoralDistrict;
  }

  public String getSpecificPathExtension() {
    return ""; //$NON-NLS-1$
  }

  /**
   * @return <code>true</code>, if all files are in a subfolder of the root folder that is named by
   *         the election identifier. <code>false</code> otherwise
   */
  public boolean useElectionIdentifier() {
    ReportGeneratingProgram programId = getProgramId();
    return ReportGeneratingProgram.P1.equals(getProgramId())
        || ReportGeneratingProgram.P2.equals(getProgramId())
        || ReportGeneratingProgram.P3.equals(programId);
  }

  public abstract ReportGeneratingProgram getProgramId();

  public ElectionCategory getElectionCategory() {
    return _electionCategory;
  }

  public void setElectionCategory(ElectionCategory electionCategory) {
    _electionCategory = electionCategory;
  }

  /**
   * Adds the election domain to the list, if this is a relevant part of the report name
   */
  protected void addElectionDomain(List<String> list) {
    if (getElectionCategory().isElectionDomainNeeded() && getElectionDomain() != null) {
      list.add(getElectionDomain());
    }
  }

  protected void addElectionIdentifier(List<String> list) {
    String ei = getElectionIdentifier();
    if (ei != null && ei.length() > 6) {
      ei = ei.substring(0, 6);
    }
    list.add(ei);
  }

  public boolean isOpenbaarLichaam() {
    return false;
  }
}
