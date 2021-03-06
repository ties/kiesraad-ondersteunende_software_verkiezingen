<%--
Weitgehend identische JSP-Seiten:
- adm_n10_1_export.jsp
- P4_Export_CSV.jsp
- P4_Export_N11.jsp
--%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.util.List"%>
<%@ page import="de.ivu.wahl.Basiseinstellung"%>
<%@ page import="de.ivu.wahl.Basiseinstellung.Typ"%>
<%@ page import="de.ivu.wahl.Konstanten"%>
<%@ page import="de.ivu.wahl.SystemInfo"%>
<%@ page import="de.ivu.wahl.WahlInfo"%>
<%@ page import="de.ivu.wahl.admin.DialogStateHolder"%>
<%@ page import="de.ivu.wahl.admin.P4ExportStateCSV"%>
<%@ page import="de.ivu.wahl.anwender.Recht" %>
<%@ page import="de.ivu.wahl.client.beans.Action" %>
<%@ page import="de.ivu.wahl.client.beans.JspPage" %>
<%@ page import="de.ivu.wahl.client.beans.AdministrationBean"%>
<%@ page import="de.ivu.wahl.client.beans.ApplicationBeanKonstanten" %>
<%@ page import="de.ivu.wahl.client.beans.Command" %>
<%@ page import="de.ivu.wahl.client.beans.RepositoryPropertyHandler"%>
<%@ page import="de.ivu.wahl.client.util.ClientHelper"%>
<%@ page import="de.ivu.wahl.client.util.GUICommand"%>
<%@ page import="de.ivu.wahl.modell.GruppeModel"%>
<%@ page import="de.ivu.wahl.util.BundleHelper"%>
<%@ page errorPage="/jsp/MainErrorPage.jsp"%>
<%@ taglib uri="http://www.ivu.de/taglibs/ivu-wahl-1.0" prefix="ivu" %>
<jsp:useBean id="expP4Bean" scope="session" class="de.ivu.wahl.client.beans.ExportP4Bean" />
<jsp:useBean id="appBean" scope="session" class="de.ivu.wahl.client.beans.ApplicationBean" />
<%@include file="/jsp/fragments/common_headers_no_cache.jspf"%>
<%
String backgroundColor = appBean.getBackgroundColor(); // used in included jspf
String helpKey = "ExpCSV"; //$NON-NLS-1$

String breite = "100%"; //$NON-NLS-1$
String rechteFehler = appBean.getErrorIfRightsAreMissing(JspPage.P4_EXPORT_CSV); 
DialogStateHolder p4ES = expP4Bean.getP4ExportStateCSV();
SystemInfo systemInfo = SystemInfo.getSystemInfo();
WahlInfo wahlInfo = WahlInfo.getWahlInfo();

String i18nName = "Export_P4_CSV"; //$NON-NLS-1$
String i18nTitle = "Export_P4_titel_CSV"; //$NON-NLS-1$
String i18nText = "Export_P4_text_CSV"; //$NON-NLS-1$

%>
<html>
<head>
   <title><ivu:int key="<%=i18nName%>"/></title>
   <link rel="stylesheet" href="<%= request.getContextPath() %>/css/wahl2002.css">
   <script>
     var contextPath = "<%=request.getContextPath()%>";
   </script>
   <script language="javascript" type="text/javascript" src="<%= request.getContextPath() %>/js/osv.js"></script>
</head>
<body class="hghell">
    <div id="content">
        <div id="statusbalken" style="display:none;" class="status">
            <div style="margin: 13px; padding: 13px 0px 0px 0px; width: 360px; border: 1px solid;">
                <div style="padding: 0px 13px 4px 13px;"></div>
                <table align="center" style="background-color: rgb(9, 60, 105);">
                    <tr>
                    <td style="color: white">
                            <ivu:int key="ExportInWenigenSekunden"/>
                    </td>
                   </tr>
                    <tr>
                    <td style="height: 30px;">
                            <img src="<%= request.getContextPath() %>/img/leer.gif" name="p0" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p1" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p2" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p3" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p4" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p5" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p6" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p7" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p8" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p9" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p10" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p11" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p12" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p13" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p14" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p15" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p16" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p17" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p18" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p19" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p20" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p21" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p22" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p23" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p24" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p25" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p26" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p27" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p28" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p29" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p30" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p31" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p32" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p33" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p34" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p35" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p36" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p37" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p38" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p39" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p40" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p41" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p42" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p43" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p44" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p45" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p46" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p47" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p48" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p49" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p50" height="12" width="5"/><img src="<%= request.getContextPath() %>/img/leer.gif" name="p51" height="12" width="5"/>
                      </td>
                   </tr>
                </table>
                <div style="padding: 0px 13px 4px 13px;">
                    &nbsp;
                </div>
            </div>
        </div>
        <div id="trans">
            <table width="<%= breite %>" border="0" cellspacing="0" cellpadding="0" align="center" class="hghell">
               <%@include file="/jsp/fragments/help_row.jspf"%>
               <tr>
                  <td valign="top">
                     <% if (!rechteFehler.isEmpty())  { %>
                       <p><b><%= ClientHelper.forHTML(rechteFehler) %></b></p>
                     <% } else { %>
                     <table width="<%= breite %>" border="0" cellspacing="0" cellpadding="0" class="hghell">
                        <tr>
                           <td width="5" class="hggrau">&nbsp;</td>
                           <td colspan="2" class="hggrau" height="20"><ivu:int key="<%=i18nTitle%>"/></td>
                        </tr>
                        <tr>
                           <td colspan="3" class="hgschwarz"><img src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="1"></td>
                        </tr>
                         <tr>
                           <td colspan="3"><img src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="10"></td>
                        </tr>
                            <tr>
                           <td width="10"><img src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="1"></td>
                           <td valign="top">
                             <table border="0" cellspacing="0" cellpadding="1" width="<%= breite %>">
                               <tr>
                                  <td valign="top">
                                     <%String exportVerz = expP4Bean.getProperty(Konstanten.PROP_EXPORT_FORMULAR_DIR); 
                                     if (exportVerz == null || exportVerz.isEmpty()){ %>
                                            <fieldset style="border: 1px solid #093C69; padding: 15px">
                                                <legend><b><ivu:int key="Export_Verzeichnis_titel"/></b></legend><br />
                                              <ivu:int key="KeinZielverzeichnisAngegeben"></ivu:int>
                                            </fieldset>
                                        <% } else if (!systemInfo.isInputmodusComplete()){ %>
                                                <table width="100%" cellspacing="0" cellpadding="1" border="0">
                                                        <tbody>
                                                            <tr class="hgrot">
                                                                <td valign="top">
                                                            <table class="hgweiss" border="0" cellpadding="0" cellspacing="0" width=100%">
                                                                <tbody>
                                                                    <tr class="hgeeeeee">
                                                                                <td height="20" width="5">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <br/>
                                                                                    <b><ivu:int key="Export_Nicht_Moeglich"/></b>
                                                                                    <br/><br/>
                                                                                    <ivu:int key="Export_Im_Modus_Parteiniveau_Nicht_Moeglich"/>
                                                                                    <br/><br/>
                                                                                </td>
                                                                                <td width="5">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>  
                                        <% } else if (!wahlInfo.isWahlVollstaendig()){ %>
                                        <table width="100%" cellspacing="0" cellpadding="1" border="0">
                                                        <tbody>
                                                            <tr class="hgrot">
                                                                <td valign="top">
                                                            <table class="hgweiss" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tbody>
                                                                    <tr class="hgeeeeee">
                                                                                <td height="20" width="5">
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <br/>
                                                                                    <b><ivu:int key="Export_Nicht_Moeglich"/></b>
                                                                                    <br/><br/>
                                                                                    <ivu:int key="Noch_Nicht_Alle_Ergebniseingaenge"/>
                                                                                    <br/><br/>
                                                                                </td>
                                                                                <td width="5">
                                                                                    &nbsp;
                                                                                </td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                          <% } else {
                                                if (P4ExportStateCSV.STATUS_P4_D1 == p4ES._modus){ 
                                                    String urlExp = "/osv?cmd=" + Action.EXP_P4_EXPORT_P4_VOTES_CSV.getKey() + "&" + ClientHelper.getAllParameters(request); //$NON-NLS-1$ //$NON-NLS-2$
                                                   %>
                                              <table border="0" cellspacing="0" cellpadding="1" width="<%= breite %>">
                                                 <tr>
                                                    <td valign="top">
                                                      <fieldset style="border: 1px solid #093C69; padding: 15px">
                                                        <legend><b><ivu:int key="<%=i18nName%>"/></b></legend>
                                                            <% if (expP4Bean._adminMsgExport != null && !expP4Bean._adminMsgExport.isEmpty() ){%>
                                                                        <p style="color:red;"><b><%=ClientHelper.forHTML(expP4Bean._adminMsgExport)%></b></p>
                                                                        <% 
                                                                        expP4Bean._adminMsgExport = null;
                                                            }
                                                            if (expP4Bean._adminMsgExportConfirmation != null && !expP4Bean._adminMsgExportConfirmation.isEmpty() ){%>
                                                                        <p style="color:green;"><b><%=ClientHelper.forHTML(expP4Bean._adminMsgExportConfirmation)%></b></p>
                                                                        <% 
                                                                        expP4Bean._adminMsgExportConfirmation = null;
                                                            } %>
                                                            <br/>
                                                           <ivu:form action="<%=urlExp%>" onsubmit="transp();">
                                                            <ivu:int key="<%=i18nText%>"/>
                                                             <div style="margin-left: 1em; margin-top: 1em; margin-bottom: 1em;">
                                                                    <% if (expP4Bean._adminWarningOverride != null && !expP4Bean._adminWarningOverride.isEmpty() ){%>
                                                                                <p class="warningMessage"><b><%= ClientHelper.forHTML(expP4Bean._adminWarningOverride) %><br/>
                                                                                <ivu:int key="Datei_Ueberschreiben"/> </b></p>
                                                                                <% expP4Bean._adminWarningOverride = null; %> 
                                                                                <input type="hidden" value="1" name="<%=ApplicationBeanKonstanten.PREFIX%>force"/>
                                                                                <input id="box2" type="submit" value="<%=RepositoryPropertyHandler.RESET %>" name="<%=ApplicationBeanKonstanten.PREFIX%>uebernehmen"/>
                                                                                <input id="box2" type="submit" value="<%=RepositoryPropertyHandler.WEITER %>" name="<%=ApplicationBeanKonstanten.PREFIX%>uebernehmen"/>
                                                                    <% } else { %>
                                                                         <input id="box2" type="submit" value="<%=RepositoryPropertyHandler.WEITER %>" name="<%=ApplicationBeanKonstanten.PREFIX%>uebernehmen"/>
                                                                    <% } %>
                                                                        </div>
                                                                    </ivu:form>
                                                       </fieldset>
                                                    </td>
                                                 </tr>
                                              </table>
                                     <% } else if (P4ExportStateCSV.STATUS_P4_D2 == p4ES._modus){
                                                    // reset export status
                                                    expP4Bean.resetExportStateCSV();
                                                    //forward to Werkmap
                                                    String urlExp = "/osv?cmd=" + Action.EXP_P4_EXPORT_P4_VOTES_CSV.getKey() + "&" + ClientHelper.workIs(Command.EXPORT_VERZEICHNIS) + "&" + ClientHelper.getAllParameters(request, ApplicationBeanKonstanten.WORK); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
                                        %>
                                        <fieldset style="border: 1px solid #093C69; padding: 15px">
                                                        <legend><b><ivu:int key="<%=i18nName%>"/></b></legend>
                                                        <p><ivu:int key="Export_erfolgreich"/></p>
                                                        <%
                                                          if (expP4Bean._adminMsgExport != null && !expP4Bean._adminMsgExport.isEmpty() ){
                                                        %>
                                                            <p style="color:red;"><b><%=ClientHelper.forHTML(expP4Bean._adminMsgExport)%></b></p>
                                                            <% expP4Bean._adminMsgExport = null;
                                                          
                                                          }
                                                          if (expP4Bean._adminMsgExportConfirmation != null && !expP4Bean._adminMsgExportConfirmation.isEmpty() ){
                                                        %>
                                                            <p style="color:green;"><b><%=ClientHelper.forHTML(expP4Bean._adminMsgExportConfirmation)%></b></p>
                                                            <% expP4Bean._adminMsgExportConfirmation = null;
                                                          
                                                          }
                                                        %>
                                                        <ivu:form action="<%=urlExp%>" onsubmit="transp();">
                                                     <div style="margin-left: 1em; margin-top: 1em; margin-bottom: 1em;">
                                                         <input id="box2" type="submit" value="<%=AdministrationBean.NEU%>" name="<%=ApplicationBeanKonstanten.PREFIX%>uebernehmen"/>
                                                       </div>
                                                        </ivu:form>
                                                    </fieldset>
                                         <% }
                                            }%>
                                  </td>
                               </tr>
                            </table>
                           </td>
                           <td width="10">&nbsp;</td>
                        </tr>
                     </table>
                     <% } %>
                  </td>
               </tr>
            </table>
        </div>
    </div>
</body>
</html>