<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Representative</title>
</head>
<body>
<h1
		style="text-align: center; font-family: Sans-serif; margin-top: 10%;">Customer Representative:</h1>
	<form action="checkq.jsp" method="post">
		<tr>
			<td id="buttonrow"><input type="submit" value="Answer Questions"></td>
		</tr>
	</form>
	<form action="allAccounts.jsp" method="post">
		<tr>
			<td id="buttonrow"><input type="submit" value="Remove a bid"></td>
		</tr>
	</form>
	<form action="allAccounts.jsp" method="post">
		<tr>
			<td id="buttonrow"><input type="submit" value="Modify Account Information"></td>
		</tr>
	</form>
	<form action="success.jsp" method="post">
		<tr>
			<td id="buttonrow"><input type="submit" value="Main Page"></td>
		</tr>
	</form>
</body>
</html>