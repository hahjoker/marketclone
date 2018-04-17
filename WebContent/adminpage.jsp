<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Controls</title>
</head>
<body>
<%
    if ((session.getAttribute("isAdmin") != null) || (session.getAttribute("userid") == "")) {
%>
You are not Admin<br/>
<a href="index.jsp">Bye</a>
<%
} else {
%>
Welcome 
<%=
session.getAttribute("userid")
%>
<div></div>
<a href="customerRepAccCreation.jsp">new reps?</a>
<div></div>
<a href="salesreportgen.jsp">sales report?</a>
<div></div>
<a href='logout.jsp'>Log out</a>
<%
}
%>
</body>
</html>