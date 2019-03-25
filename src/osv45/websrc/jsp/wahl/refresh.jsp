<%@ page import="de.ivu.wahl.client.beans.ApplicationBeanKonstanten" %><%--
 --%><%@ page import="de.ivu.wahl.client.util.ClientHelper" %><%--
 --%><%@ page import="de.ivu.wahl.util.BundleHelper"%><%--
 --%><%@ taglib uri="http://www.ivu.de/taglibs/ivu-wahl-1.0" prefix="ivu" %><%--
 --%><%@ page errorPage="/jsp/MainErrorPage.jsp"%><%--
 --%><jsp:useBean id="appBean" scope="session" class="de.ivu.wahl.client.beans.ApplicationBean" /><%--
--%>
<%@include file="/jsp/fragments/common_headers_no_cache.jspf"%>
<%
// refresh in seconds
int akt = 30;
response.setDateHeader("Last-Modified", -1);
response.setHeader("Refresh", String.valueOf(akt));
String newLocation = "/osv?" + ClientHelper.getSuffix(request);
%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body></body>
</html>
