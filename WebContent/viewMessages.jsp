<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><h3>Your Listings</h3></title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<h1 style="text-align: center; font-family: sans-serif;">Phones on
		Auction:</h1>
	<table border="2" align="center">
		<tr>
			<td><b>Message</b></td>
			<td><b>Message Sent On</b></td>
			<td><b>Message Sent From</b></td>
		</tr>
		<%
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://ilovedb.ckpzn75wp0we.us-east-1.rds.amazonaws.com/alphanum",
	            "hahjoker", "rootroot");
	    
	   	String username = (String) session.getAttribute("userid");
	    String seq= "SELECT * FROM messages WHERE sentTo = ?";
		PreparedStatement ps = con.prepareStatement(seq);
		ps.setString(1, username);
		ResultSet rs = ps.executeQuery(); 
		while (rs.next()) { %>
		<tr>
			<td>
				<%out.println(rs.getString("message"));%>
			</td>
			<td>
			<%out.print(rs.getString("timestamp"));%>
			</td>
			<td>
				<%out.print(rs.getString("sentFrom")); %>
			</td>
			<td>
				<form action="success.jsp" method="post">
					<id="buttonrow"><input type="submit" value="Back to Account">
			</form>
			</td><%}%>
		</tr>
		</table>
</body>
</html>