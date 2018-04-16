<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Test-Try Page</title>
</head>
<body>
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in.<br/>
<a href="index.jsp">Please Login.</a>
<%
} else {
%>
Welcome 
<%=
session.getAttribute("userid")
%>
<div></div>
<a href='itemFrontEnd.jsp'>Create new Listing</a>
<div></div>
<a href='logout.jsp'>Log out</a>
<%    }
%>
</body>
</html>