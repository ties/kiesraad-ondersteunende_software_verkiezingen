<%@ page import="de.ivu.wahl.client.beans.ApplicationBeanKonstanten"%>
<%@ page import="de.ivu.wahl.client.util.ClientHelper"%>
<%@ page errorPage="/jsp/MainErrorPage.jsp"%>
<%--
 *******************************************************************************
 * WAS = WahlAbwicklungsSystem
 * JSP-Seite, �ber die die gesammte Applikation zusammengebaut wird.
 * �ber den Request-Parameter VIEW ist eine grunds�tzliche Umstellung auf eine
 * weiter Sicht m�glich
 * Bisher ist nur die Sicht auf das Basis-System vorgesehen.
 *
 * author:  M. Murdfield  Copyright (c) 2002 Statistisches Bundesamt und IVU Traffic Technologies AG
 *******************************************************************************
 --%>
<%@include file="/jsp/fragments/common_headers.jspf"%>
<%
      String newLocation = ClientHelper.getAllParameters(request);

      int view = ClientHelper.getIntParameter(request.getParameter(ApplicationBeanKonstanten.VIEW),
          ApplicationBeanKonstanten.VIEWSTATE_INITIAL);
      switch (view) {
        case ApplicationBeanKonstanten.VIEW_BASIS :
          newLocation = "/jsp/wahl/basis.jsp?" + newLocation;
          break;
          
        // Hier k�nnen weitere Sichten auf die Applikation eingebunden werden
      }
%>

<html>
 <head>
  <title><ivu:int key="Wahlabwicklungssystem"/></title>
 </head>
 <body>
  <jsp:forward page="<%=newLocation%>" />
 </body>
</html>
