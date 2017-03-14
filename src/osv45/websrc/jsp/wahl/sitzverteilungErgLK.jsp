<%--
 *******************************************************************************
 * Sitzverteilung
 * Sitzverteilung nach dem Niemeyer-Verfahren.
 *
 * author:  mur@ivu.de  Copyright (c) 2002-7 IVU Traffic Technologies AG
 * $Id: sitzverteilungErgLK.jsp,v 1.24 2011/04/07 07:46:00 tdu Exp $
 *******************************************************************************
 --%>

<%@ page import="de.ivu.wahl.modell.WahlModel" %>
<%@ page import="de.ivu.wahl.WahlInfo" %>
<%@ page import="de.ivu.wahl.client.util.ClientHelper" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="de.ivu.wahl.auswertung.erg.sv.SitzverteilungErg" %>
<%@ page import="de.ivu.wahl.AnwContext" %>
<%@ page errorPage="/jsp/MainErrorPage.jsp"%>
<%@ page import="de.ivu.wahl.auswertung.erg.sv.Gruppenzeile"%>
<%@ page import="de.ivu.wahl.auswertung.erg.sv.SitzverteilungErg"%>
<%@ page import="java.util.Set"%>
<%@ page import="de.ivu.wahl.auswertung.sv.SitzverteilungStatus"%>
<%@ page import="de.ivu.wahl.modell.ejb.Wahl"%>
<%@ page import="de.ivu.wahl.client.beans.ApplicationBeanKonstanten"%>
<%@ page import="de.ivu.wahl.modell.ejb.SitzberechnungErgebnis"%>
<%@ page import="de.ivu.wahl.modell.ejb.Alternative"%>
<%@ page import="de.ivu.wahl.modell.AlternativeModel"%>
<%@ page import="de.ivu.wahl.auswertung.erg.sv.SitzverteilungListenkombinationErg"%>
<%@ page import="java.util.Collection"%>
<%@ page import="de.ivu.wahl.auswertung.erg.sv.ListenkombinationInfo"%>
<%@ page import="de.ivu.wahl.modell.GebietInfo"%>
<%@ page import="de.ivu.wahl.GebietsBaum"%>
<%@ page import="de.ivu.wahl.anwender.Rechte"%>
<%@ taglib uri="http://www.ivu.de/taglibs/ivu-wahl-1.0" prefix="ivu"%>

<jsp:useBean id="appBean" scope="session" class="de.ivu.wahl.client.beans.ApplicationBean" />

<% WahlInfo wahlInfo = appBean.getWahlInfo();
    String id_ergebniseingang = wahlInfo.getWahl().getWurzelgebiet().getID_LetzterEingang();
   String breite = "100%";
   GebietsBaum gebietsBaum = appBean.getGebietsBaum();
   GebietInfo rootInfo = (GebietInfo)gebietsBaum.getWurzel().getUserObject();
   int art = ClientHelper.getLevel(request, rootInfo.getGebietsart());
   int gebNr = ClientHelper.getGebietNr(request, rootInfo.getNummer());  
   String id_gebiet = wahlInfo.getID4Gebiet(art, gebNr);
   
   
   NumberFormat nf = NumberFormat.getNumberInstance(Locale.GERMANY);
   nf.setMaximumFractionDigits(2);
   nf.setMinimumFractionDigits(2);
   AnwContext anwContext = appBean.getAnwContext();
   boolean darfBerechnen = anwContext.checkRight(Rechte.R_SITZVERTEILUNG_BERECHNEN);
  %>

<%@ page import="de.ivu.wahl.auswertung.erg.sv.SitzverteilungListenkombinationErg"%><html>
 <head>
  <title><ivu:int key="Sitzverteilung_titel"/></title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/wahl2002.css">
  <style type="text/css">body { overflow:auto }</style>
 </head>

 <body class="hghell">
    <div class="hgeeeeee" style="height: 14px; width: 100%;" align="right">
        <a name="oben" href="javascript:window.print()" style="text-decoration: none;" id="oben"><span class="linkdklrot"><img src="<%= request.getContextPath() %>/img/icon/drucken.gif" alt="" border="0" height="9" width="24"><ivu:int key="SeiteDrucken"/></span></a><ivu:help key="sitzvertErgLK"/>
    </div>
    <div class="hgschwarz" style="height: 1px; line-height: 1px; width: 100%;">
        &nbsp;
    </div>
    <div class="hggrau" style="height: 20px; width: 100%; text-indent: 5px; line-height: 18px;">
        <ivu:int key="SitzverteilungLK"/>
    </div>
    <div class="hgschwarz" style="height: 1px; line-height: 1px; width: 100%;">
        &nbsp;
    </div>
    <jsp:include page="zwischenstand.jsp"></jsp:include>
    <table width="<%=breite %>" cellspacing="0" cellpadding="0" border="0" class="hghell">
        <tbody>
            <tr>
                <td valign="top">
                    <table width="<%=breite%>" cellspacing="0" cellpadding="1" border="0">
                        <tbody>
                            <tr>
                              <td colspan="3" class="hghell"><img alt="" src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="5"></td>
                           </tr>
                            <tr>
                                <td width="10"><img alt="" src="<%= request.getContextPath() %>/img/icon/blind.gif" height="1" width="1" /></td>
                                <td valign="top">
                                    <table width="<%=breite %>" cellspacing="0" cellpadding="1" border="0">
                                        <tbody>
                                            <tr class="hgrot">
                                                <td valign="top">
                                                    <table class="hgweiss" border="0" cellpadding="0"
                                                        cellspacing="0" width="<%=breite%>">
                                                        <tbody>
                                                            <% if (wahlInfo.getStatus() == WahlModel.STATE_METADATA_P5){ %>  
                                                        <tr class="hgeeeeee">
                                                                    <td height="20" width="5">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <ivu:int key="Sitzverteilung_Nicht_erfolgt"/> <ivu:int key="Sitzverteilung_Kein_Ergebniseingang"/>
                                                                    </td>
                                                                    <td width="5">
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                    <%} else if (wahlInfo.getStatus() == WahlModel.STATE_NEW_RESULT){ %> 
                                                                <tr class="hgeeeeee">
                                                                    <td height="20" width="5">
                                                                        &nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <ivu:int key="Sitzverteilung_Nicht_erfolgt"/> <ivu:int key="Sitzverteilung_Anstossen"/>
                                                                    </td>
                                                                    <td width="5">
                                                                        &nbsp;
                                                                    </td>
                                                                </tr>
                                                                <%if (darfBerechnen){ %>
                                                                    <tr class="hgeeeeee">
                                                                        <td height="20" width="5">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td>
                                                                            <%
                                                                            String url = "/osv?" + ApplicationBeanKonstanten.WORK +"=" + ApplicationBeanKonstanten.AUSW_SITZVERTEILUNG_GEBIET+"&"+ClientHelper.getAllParameters(request, ApplicationBeanKonstanten.WORK);
                                                                            %>
                                                                            <ivu:form action="<%= url %>">
                                                                                <ivu:int key="wechseln_zu_sitzverteilungsansicht"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" id="box2" value="<%= ClientHelper.getBundleString("wechseln_zu_sitzverteilungsansicht_button") %>">
                                                                            </ivu:form>
                                                                        </td>
                                                                        <td width="5">
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                <% } %>
                                                                <%--  <% } else if (wahlInfo.getStatus() == WahlModel.STATE_CALCULATION_CONFLICT){ %> 
                                                                    <tr class="hgeeeeee">
                                                                        <td height="20" width="5">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td>
                                                                            <ivu:int key="Sitzverteilung_Nicht_erfolgt"/> <ivu:int key="Sitzverteilung_Konflikt"/>
                                                                        </td>
                                                                        <td width="5">
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr> --%>
                                                                <% } else if (wahlInfo.getStatus() == WahlModel.STATE_CALCULATION_CONFLICT || wahlInfo.getStatus() == WahlModel.STATE_CALCULATION_SUCCESSFUL) {     
                                                                    int i = 1; %> 
                                                                    <tr class="hgeeeeee">
                                                                      <td height="20" width="5">
                                                                        &nbsp;
                                                                      </td>
                                                                      <td><ivu:int key="SitzverteilungLK_titel"/></td>
                                                                      <td width="5">&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                                <td colspan="3" class="hgrot"><img alt="" src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="1"></td>
                                                                        </tr>
                                                                    <tr>
                                                                      <td colspan="3"><img alt="" src="<%= request.getContextPath() %>/img/icon/blind.gif" height="10" width="1"></td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td width="10"><img alt="" src="<%= request.getContextPath() %>/img/icon/blind.gif" height="1" width="1" /></td>
                                                                      <td valign="top">
                                                                        <table class="hgweiss" border="0" cellpadding="4" cellspacing="2" width="<%= breite %>">
                                                                          <tbody>
                                                                            <tr class="hgformular">
                                                                              <td style="width: 154px;">
                                                                                <ivu:int key="SitzverteilungLK_Listenkombination"/>
                                                                              </td>
                                                                              <td colspan="2" style="width: 497px;">
                                                                                <ivu:int key="SitzverteilungLK_Parteiname"/>
                                                                              </td>
                                                                              <td style="width: 80px; text-align: right;">
                                                                                &sum; <ivu:int key="SitzverteilungLK_Sitze"/>
                                                                              </td>
                                                                              <td style="width: 80px; text-align: right;">
                                                                                <ivu:int key="SitzverteilungLK_Sitze"/>
                                                                              </td>
                                                                              <td style="text-align: right;">
                                                                                <ivu:int key="SitzverteilungLK_Anzahl_Stimmen"/>
                                                                              </td>
                                                                            </tr>
                                                                            <%
                                                                                SitzverteilungListenkombinationErg erg = appBean.getSitzverteilungLKErgebnis(id_ergebniseingang, id_gebiet);
                                                                                Collection<ListenkombinationInfo> listenkombInfoCol = erg.getListenkombinationInfoCol();
                                                                                boolean  first = true;
                                                                                for (ListenkombinationInfo listenkombInfo : listenkombInfoCol){
                                                                                    if (!first){ %>
                                                                                    <tr class="hgweiss">
                                                                                    <td colspan="4" >&nbsp;</td>
                                                                                    </tr>
                                                                                    <% }  %>
                                                                                   <tr class="hgeeeeee" style="font-weight:bold;">
                                                                                    <td colspan="3">
                                                                                        <%= ClientHelper.forHTML(listenkombInfo.getBezeichnung()) %>
                                                                                      </td>
                                                                                      <td style="text-align: right;">
                                                                                                        <%= listenkombInfo.isBeruecksichtigt() ? listenkombInfo.getAnzahlSitze() : ""%>         
                                                                                      </td>
                                                                                      <td style="text-align: right;">
                                                                                                        &nbsp;          
                                                                                      </td>
                                                                                      <td style="text-align: right;">
                                                                                                        <%= listenkombInfo.isBeruecksichtigt() ? ClientHelper.getStimmanzahlString(listenkombInfo.getAnzahlStimmen(), ClientHelper.DF) : ""%>           
                                                                                      </td>
                                                                                    </tr>
                                                                                    <% i = 1;
                                                                                    Set<ListenkombinationInfo> gruppenInfoCol = erg.getGruppeninfoCol(listenkombInfo.getID_Listenkombination());
                                                                                    if (gruppenInfoCol != null){
                                                                                        for (ListenkombinationInfo gruppenInfo : gruppenInfoCol) {
                                                                                            %>
                                                                                            <tr>
                                                                                              <td class="hgweiss" style="width: 154px;">
                                                                                                &nbsp;
                                                                                              </td>
                                                                                              <td class="<%= i > 0 ? "hgweiss":"hgeeeeee" %>" style="width: 50px;">
                                                                                                    <%= gruppenInfo.getPosition() %>
                                                                                              </td>
                                                                                              <td class="<%= i > 0 ? "hgweiss":"hgeeeeee" %>" style="width: 447px;">
                                                                                                    <%= ClientHelper.forHTML(gruppenInfo.getGruppeBezeichnung()) %>
                                                                                              </td>
                                                                                              <td class="<%= i > 0 ? "hgweiss":"hgeeeeee" %>" style="text-align: right;">
                                                                                                    &nbsp;
                                                                                              </td>
                                                                                              <td class="<%= i > 0 ? "hgweiss":"hgeeeeee" %>" style="text-align: right;">
                                                                                                    <%= gruppenInfo.isBeruecksichtigt() ? gruppenInfo.getAnzahlSitze() : "-"%>  
                                                                                              </td>
                                                                                              <td class="<%= i > 0 ? "hgweiss":"hgeeeeee" %>" style="text-align: right;">
                                                                                                                <%= ClientHelper.getStimmanzahlString(gruppenInfo.getAnzahlStimmen() , ClientHelper.DF)%>       
                                                                                              </td>
                                                                                            </tr>
                                                                                            <% i = -i;
                                                                                        }
                                                                                    }
                                                                                    first= false;
                                                                                }
                                                                            %>
                                                                          </tbody>
                                                                        </table>
                                                                      </td>
                                                                      <td width="10">
                                                                        &nbsp;
                                    
                                                                      </td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td colspan="3"><img alt="" src="<%= request.getContextPath() %>/img/icon/blind.gif" height="10" width="1" /></td>
                                                                    </tr>
                                                                <%} %>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td width="10">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td height="10"><img src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="1" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
    </body>
</html>
