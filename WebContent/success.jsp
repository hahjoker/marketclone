<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main Page</title>
</head>
<body>
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in.<br/>
<a href="login.jsp">Please Login.</a>
<%
} else {
%>
Welcome 
<%=
session.getAttribute("userid")
%>
<div></div>
<a href='manualRefresh.jsp'>Refresh Page Data</a>
<div></div>
<a href='yourListings.jsp'>Your Active Listings</a>
<div></div>
<a href='itemFrontEnd.jsp'>Create new Listing</a>
<div>
<a href='search.jsp'>Search active Listings</a></div>
<div>
<a href='askq.jsp'>Have any questions?</a></div>
<div>
<%if(session.getAttribute("isrep") == (Object)1){%>
<a href='customerrep.jsp'>Customer Representative Menu</a></div>
<%} %>
<div></div>
<div></div>
<a href='allAccounts.jsp'>View All User History</a>
<div></div>
<a href='logout.jsp'>Log out</a>
<div></div>
<a href='viewMessages.jsp'>View Your Messages</a>
<div></div>
<%    }
%>
</body>
</html>