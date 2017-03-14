/*
 * ReportNameComponentsMTP
 * 
 * Created on 31.03.2009
 * Copyright (c) 2009 IVU Traffic Technologies AG
 */
package de.ivu.wahl.wus.reportgen;

import java.util.Collections;
import java.util.List;

public class ReportNameComponentsMTP extends AbstractReportNameComponents {

  public String getEmlFileFirstName() {
    return "Helpdesk overeenkomst P4";
  }

  public List<String> getNameComponents() {
    return Collections.emptyList();
  }

  public ReportGeneratingProgram getProgramId() {
    return ReportGeneratingProgram.MTP;
  }

  public String getElectionIdentifier() {
    return "";
  }

}
