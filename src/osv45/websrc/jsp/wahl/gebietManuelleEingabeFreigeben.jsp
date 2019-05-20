<%--
 *******************************************************************************
 * Eingabe des Ergebnisses einer Erfassungseinheit
 *
 * author:  D. Cosic, IVU Traffic Technologies AG
 *******************************************************************************
 --%>
<%@ page pageEncoding="ISO-8859-1" contentType="text/html; charset=UTF-8"%>
<%@ page import="de.ivu.wahl.Konstanten"%>
<%@ page import="de.ivu.wahl.SystemInfo"%>
<%@ page import="de.ivu.wahl.WahlInfo"%>
<%@ page import="de.ivu.wahl.anwender.Recht" %>
<%@ page import="de.ivu.wahl.client.beans.Action" %>
<%@ page import="de.ivu.wahl.client.beans.JspPage" %>
<%@ page import="de.ivu.wahl.client.beans.*" %>
<%@ page import="de.ivu.wahl.client.util.*"%>
<%@ page import="de.ivu.wahl.eingang.GUIEingangMsg " %>
<%@ page import="de.ivu.wahl.modell.ErgebniseingangKonstanten"%>
<%@ page import="de.ivu.wahl.modell.GebietInfo" %>
<%@ page import="de.ivu.wahl.modell.GebietModel"%>
<%@ page import="de.ivu.wahl.modell.GruppeKonstanten.GruppeAllgemein"%>
<%@ page import="de.ivu.wahl.util.BundleHelper"%>
<%@ page import="java.lang.StringBuffer"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Set"%>
<%@ page import="org.apache.log4j.Logger"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ taglib uri="http://www.ivu.de/taglibs/ivu-wahl-1.0" prefix="ivu"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ page errorPage="/jsp/MainErrorPage.jsp" %>

<jsp:useBean id="appBean" scope="session" class="de.ivu.wahl.client.beans.ApplicationBean" />
<jsp:useBean id="eingabeBean" scope="session" class="de.ivu.wahl.client.beans.EingabeBean" />
<jsp:useBean id="map" scope="page" class="java.util.HashMap" type="java.util.Map"/>
<jsp:useBean id="applicationBeanKonstanten" scope="application"
   class="de.ivu.wahl.client.beans.ApplicationBeanKonstantenMap" />
<jsp:useBean id="ergebniseingangModelKonstanten" scope="application"
   class="de.ivu.wahl.client.beans.ErgebniseingangModelKonstantenMap" />
<jsp:useBean id="guiEingangMsgKonstanten" scope="application"
   class="de.ivu.wahl.client.beans.GUIEingangMsgKostantenMap" />
<jsp:useBean id="repHandler" scope="session" class="de.ivu.wahl.client.beans.RepositoryPropertyHandler" />
   
<c:set var="nr" value="${applicationBeanKonstanten.GEBIETNR_INITIAL}" scope="page"/>
<c:set var="gebietsNr" value="${param[applicationBeanKonstanten.GEBIETNR]}" scope="page"/>
<c:if test="${not empty gebietsNr}">
   <c:set var="nr" value="${gebietsNr}" scope="page"/>
</c:if>
<c:set var="gebietsArt" value="${param[applicationBeanKonstanten.LEVEL]}" scope="page"/>
<c:set var="gebietsBaum" value="${appBean.gebietsBaum}" scope="page"/>
<c:set var="gebietNodes" value="${gebietsBaum.gebietsNodes[gebietsArt]}" scope="page"/>
<c:if test="${not empty gebietNodes}">
   <c:set var="gebietNode" value="${gebietNodes[nr]}" scope="page"/>
</c:if>
<c:if test="${empty gebietNode}">
   <c:set var="gebietNode" value="${gebietsBaum.gebietsNodeRoot}" scope="page"/>
</c:if>
<c:set var="gebietInfo" value="${gebietNode.userObject}" scope="page"/>
<c:set target="${map}" property="gebietInfo" value="${gebietInfo}"/>
<c:set var="gebietName" value="<%= ClientHelper.forHTML(((GebietInfo)map.get("gebietInfo")).getName()) %>" scope="page"/>

<%@include file="/jsp/fragments/common_headers_no_cache.jspf"%>
<%
   String backgroundColor = appBean.getBackgroundColor(); // used in included jspf
   String helpKey = "ergEingabe"; //$NON-NLS-1$

   SystemInfo systemInfo = SystemInfo.getSystemInfo();
   WahlInfo wahlInfo = appBean.getWahlInfo();
   
   String eingInput = ApplicationBeanKonstanten.PREFIX;
   String erlaubenUrl = "/osv?cmd=" + Action.EINGABE_ERLAUBEN.getKey() + "&" + ClientHelper.getParametersDoNotStartWith(request, eingInput); //$NON-NLS-1$//$NON-NLS-2$
   // holen einer vorbereiteten Eingangsmessage für eine Erfassungseinheit
   GUIEingangMsg guiEingangMsg = eingabeBean.getGUIMsg(request, (GebietInfo)map.get("gebietInfo"), false); //$NON-NLS-1$
   
   guiEingangMsg.setInfoText(null);
   guiEingangMsg.setConfirmationText(null);
   String breite= "100%"; //$NON-NLS-1$
   String rechteFehler = appBean.getErrorIfRightsAreMissing(JspPage.GEBIET_MANUELLE_EINGABE_FREIGEBEN);
   
   boolean isReferendum = appBean.getWahlInfo().isReferendum();
   if (isReferendum) {
       helpKey = "ergEingabeRef"; //$NON-NLS-1$
   }
%>

<c:set var="wahlInfo" value="<%= wahlInfo %>" scope="page"/>
<c:set var="systemInfo" value="<%= systemInfo %>" scope="page"/>
<c:set var="guiEingangMsg" value="<%= guiEingangMsg %>" scope="page"/>
<c:set var="erlaubenUrl" value="<%= erlaubenUrl %>" scope="page"/>
<c:set var="isFileImportNeededAtFirst" value="${systemInfo.fileInputWithManualConfirmation and guiEingangMsg.source == ergebniseingangModelKonstanten.SOURCE_GUI_1}" scope="page"/>
<c:set var="keyForViewlock" value="${appBean.anwContext.keyForViewlock}" scope="page"/>
<c:set var="isLockedByAnotherUser" value="${ appBean.logLocking && !(appBean.INPUT_MAP[gebietInfo.idGebiet] eq keyForViewlock) }" scope="page"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
  "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <META HTTP-EQUIV="Pragma" CONTENT="no-cache"/>
   <head>
      <title><ivu:int key="GebietseingabeImDialog"/></title>
      <link rel="stylesheet" href="<%= request.getContextPath() %>/css/wahl2002.css">
      <script>
        var contextPath = "<%=request.getContextPath()%>";
      </script>
   </head>
   
   <jsp:element name="body">
    <jsp:attribute name="class">hghell</jsp:attribute>
    <jsp:attribute name="topmargin">0</jsp:attribute>
    <jsp:attribute name="marginwidth">0</jsp:attribute>
    <jsp:attribute name="marginheight">0</jsp:attribute>
    <jsp:body>   
    <div id="content">
        <% if (!rechteFehler.isEmpty())  { %>
          <p><b><%= ClientHelper.forHTML(rechteFehler) %></b></p>
        <% } else { %>
        <div id="trans">
           <%@include file="/jsp/fragments/print_and_help_div.jspf"%>
           <div class="hgschwarz" style="height: 1px; line-height: 1px; width: 100%;">
              &nbsp;
           </div>
           <div class="hggrau" style="height: 20px; width: 100%; text-indent: 5px; line-height: 18px;">
              <ivu:int key="FreigabeErfassungseinheit"/> ${gebietInfo.number4Display}: ${gebietName}
           </div>
           <div class="hgschwarz" style="height: 1px; line-height: 1px; width: 100%;">
              &nbsp;
           </div>
           <table width="<%=breite %>" cellspacing="0" cellpadding="0" border="0" class="hghell">
              <tbody>
                 <tr>
                    <td valign="top">
                       <table width="<%=breite%>" cellspacing="0" cellpadding="1" border="0">
                          <tbody>
                             <tr class="hghell" >
                                <td colspan="3" ><img alt="" src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="5"></td>
                             </tr>
                             <tr class="hghell" >
                                <td width="10"><img alt="" src="<%= request.getContextPath() %>/img/icon/blind.gif" height="1" width="1"></td>
                                <td valign="top">

                                <c:choose>
                                   <%-- No manual input allowed AND input of candidate results required AND not yet released AND no file import needed first --%>
                                   <c:when test="${!gebietInfo.guiEingabeErlaubt and systemInfo.inputmodusComplete and !wahlInfo.freigegeben and !isFileImportNeededAtFirst}">
                                      <fieldset>
                                         <legend><b><ivu:int key="EingabeNichtMoeglich"/></b></legend>
                                         <br />
                                         <table class="max" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                               <td width="10"><img src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="1"></td>
                                               <td valign="top">
                                                  <ivu:int key="ManuelleEingabenFreigebenHinweis"/>
                                                  <ivu:form name="gebieteingabe" action="${erlaubenUrl}">
                                                       <div align="center">
                                                          <input id="box2" style="cursor:pointer" type="submit" value="<%= BundleHelper.getBundleString("ManuelleEingabenFreigeben") %>" name="${applicationBeanKonstanten.PREFIX}erlauben">
                                                       </div>
                                                  </ivu:form>
                                                  <br />
                                               </td>
                                               <td width="10">&nbsp;</td>
                                            </tr>
                                         </table>
                                      </fieldset>
                                   </c:when>
                                   <c:otherwise>
                                      <fieldset>
                                         <legend><b><ivu:int key="EingabeMoeglich"/></b></legend>
                                         <br />
                                         <table class="max" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                               <td width="10"><img src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="1"></td>
                                               <td valign="top">
                                                  <ivu:int key="ManuelleEingabenNichtFreigebenHinweis"/>
                                               </td>
                                               <td width="10">&nbsp;</td>
                                            </tr>
                                         </table>
                                      </fieldset>
                                   </c:otherwise>
                                </c:choose>

                                </td>
                                <td width="10">
                                   &nbsp;
                                </td>
                             </tr>
                             <tr class="hghell" >
                                <td colspan="3"><img alt="" src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="5"></td>
                             </tr>
                          </tbody>
                       </table>
                    </td>
                 </tr>
              </tbody>
           </table>
        </div>
           <% } %>
      </div>
    </jsp:body>
   </jsp:element>
</html>