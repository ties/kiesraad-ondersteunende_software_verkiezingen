/*
 * Created on 06.09.2010
 * Copyright (c) 2010 IVU Traffic Technologies AG
 */
package de.ivu.wahl.wus.reportgen;

import java.util.ArrayList;
import java.util.List;

import de.ivu.wahl.wus.electioncategory.ElectionCategory;

/**
 * @author jon@ivu.de, IVU Traffic Technologies AG
 */
public class ReportNameComponentsP5CSV extends AbstractReportNameComponents {

  /**
   * Constructor
   */
  public ReportNameComponentsP5CSV(String electionIdentifier,
      ElectionCategory electionCategory,
      String electionDomain) {
    super();
    setElectionIdentifier(electionIdentifier);
    setElectionCategory(electionCategory);
    setElectionDomain(electionDomain);
  }

  public ReportGeneratingProgram getProgramId() {
    return ReportGeneratingProgram.P5;
  }

  public String getEmlFileFirstName() {
    return RgConstants.FILENAME_520;
  }

  public List<String> getNameComponents() {
    List<String> result = new ArrayList<String>();
    // Add election identifier
    addElectionIdentifier(result);

    String electionDomain = getElectionDomain();
    if (electionDomain != null) {
      // Add election domain
      result.add(electionDomain);
    }

    return result;
  }

}
