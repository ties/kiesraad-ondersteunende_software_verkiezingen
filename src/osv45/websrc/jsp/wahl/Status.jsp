<%--
 *******************************************************************************
 * Eingangshistorie
 * Alle Ergebniseingänge chronologisch sortiert.
 * Veränderung der Stimmergebnisse
 *
 * author:  M. Murdfield  Copyright (c) 2002-7 Statistisches Bundesamt und IVU Traffic Technologies AG
 *******************************************************************************
 --%>
<%@ page import="de.ivu.wahl.AnwContext"%>
<%@ page import="de.ivu.wahl.GebietsBaum" %>
<%@ page import="de.ivu.wahl.SystemInfo"%>
<%@ page import="de.ivu.wahl.WahlInfo"%>
<%@ page import="de.ivu.wahl.anwender.Recht" %>
<%@ page import="de.ivu.wahl.client.beans.JspPage" %>
<%@ page import="de.ivu.wahl.util.BundleHelper"%>
<%@ page import="de.ivu.wahl.auswertung.erg.EingangsHistorieErgebnis.EingangsContainer"%>
<%@ page import="de.ivu.wahl.auswertung.*" %>
<%@ page import="de.ivu.wahl.modell.*" %>
<%@ page import="de.ivu.wahl.auswertung.erg.*" %>
<%@ page import="de.ivu.wahl.client.beans.*" %>
<%@ page import="de.ivu.wahl.client.util.*" %>
<%@ page import="org.apache.log4j.Category" %>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List"%>
<%@ page errorPage="/jsp/MainErrorPage.jsp" %>
<%@ taglib uri="http://www.ivu.de/taglibs/ivu-wahl-1.0" prefix="ivu" %>

<jsp:useBean id="appBean" scope="session" class="de.ivu.wahl.client.beans.ApplicationBean" />

<%@include file="/jsp/fragments/common_headers_no_cache.jspf"%>
<%
String backgroundColor = appBean.getBackgroundColor(); // used in included jspf
String helpKey = "status"; //$NON-NLS-1$

   WahlInfo wahlInfo = appBean.getWahlInfo();
   GebietsBaum gebietsBaum = appBean.getGebietsBaum();   
   int gebietNr = ApplicationBeanKonstanten.GEBIETNR_INITIAL;
   int ebene = SystemInfo.getSystemInfo().getWahlEbene();
   
   if (request.getParameter(ApplicationBeanKonstanten.GEBIETNR) != null && 
       request.getParameter(ApplicationBeanKonstanten.LEVEL) != null){
       gebietNr = ClientHelper.getIntParameter(request.getParameter(ApplicationBeanKonstanten.GEBIETNR));
   }
   else{
       // Auf Root wenn keine Daten im Request
       GebietInfo info = (GebietInfo)gebietsBaum.getWurzel().getUserObject();
       gebietNr = info.getNummer();
   }

   int   wkrNr  = -1;
   int   landNr  = -1;


   GebietInfo rootInfo = (GebietInfo)gebietsBaum.getWurzel().getUserObject();
       
   int yWahlkreise = rootInfo.getAnzahlGesamt();
   int xWahlkreise = rootInfo.getAnzahlEingegangen();
   int[] eingangsStatus = appBean.countEingangsStatus();
   int regionsComplete = eingangsStatus[0];
   int regionsFirstInput = eingangsStatus[1];
   int regionsWarning = eingangsStatus[2];
   int regionsError = eingangsStatus[3];


   List<EingangsHistorieErgebnis.EingangsContainer> erg = appBean.getEingangsStatus();
   String breite ="100%"; //$NON-NLS-1$
   String rechteFehler = appBean.getErrorIfRightsAreMissing(JspPage.STATUS); 

   boolean isReferendum = appBean.getWahlInfo().isReferendum();
   if (isReferendum) {
      helpKey = "statusRef"; //$NON-NLS-1$
   }
   boolean isEK = wahlInfo.isEK();

   %>
<html>
<head>
   <META HTTP-EQUIV="Pragma" CONTENT="no-cache"/>
   <title><%
      if (isEK) { %>
         <ivu:int key="Status_titel_EK"/>
      <% } else if (ebene == GebietModel.EBENE_CSB) { %>
         <ivu:int key="Status_titel_CSB"/>
      <% } else if (ebene == GebietModel.EBENE_HSB) { %>
         <ivu:int key="Status_titel_HSB"/>
      <% } else { %>
         <ivu:int key="Status_titel"/>
      <% } %>
   </title>
   <link rel="stylesheet" href="<%= request.getContextPath() %>/css/wahl2002.css">
   <style type="text/css">
       a:link { font-family: Arial, Verdana, Helvetica;
               font-size: 11px;
               color: #093C69;

      }
      a:hover { font-family: Arial, Verdana, Helvetica;
               font-size: 11px;
               color: #093C69;
               text-decoration:underline;

      }
      a:visited { font-family: Arial, Verdana, Helvetica;
                  font-size: 11px;
                  color: #093C69;

      }
   </style>
</head>

<body class='hghell'>
    <%@include file="/jsp/fragments/help_div.jspf"%>
    <div class="hgschwarz"
        style="height: 1px; line-height: 1px; width: 100%;">
        &nbsp;
    </div>
    <div class="hggrau"
        style="height: 20px; width: 100%; text-indent: 5px; line-height: 18px;">
        <% if (isEK) { %>
            <ivu:int key="Status_titel_EK"/>
        <% } else if (ebene == GebietModel.EBENE_CSB) { %>
            <ivu:int key="Status_titel_CSB"/>
        <% } else if (ebene == GebietModel.EBENE_HSB) { %>
            <ivu:int key="Status_titel_HSB"/>
        <% } else { %>
            <ivu:int key="Status_titel"/>
        <% } %> 
        <%= wahlInfo.isReferendum() || StringUtils.isEmpty(SystemInfo.getSystemInfo().getInputmodusCompleteKlartext()) ? "" : "(" + SystemInfo.getSystemInfo().getInputmodusCompleteKlartext() + ")" %>
    </div>
    <div class="hgschwarz"
        style="height: 1px; line-height: 1px; width: 100%;">
        &nbsp;
    </div>

<table width="<%= breite %>" border="0" cellspacing="0" cellpadding="0" align="center" class="hghell">
   <tr>
      <td valign="top">
         <% if (!rechteFehler.isEmpty())  { %>
           <p><b><%= ClientHelper.forHTML(rechteFehler) %></b></p>
         <% } else { %>
         <table width="<%= breite %>" border="0" cellspacing="0" cellpadding="0" class="hghell">
            <tr>
               <td>&nbsp;</td>
               <td valign="top" align="right" colspan="2">
                  <span class="layer3">
                     <ivu:int key="Eingegangen"></ivu:int>: <%=xWahlkreise%>/<%=yWahlkreise%>
                  </span>
               </td>
            </tr>
            <tr>
               <td>&nbsp;</td>
               <td valign="top">
                  &nbsp;
                  <span>
                     <img src="<%= request.getContextPath() %>/img/icon/accept.png">
                     <ivu:int key="Vollstaendig"></ivu:int>: <%=regionsComplete%>
                  </span>
                  &nbsp;
                  <span>
                     <img src="<%= request.getContextPath() %>/img/icon/layers.png">
                     <ivu:int key="Ersteingang"></ivu:int>: <%=regionsFirstInput%>
                  </span>
                  &nbsp;
                  <span>
                     <img src="<%= request.getContextPath() %>/img/icon/warning.png">
                     <ivu:int key="Warnung"></ivu:int>: <%=regionsWarning%>
                  </span>
                  &nbsp;
                  <span>
                     <img src="<%= request.getContextPath() %>/img/icon/exclamation.png">
                     <ivu:int key="Fehlermeldung"></ivu:int>: <%=regionsError%>
                  </span>
               </td>
               <td>&nbsp;</td>
            </tr>
            <tr>
               <td colspan="3"><img src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="10"></td>
            </tr>
            <tr>
               <td width="10"><img src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="1"></td>
               <td valign="top">
                  <table border="0" cellspacing="0" cellpadding="1" width="<%= breite %>">
                     <tr class="hgrot">
                        <td valign="top">
                           
                           <table width="<%= breite %>" border="0" cellspacing="0" cellpadding="0" class="hgweiss">
                              <tr>
                                 <td colspan="3"><img src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="10"></td>
                              </tr>
                              <tr>
                                 <td width="10"><img src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="1"></td>
                                 <td valign="top">
                                    <table border="0" cellspacing="2" cellpadding="4" class="hgweiss" width="<%= breite %>">
                                        <tr class="hgformular">
                                           <td><b><ivu:int key="UhrzeitDatum"/></b></td>
                                           <td><b><ivu:int key="Gebietname"/></b></td>
                                           <td><b><ivu:int key="Anwender"/></b></td>
                                           <td><b><ivu:int key="Input"/></b></td>
                                           <td><b><ivu:int key="StatusText"/></b></td>
                                           <td><b><ivu:int key="Status"/></b></td>
                                           <td><b><ivu:int key="InUse"/></b></td>
                                        </tr>
                                        <%
                                        if (erg == null || erg.isEmpty()){%>
                                            <tr class="hgweiss">
                                                <td valign="top" colspan="5" align="center"><ivu:int key="BisherKeinErgebniseingang"/></td>
                                            </tr>
                                        <% } else {
                                            int j = 1;
                                            for (EingangsHistorieErgebnis.EingangsContainer cont : erg){
                                                String url = request.getContextPath()+ "/jsp/wahl/Status_Gebiet.jsp?id_Gebiet="+cont.getGebietModel().getID_Gebiet()+"&a=b";
                                               %>
                                               <tr class="<%= j < 1?"hgeeeeee":"hgweiss"%>">
                                                  <td width="15%" valign="top"><nobr><%= cont.getZeitstempel() %></nobr></td>
                                                  <td width="20%" valign="top"><nobr><%= ClientHelper.forHTML(cont.getGebietBez()) %></nobr></td>
                                                  <td width="7%"  valign="top"><%= ClientHelper.forHTML(cont.getUserID()) %></td>
                                                  <td width="3%" valign="top" align="center"><img src="<%= request.getContextPath() %>/img/icon/<%= cont.getInputTypeImg()%>" width="10" height="10"><%= cont.getInputSequenceType()%></td>
                                                  <td valign="top"><%= ClientHelper.forHTML(cont.getStatusMeldung(), true) %></td>
                                                  <td width="3%" valign="top" align="center"><img src="<%= request.getContextPath() %>/img/icon/<%= cont.getStatusIcon()%>"></td>
                                                  <td width="5%" valign="top"><nobr><%= appBean.getINPUT_MAP().containsKey(cont.getID_Gebiet()) ? ClientHelper.forHTML(AnwContext.getUsernameFromLockvalue(appBean.getINPUT_MAP().get(cont.getID_Gebiet()))) : ""%></nobr></td>
                                               </tr>
                                               <%
                                                j = -j;
                                            }
                                        }
                                        %>
                                    </table>
                                 </td>
                                 <td width="10">&nbsp;</td>
                              </tr>
                              <tr>
                                 <td colspan="3"><img src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="10"></td>
                              </tr>
                           </table>
                        </td>
                     </tr>
                  </table>
               </td>
               <td width="10">&nbsp;</td>
            </tr>
            <tr>
               <td height="10"><img src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="1"></td>
            </tr>
         </table>
         <% } %>
      </td>
   </tr>
</table>
</body>
</html>
