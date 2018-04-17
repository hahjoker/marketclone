<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bid on Item</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%
	System.out.println(session.getAttribute("userid"));
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in.<br/>
<a href="index.jsp">Please Login.</a>
<%} else {%>
	<h1 style="text-align: center; font-family: sans-serif;">Phones on
		Auction:</h1>
	<table border="2" align="center">
		<tr>
			<td><b>Enter Bid</b></td>
			<td><b>Confirm</b></td>
		</tr>
		<%
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://ilovedb.ckpzn75wp0we.us-east-1.rds.amazonaws.com/alphanum",
	            "hahjoker", "rootroot");
	    
	   	String itemid = request.getParameter("itemid");
	   	String itemname = request.getParameter("itemname");%>
		<form action="BidConfirmation.jsp" method="post">
			<tr>
				<td><input type="text" name="bidAmount" value="XXX.XX" /></td>
				<input type="hidden" name="itemid" value="<%=itemid %>">
				<input type="hidden" name="itemname" value="<%=itemname%>">
				<td id="buttonrow"><input type="submit" value="Confirm Bid">
				</td>
			</tr>
		</form>
		<%} %>
</body>
</html>