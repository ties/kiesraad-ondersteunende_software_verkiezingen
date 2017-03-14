/*
 * ReportNameComponentsP3
 * 
 * Created on 27.01.2009
 * Copyright (c) 2009 IVU Traffic Technologies AG
 */
package de.ivu.wahl.wus.reportgen;

import java.util.ArrayList;
import java.util.List;

public class ReportNameComponentsP3 extends AbstractReportNameComponents {

  public ReportGeneratingProgram getProgramId() {
    return ReportGeneratingProgram.P3;
  }

  public String getEmlFileFirstName() {
    return RgConstants.FILENAME_230C;
  }

  public List<String> getNameComponents() {
    List<String> result = new ArrayList<String>();
    addElectionIdentifier(result);
    if (getElectionDomain() != null) {
      result.add(getElectionDomain());
    }
    if (getElectoralDistrict() != null) {
      result.add(getElectoralDistrict());
    }

    return result;
  }
}
