<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Item</title>
</head>

<%
	Date entryDate = new Date();%>

<body>
<h1 style="text-align:center; font-family:Sans-serif; margin-top:10%;">Tell Us About Your Item:</h1>
		<form action="auctionBackEnd.jsp" method = "post">
		
					Reserve Price (The lowest price you are willing to receive for your item):
					<input type="text" name="reserve" value="XXX.XX"/>
					<div></div>
					Buy Now Price (The price at which to automatically sell):
					<input type="text" name="buyNow" value="XXX.XX"/>
					<button type="submit" id="submit-item">Submit</button>
	</form>
</body>
</html>