<%--
 *******************************************************************************
 * befehl
 * JSP-Seite zeigt den Zustand der Applikation und alle Befehle für den angemel-
 * deten Anwender an
 *
 * author:  mur@ivu.de cos@ivu.de  Copyright (c) 2002-7 IVU Traffic Technologies AG
 *******************************************************************************
 --%>
<%@ page import="de.ivu.wahl.client.util.GUICommand"%>
<%@ page import="java.util.List"%>
<%@ page import="java.net.InetAddress"%>
<%@ page import="java.net.UnknownHostException"%>
<%@ page import="de.ivu.wahl.auswertung.erg.Status"%>
<%@ page import="de.ivu.wahl.WahlInfo"%>
<%@ page import="de.ivu.wahl.modell.GebietModel"%>
<%@ page import="de.ivu.wahl.client.util.ClientHelper"%>
<%@ page import="de.ivu.wahl.client.beans.ApplicationBeanKonstanten"%>
<%@ page import="de.ivu.wahl.Konstanten"%>
<%@ page import="de.ivu.wahl.util.BundleHelper"%>

<%@ page errorPage="/jsp/MainErrorPage.jsp"%>
<%@ page import="de.ivu.wahl.SystemInfo"%>
<%@page import="de.ivu.wahl.wus.electioncategory.ElectionCategory"%>
<%@ taglib uri="http://www.ivu.de/taglibs/ivu-wahl-1.0" prefix="ivu" %>
<jsp:useBean id="appBean" scope="session" class="de.ivu.wahl.client.beans.ApplicationBean" />
<jsp:useBean id="admBean" scope="session" class="de.ivu.wahl.client.beans.AdministrationBean" />
<%
   response.setDateHeader("Expires", System.currentTimeMillis() + 60000); //$NON-NLS-1$
   String breite = "100%"; //$NON-NLS-1$
   String aktuellerNodePath = request.getParameter(ApplicationBeanKonstanten.NAVI_ANKER);
   int work  =  ClientHelper.getWork(request, ApplicationBeanKonstanten.WORK_INITIAL);
   int level = ClientHelper.getLevel(request, appBean.getGebietArtAngemAnw());
   int gebietNr  =  ClientHelper.getGebietNr(request, appBean.getGebietNrAngemAnw());
  
   String sichtAuf    = ""; //$NON-NLS-1$
   if (  level != ApplicationBeanKonstanten.LEVEL_ADMIN 
      && level != ApplicationBeanKonstanten.LEVEL_NACHRICHT 
      && gebietNr != -1 ){   
      try {   
         GebietModel geb = appBean.getGebietModel(level, gebietNr);
         sichtAuf = geb.getName() + (geb.getNummer() == 0 ? "" : " ("+geb.getNummer()+")"); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
      } catch (Exception e){
         // nix
      }
   }
   String zeigeView   = appBean.getNameForWork(level, work);
   WahlInfo info = appBean.getWahlInfo();   
  
   String anmeldename = appBean.getAnwContext().getAnmeldename();
   try {
      anmeldename += '@' + InetAddress.getLocalHost().getHostName();
   } catch (UnknownHostException uhe) { 
    // dann kann eben der Host zu dem Anmeldenamen nicht angezeigt werden
   }

   List<GUICommand> b = appBean.getBefehle(level, gebietNr);
   
   // URL for election details command
   GUICommand electiondetailscmd = b.get(b.size() - 1);
   String electiondetailsUrl = null;
   if (ApplicationBeanKonstanten.SONST_ELECTIONDETAILS == electiondetailscmd.getViewNr()) {
     electiondetailsUrl = ClientHelper.rewriteURL(ClientHelper.generateURL(request, electiondetailscmd.getViewNr(), true), request, response);
   }
   
   ElectionCategory electionCategory = null;
   if (appBean.getWahlInfo() != null) {
      electionCategory = appBean.getWahlInfo().getElectionCategory();
   }
   
%>
<html>
 <head>
  <title><ivu:int key="Befehl"/></title>
  <link rel='stylesheet' href='<%= request.getContextPath() %>/css/wahl2002.css'>
 </head>
 <body class='hgeeeeee' background='<%= request.getContextPath() %>/img/icon/hintergrund_oben.gif'>
  <%    if (electiondetailsUrl != null) { %>
            <a id="layer5" href="<%= electiondetailsUrl %>" title="<%= electiondetailscmd.getTooltip() %>" target="_top"><%= ClientHelper.forHTML(appBean.getWahlName()) %></a>
  <%    }
  %>
  <table border='0' cellspacing='0' cellpadding='0' width='<%=breite%>'>
   <tr>
    <td>
     <table border='0' cellpadding='0' cellspacing='0'>
      <tr>
       <td width='1' class='hgrot' rowspan='4'><img src='<%= request.getContextPath() %>/img/icon/blind.gif' width='1' height='1' /></td>
       <td height='9' class='hgrot' colspan='2'><img src='<%= request.getContextPath() %>/img/icon/blind.gif' width='1' height='1' /></td>
       <td width='1' class='hgrot' rowspan='4'><img src='<%= request.getContextPath() %>/img/icon/blind.gif' width='1' height='1' /></td>
      </tr>
      <tr>
       <td height='1' colspan='2' class='hgrot'><img src='<%= request.getContextPath() %>/img/icon/blind.gif' width='1' height='1' /></td>
      </tr>
      <tr>
       <td colspan='2' class='hgoben' height='15'>
        <table cellpadding='0' cellspacing='0' border='0' width='<%=breite%>'>
         <tr>
          <%
          Status status = appBean.getStatus();
          if (status != null) {
           String statusStr = ""; //$NON-NLS-1$
           if (info != null){       
               // add root-region
               statusStr = ClientHelper.forHTML(info.getNameWurzelgebiet());
               // add status; freigegeben impliziert geschlossen!
               if(info.isFreigegeben()) {
                 statusStr = " ("+BundleHelper.getBundleString("Freigegeben")+")"; //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
               }
           }%>
           
          <td class='hgoben'>
           <span class='abstand4'>
            <%=status.getArt()%><%=statusStr%>
           </span>
          </td>
          <td class='hgoben' width="20px;">
           &nbsp;
          </td>
          <%}%>
          <td class='hgoben'>
           <span class='abstand15'>
            <%= ClientHelper.forHTML(anmeldename) %>
           </span>
          </td>
          <td class='hgoben'>
           <span class='abstand15'>
            <%=SystemInfo.getSystemInfo().getEbenenklartextTitel() %> (<%=SystemInfo.getSystemInfo().getModusklartext() %>)
           </span>
          </td>
         </tr>
        </table>
       </td>
      </tr>
      <tr>
       <td height='1' colspan='2' class='hgrot'><img src='<%= request.getContextPath() %>/img/icon/blind.gif' width='1' height='1' /></td>
      </tr>
     </table>
    </td>
   </tr>
   <tr>
          <td height="20" class="schriftrot" valign="top">
            &nbsp;
          </td>
         </tr><tr class="hgeeeeee">
          <td height="20" class="guiBefehle">
           <%
             for (int i = 0; i < b.size(); i++) {
                GUICommand cmd = b.get(i);
                String title = cmd.getTooltip();
                String bez = cmd.getBezeichnung(level);
                int viewNr = cmd.getViewNr();
                String cmdClass = viewNr == work ? "guiBefehl_selected" : cmd.getGUIClass(); //$NON-NLS-1$
                String url = ClientHelper.rewriteURL(ClientHelper.generateURL(request, viewNr, true), request, response);
                String target = "_top"; //$NON-NLS-1$
                switch (viewNr) {
                    case ApplicationBeanKonstanten.HELP :
                       target = "help"; //$NON-NLS-1$
                       url=request.getContextPath()+ "/help/" + SystemInfo.getSystemInfo().getModusklartext() + "/index.html"; //$NON-NLS-1$ //$NON-NLS-2$
                       break;
                    default :
                       // nothing to do
                }
                if (ApplicationBeanKonstanten.SONST_ELECTIONDETAILS != viewNr
                    && !(ApplicationBeanKonstanten.ADM_STIMMBEZIRKE == viewNr && info == null)) { %>
                   <a class='<%=cmdClass%>' href="<%=url%>" title="<%=title%>" target="<%=target%>"> <%=bez%></a>
             <% }
             }
           %>
          </td>
         </tr>
  </table>
 </body>
</html>
