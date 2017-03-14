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
 * author:  mur@ivu.de  Copyright (c) 2002 Statistisches Bundesamt und IVU Traffic Technologies AG
 * $Id: osv.jsp,v 1.2 2009/02/13 15:50:14 sma Exp $
 *******************************************************************************
 --%>
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
