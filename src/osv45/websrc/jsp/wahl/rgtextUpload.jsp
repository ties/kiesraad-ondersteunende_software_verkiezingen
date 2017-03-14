<%@ page import="de.ivu.wahl.Konstanten"%>
<%@ page import="de.ivu.wahl.client.util.ClientHelper"%>
<%@ page import="de.ivu.wahl.client.beans.ApplicationBeanKonstanten" %>
<%@ page import="de.ivu.wahl.client.beans.ReportGeneratorTextCommands" %>
<%@ page import="de.ivu.wahl.util.BundleHelper"%>
<%@ page errorPage="/jsp/MainErrorPage.jsp"%>
<%@ taglib uri="http://www.ivu.de/taglibs/ivu-wahl-1.0" prefix="ivu" %>
<jsp:useBean id="rgtextBean" scope="session" class="de.ivu.wahl.client.beans.ReportGeneratorTextBean" />
<jsp:useBean id="appBean" scope="session" class="de.ivu.wahl.client.beans.ApplicationBean" />
<%  
String backgroundColor = appBean.getBackgroundColor(); // used in included jspf
String helpKey = "admRgtextUpload"; //$NON-NLS-1$

String breite = "100%";
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
      td {line-height: 15px}
      </style>
</head>
<body class="hghell">
<table width="<%= breite %>" border="0" cellspacing="0" cellpadding="0" align="center" class="hghell">
   <%@include file="/jsp/fragments/help_row.jspf"%>
   <tr>
      <td valign="top">
         <table width="<%= breite %>" border="0" cellspacing="0" cellpadding="0" class="hghell">
            <tr>
               <td width="5" class="hggrau">&nbsp;</td>
               <td colspan="2" class="hggrau" height="20"><ivu:int key="Upload_rgtext_titel"/></td>
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
                           <fieldset style="border: 1px solid #093C69; padding: 15px">
                           <legend><b><ivu:int key="Upload_rgtext"/></b></legend><br /><% 
                            if (errorMsg != null){%>
                                            <p style="color:red;"><b><%= ClientHelper.forHTML(errorMsg) %></b></p><% 
                                        }
                            if (confirmationMsg != null){%>
                                            <p style="color:green;"><b><%= ClientHelper.forHTML(confirmationMsg) %></b></p><% 
                                        }
                              if (rgtextBean.isDirectoryKnown()){
                                 String url = "/osv?cmd=" + ReportGeneratorTextCommands.RGTEXT_UPLOAD + "&" + ClientHelper.getParametersDoNotStartWith(request, ApplicationBeanKonstanten.PREFIX);
                                 %>
                                 <ivu:form target="_top" action="<%=url%>" enctype="multipart/form-data" method="post">
                                    <table border="0" width="<%= breite %>" cellspacing="0" cellpadding="0">
                                       <tr>
                                          <td>
                                             <ivu:int key="Upload_rgtext_description"/>
                                          </td>
                                       </tr>
                                       <tr>
                                          <td>
                                             &nbsp;
                                          </td>
                                       </tr>
                                      <tr>
                                          <td>
                                             <table border="0">
                                                <tr>
                                                   <td width="30">
                                                      &nbsp;
                                                   </td>
                                                   <td>
                                                      <input type="file" name="filename" size="25" style="font-size:11px" accept="*.zip"/>
                                                   </td>
                                                   <td width="30">
                                                      &nbsp;
                                                   </td>
                                                   <td>
                                                      <input id="box2" style="cursor:pointer" type="submit" name="<%=ApplicationBeanKonstanten.PREFIX + "hochladen"%>" value="<%= BundleHelper.getBundleString("Upload_rgtext") %>" />
                                                   </td>
                                                </tr>
                                             </table>
                                          </td>
                                       </tr>
                                    </table>
                                 </ivu:form>
                              <%
                              } else { //
                              %>
                                 <ivu:int key="KeinZielverzeichnisAngegeben"></ivu:int>
                              <%
                              }
                              %>
                           </fieldset>
                        </td>
                     </tr>
                  </table>
               </td>
               <td width="10">&nbsp;</td>
            </tr>
         </table>
      </td>
   </tr>
</table>
</body>
</html>
