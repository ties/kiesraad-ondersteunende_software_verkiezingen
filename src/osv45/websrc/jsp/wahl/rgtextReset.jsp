<%@ page import="de.ivu.wahl.client.util.ClientHelper" %>
<%@ page import="de.ivu.wahl.client.beans.ApplicationBeanKonstanten" %>
<%@ page import="de.ivu.wahl.client.beans.ReportGeneratorTextCommands" %>
<%@ page import="de.ivu.wahl.util.BundleHelper"%>
<%@ page errorPage="/jsp/MainErrorPage.jsp"%>
<%@ taglib uri="http://www.ivu.de/taglibs/ivu-wahl-1.0" prefix="ivu" %>
<jsp:useBean id="rgtextBean" scope="session" class="de.ivu.wahl.client.beans.ReportGeneratorTextBean" />

<%
String errorMsg = null;
String confirmationMsg = null;
if (rgtextBean._adminMsg != null && !rgtextBean._adminMsg.isEmpty()) {
    errorMsg = rgtextBean._adminMsg;
    rgtextBean._adminMsg = null;
 }
if (rgtextBean._adminConfirmationMsg != null && !rgtextBean._adminConfirmationMsg.isEmpty()) {
    confirmationMsg = rgtextBean._adminConfirmationMsg;
    rgtextBean._adminConfirmationMsg = null;
 }
%>
<html>
 <head>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/wahl2002.css">
   <style type="text/css">
    body { overflow:auto }
    td {line-height: 15px}
   </style>
 </head>
 <body class="hghell"><%
 
  String prefix = ApplicationBeanKonstanten.PREFIX;
  String formurl = ClientHelper.generateURL(request, null, ReportGeneratorTextCommands.RGTEXT_RESET, -1, true);
  
  String titel = BundleHelper.getBundleString("Reset_rgtext");
  String breite = "100%";%>

  <table width="<%= breite %>" border="0" cellspacing="0" cellpadding="0" align="center" class="hghell">
   <tr class="hgeeeeee" align="right">
        <td><ivu:help key="admRgtextReset"/></td>
   </tr>
   <tr class="hgeeeeee">
    <td class="hgschwarz"><img src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="1"></td>
   </tr>
   <tr>
    <td valign="top">
     <table width="<%= breite %>" border="0" cellspacing="0" cellpadding="0" class="hghell">
      <tr>
       <td width="5" class="hggrau">&nbsp;</td>
       <td colspan="2" class="hggrau" height="20"><ivu:int key="Reset_rgtext_titel"/></td>
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
        <ivu:form name="appstate" action="<%= formurl %>" >
         <table border="0" cellspacing="0" cellpadding="1" width="<%= breite %>">
          <tr>
           <td valign="top">
            <fieldset style="border: 1px solid #093C69; padding: 15px">
             <legend><b><%=titel%></b></legend><br /><%
                if (errorMsg != null){%>
                    <p style="color:red;"><b><%= ClientHelper.forHTML(errorMsg) %></b></p><%
                }
                if (confirmationMsg != null){%>
                    <p style="color:green;"><b><%= ClientHelper.forHTML(confirmationMsg) %></b></p><%
                }
             %><table width="<%=breite%>" border="0" cellspacing="0" cellpadding="0">
              <tr>
               <td colspan="3"><img src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="10"></td>
              </tr>
              <tr>
               <td width="10"><img src="<%= request.getContextPath() %>/img/icon/blind.gif" width="1" height="1"></td>
               <td valign="top">
                <p><ivu:int key="Reset_rgtext_description"/></p>
                <div align="center">
                    <br /><br />
                    <input id="box2" type="submit" value="<%=titel%>" name="<%=prefix%>chgAppState">
                </div>
               </td>
               <td width="10">&nbsp;</td>
              </tr>
             </table>
            </fieldset>
           </td>
          </tr>
         </table>
        </ivu:form>
       </td>
       <td width="10">&nbsp;</td>
      </tr>
     </table>
    </td>
   </tr>
  </table>
 </body>
</html>
