<%@ page import="java.util.Locale"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.TreeMap"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.StringReader"%>
<%@ page import="java.text.Format"%>
<%@ page import="java.text.DecimalFormatSymbols"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="javax.swing.text.NumberFormatter"%>
<%@ page import="javax.swing.tree.DefaultMutableTreeNode"%>
<%@ page import="de.ivu.wahl.AnwContext"%>
<%@ page import="de.ivu.wahl.GebietsBaum"%>
<%@ page import="de.ivu.wahl.WahlInfo"%>
<%@ page import="de.ivu.wahl.SystemInfo"%>
<%@ page import="de.ivu.wahl.anwender.Recht" %>
<%@ page import="de.ivu.wahl.client.beans.JspPage" %>
<%@ page import="de.ivu.wahl.client.beans.ApplicationBeanKonstanten"%>
<%@ page import="de.ivu.wahl.client.util.ClientHelper"%>
<%@ page import="de.ivu.wahl.eingang.GUIEingangMsg"%>
<%@ page import="de.ivu.wahl.eingang.GUIEingangMsgEK"%>
<%@ page import="de.ivu.wahl.modell.BasicEingangMsg"%>
<%@ page import="de.ivu.wahl.modell.BasicEingangMsg.Gruppenergebnis"%>
<%@ page import="de.ivu.wahl.modell.ErgebniseingangKonstanten"%>
<%@ page import="de.ivu.wahl.modell.GebietInfo"%>
<%@ page import="de.ivu.wahl.modell.GruppeGebietsspezifischGruppeComposite"%>
<%@ page import="de.ivu.wahl.modell.GruppeKonstanten"%>
<%@ page import="de.ivu.wahl.modell.GruppeKonstanten.GruppeAllgemein"%>
<%@ page import="de.ivu.wahl.modell.PersonendatenModel"%>
<%@ page import="de.ivu.wahl.modell.StimmergebnisModel"%>
<%@ page import="de.ivu.wahl.modell.WahlModel"%>
<%@ page import="de.ivu.wahl.util.BundleHelper"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ taglib uri="http://www.ivu.de/taglibs/ivu-wahl-1.0" prefix="ivu"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:directive.page import="org.apache.log4j.Logger"/>

<%--
 *******************************************************************************
 * Gebietsergebnis
 * Stimmanteile aller Parteien und W�hlergruppen
 *
 * Enth�lt die Pr�fung, ob eine Wahleinheit zum Ausbleiben oder zur Nachwahl markiert ist.
 * Hat der Anwender nicht das entsprechende Recht, erh�lt er den entsprechenden Hinweis
 *
 * author:  M. Murdfield, bae, D. Cosic Copyright (c) 2004-10 Statistisches Bundesamt und IVU Traffic Technologies AG
 *******************************************************************************
 --%>
<jsp:useBean id="appBean" scope="session" class="de.ivu.wahl.client.beans.ApplicationBean" />
<jsp:useBean id="eingabeBean" scope="session" class="de.ivu.wahl.client.beans.EingabeBean" />
<%@include file="/jsp/fragments/common_headers_no_cache.jspf"%>
<%
   String backgroundColor = appBean.getBackgroundColor(); // used in included jspf
   String breite ="100%"; //$NON-NLS-1$
   String rechteFehler = appBean.getErrorIfRightsAreMissing(JspPage.GEBIET_ERGEBNIS_EK);
   String helpKey = "gebietErg"; //$NON-NLS-1$
   
   SystemInfo systemInfo = SystemInfo.getSystemInfo();
   WahlInfo wahlInfo = appBean.getWahlInfo();
   Logger log = Logger.getLogger("jsp.gebietErgebnisEK"); //$NON-NLS-1$

   GebietsBaum gebietsBaum = appBean.getGebietsBaum();
   GebietInfo rootInfo = (GebietInfo)gebietsBaum.getWurzel().getUserObject();
   int gebietsArt = ClientHelper.getLevel(request, rootInfo.getGebietsart());
   int nr = ClientHelper.getGebietNr(request, rootInfo.getNummer());  

   // Ergebnis abholen
   DefaultMutableTreeNode node = gebietsBaum.getGebietsNode(gebietsArt, nr);
   GebietInfo gebietInfo = node != null ? (GebietInfo)node.getUserObject() : rootInfo;
   
   AnwContext anwContext = appBean.getAnwContext(); 
   
   NumberFormat nf = NumberFormat.getNumberInstance();
   nf.setMaximumFractionDigits(ApplicationBeanKonstanten.MAXIMUM_DIGET_PROZ);
   nf.setMinimumFractionDigits(ApplicationBeanKonstanten.MINIMUM_DIGET_PROZ);
    
   GUIEingangMsgEK msg = eingabeBean.getGUIMsgEK(request, gebietInfo, true);

   String infoText = ClientHelper.forHTML(msg.getInfoText());
   String confirmationText = ClientHelper.forHTML(msg.getConfirmationText());
   msg.setInfoText(null);
   msg.setConfirmationText(null);

   boolean isErfassungseinheit = gebietInfo.isErfassungseinheit();
   boolean isFirstInput = false;
   if (gebietInfo.getStatusLetzterEingang() == ErgebniseingangKonstanten.STATE_FIRST_RESULT_OK) {
      isFirstInput = true;
   }
   boolean hatRechtFuerErfassung = appBean.getAnwContext().checkRight(Recht.R_EINGABE);
   String urlToGebietEingang = ClientHelper.generateURL(request, ApplicationBeanKonstanten.GEBE, true);
   %>

<c:set var="systemInfo" value="<%= systemInfo %>" scope="page"/>
<c:set var="gebietInfo" value="<%= gebietInfo %>" scope="page"/>
<c:set var="infoText" value="<%= infoText %>" scope="page"/>
<c:set var="confirmationText" value="<%= confirmationText %>" scope="page"/>

<c:set var="ersterErfasser" value="${gebietInfo.ersterErfasser}" scope="page"/>
<c:set var="aktuellerErfasser" value="${appBean.anwContext.anmeldename}" scope="page"/>
<c:set var="isDoubleInput" value="${not systemInfo.singleInput}" scope="page"/>
<c:set var="isZweiterErfasserGleichErsterErfasser" value="${isDoubleInput && ersterErfasser == aktuellerErfasser}" scope="page"/>
<c:set var="isErfassungseinheit" value="<%= isErfassungseinheit %>" scope="page"/>
<c:set var="isFirstInput" value="<%= isFirstInput %>" scope="page"/>
<c:set var="isShowButtonToGebietEingang" value="${isErfassungseinheit && isFirstInput && hatRechtFuerErfassung && not isZweiterErfasserGleichErsterErfasser}" scope="page"/>

<html>
<head>
   <title><ivu:int key="XXX_1"/> </title>
   <link type="text/css" rel="stylesheet" href="<%= request.getContextPath() %>/css/wahl2002.css">
      <style type="text/css">
      td {font-size:10px; line-height:15px}
      </style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" class="hgeeeeee">
<%@include file="/jsp/fragments/print_and_help_row.jspf"%>
<table width="<%= breite %>" border="0" cellspacing="0" cellpadding="0" align="center" class="hghell">
   <tr>
      <td colspan="3" class="hgschwarz"><img alt="" src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="1"></td>
   </tr>
   <tr>
      <td class="hggrau">&nbsp;</td>
      <td class="hggrau" height="19" colspan="2"><ivu:int key="Gebiet_Ergebnis_titel" /> <%= wahlInfo.isReferendum() || StringUtils.isEmpty(SystemInfo.getSystemInfo().getInputmodusCompleteKlartext()) ? "" : "(" + SystemInfo.getSystemInfo().getInputmodusCompleteKlartext() + ")" %></td>
   </tr>
   <tr>
      <td colspan="3" class="hgschwarz"><img alt="" src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="1"></td>
   </tr>
   <tr>
      <td colspan="3" class="hghell"><img alt="" src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="5"></td>
   </tr>
   <c:if test="${not empty confirmationText}">
      <tr>
         <td></td>
         <td style="color: green; padding-top: 20px; padding-bottom: 30px;">${confirmationText}</td>
         <td></td>
      </tr>
   </c:if>
   <c:if test="${not empty infoText}">
      <tr>
         <td></td>
         <td style="color: red; padding-top: 20px; padding-bottom: 30px;">${infoText}</td>
         <td></td>
      </tr>
   </c:if>
   <c:if test="${isShowButtonToGebietEingang}">
      <tr>
         <td></td>
         <td style="padding-top: 20px; padding-bottom: 30px;">
            <ivu:a href="<%= urlToGebietEingang %>" id="box2a" style="cursor:pointer" target="_top"><%= BundleHelper.getBundleString("Zweiteingabe") %></ivu:a>
         </td>
         <td></td>
      </tr>
   </c:if>
   <tr>
      <td width="10"><img alt="" src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="1"></td>
      <td valign="top" colspan="2">
        <% if (!rechteFehler.isEmpty())  { %>
          <p><b><%= ClientHelper.forHTML(rechteFehler) %></b></p>
        <% } else { %>
        <table border="0" cellspacing="0" cellpadding="1" width="99%">
            <tr class="hgrot">
               <td valign="top">
                  <table width="<%= breite %>" border="0" cellspacing="0" cellpadding="0" class="hgweiss">
                     <tr class="hgeeeeee">
                        <td width="5" height="18">&nbsp;</td>
                        <td><b><%=ClientHelper.forHTML(gebietInfo.getCompleteDisplay(", "))%></b></td>
                        <td align="right"><b><%= ClientHelper.forHTML(wahlInfo.getWahlName()) %></b></td>
                        <td width="5" height="18">&nbsp;</td>
                     </tr>
                     <tr>
                         <td colspan="4" class="hgrot"><img alt="" src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="1"></td>
                     </tr>
                     <tr>
                        <td colspan="4"><img alt="" src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="5"></td>
                     </tr>
                     <tr>
                        <td width="5"><img alt="" src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="1"></td>
                        <td colspan="2" valign="top">
                           <table border="0" width="<%= breite %>" cellspacing="2" cellpadding="4" align="center">
                              <tr class="hgformular">
                                 <td valign="top" rowspan="2" align="center" colspan="3">
                                    <strong><ivu:int key="Subjekt"/></strong>
                                 </td>
                                 <td valign="top" colspan="4" align="center">
                                    <strong><ivu:int key="Stimmen"/></strong>
                                 </td>
                              </tr>
                              <tr class="hgformular">
                                  <td class="einrue"><div class="einrue"><b><ivu:int key="Anzahl"/></b></div></td>
                                  <td class="einrue" nowrap="nowrap"><div class="einrue"><b><ivu:int key="AnzahlGewichtet"/></b></div></td>
                                  <td valign="top" align="center"><strong>%</strong></td>
                                  <td valign="top" align="center">&nbsp;</td>
                              </tr>
                              <%-- parteien  --%>
                              <%
                              if (msg != null){
                                  int j = 1;
                                  boolean first = true;
                                  String aktuelleKategorie = "";
                                  for (GUIEingangMsgEK.GruppendatenEK gErg : msg.getGruppendaten().values()){
                                    int gruppenposition = gErg.getPosition();
                                    String kategorie = gErg.getKategorie();
                                    boolean isSmallFontSize = gErg.isSmallFontSize();
                                    boolean isVisible = gErg.isVisibleInOverview();
                                    Gruppenergebnis gruppenergebnis = msg.getGruppenergebnis(gruppenposition);
                                    String gruppefehler = gruppenergebnis.getGruppefehler();
                                    if (gruppenposition < 0 && isVisible && !kategorie.equals(aktuelleKategorie)){ %>
                                        <tr class="<%= j>0 ?"hgeeeeee":"hgweiss" %>">
                                            <td colspan="7" height="20"><img alt="" src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" ></td>
                                        </tr><%
                                        aktuelleKategorie = kategorie;
                                    }
                                    if (gruppefehler != null) { %>
                                        <tr id="row${position}_0_error">
                                         <td align="left" colspan="7">
                                           <table border="0" cellspacing="0" cellpadding="0">
                                             <tr>
                                                 <td>
                                                    <img src="<%= request.getContextPath() %>/img/icon/warnung.gif" width="20" height="20" alt="<%= BundleHelper.getBundleString("Warnung")%>" align="middle">
                                                 </td>
                                                 <td>
                                                    <font color="red"><%= ClientHelper.forHTML(gruppefehler) %></font>
                                                 </td>
                                             </tr>
                                           </table>
                                         </td>
                                       </tr><%
                                    }
                                    if (gruppenposition < 0){ %>
                                          <tr class="<%= j>0 ?"hgweiss":"hgeeeeee" %>"<%= isVisible ? "" : " style=\"display:none\"" %>>
                                            <td colspan="3"><b><%= isSmallFontSize ? "<small>":"" %><%= gErg.getName() %><%= isSmallFontSize ? "</small>":"" %></b></td>
                                            <td class="einrue"><div class="einrue"><b><%=ClientHelper.getStimmanzahlString(msg.getGruppenstimmen(gruppenposition), ClientHelper.DF)%></b></div></td>
                                            <td class="einrue"><div class="einrue"><b><%=gErg.hasWeightedValue() ? ClientHelper.getStimmanzahlString(msg.getGruppenstimmenGewichtet(gruppenposition), ClientHelper.DF) : "&nbsp;"%></b></div></td>
                                            <td width="35px" align="right"><b><%=ClientHelper.getStimmProzentString(gErg.getStimmenprozent(), nf )%></b></td>
                                            <td><%=gErg.getHelptext()%></td>
                                          </tr> <% 
                                     } else {
                                        if (first){ %>
                                            <tr class="hgweiss">
                                                <td colspan="7" height="20"><img alt="" src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" ></td>
                                             </tr>
                                        <% }%>
                                        <tr class="<%= j>0 ?"hgweiss":"hgeeeeee" %>">
                                            <td><b><%= gErg.getPosition() %></b></td>
                                            <td><b><%= gErg.getName() %></b></td>
                                            <td width="3%" align="center" ><span style="background-color:<%=gErg.getFarbe()%>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                                            <td class="einrue"><div class="einrue"><b><%=ClientHelper.getStimmanzahlString(msg.getGruppenstimmen(gruppenposition), ClientHelper.DF)%></b></div></td>
                                            <td class="einrue"><div class="einrue"><b><%=ClientHelper.getStimmanzahlString(msg.getGruppenstimmenGewichtet(gruppenposition), ClientHelper.DF)%></b></div></td>
                                            <td align="right"><b><%=ClientHelper.getStimmProzentString(msg.getStimmenprozentGewichtet(gruppenposition), nf )%></b></td>
                                            <td>&nbsp;</td>
                                         </tr><%
                                         first = false;
                                         }
                                      if (isVisible) {
                                         j=-j;
                                      }
                                    }
                                  }
                              %>
                           </table>
                        </td>
                        <td width="5">&nbsp;</td>
                     </tr>
                     <tr>
                        <td height="5" colspan="6"><img src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="1"></td>
                     </tr>
                  </table>
               </td>
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