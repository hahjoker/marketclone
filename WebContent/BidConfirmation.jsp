<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bid Confirmation</title>
</head>
<body>
	<%@ page import="java.sql.*"%>
		<%
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://ilovedb.ckpzn75wp0we.us-east-1.rds.amazonaws.com/alphanum",
	            "hahjoker", "rootroot");
	    
	   	String itemid = request.getParameter("itemid");
	   	Double bidAmount = Double.valueOf(request.getParameter("bidAmount"));
	   	String userid = (String) session.getAttribute("userid");
	   	
	   	String sql= "SELECT MAX(bidAmount) FROM bidsPlaced WHERE itemid = ?";
	   	PreparedStatement findMax = con.prepareStatement(sql);
	   	findMax.setInt(1, Integer.parseInt(itemid));
	   	ResultSet max = findMax.executeQuery();
	   	max.next();
	   	if(bidAmount < max.getDouble("MAX(bidAmount)")) {
	   		%>The Bid Amount must be greater than the current bid.
	   		<form action="BidCreate.jsp" method="post">
			<tr>
				<input type="hidden" name="itemid" value="<%=itemid %>">
				<td id="buttonrow"><input type="submit" value="Try Again">
				</td>
			</tr>
		</form>
	   	<%} else {
	    String seq= "SELECT * FROM phones NATURAL JOIN ItemsForSale WHERE itemid = ?";
		PreparedStatement ps = con.prepareStatement(seq);
		ps.setInt(1, Integer.parseInt(itemid));
		ResultSet rs = ps.executeQuery();%>
		<tr>
			<td>
			<h3>Congratulations!</h3> 
				You have successfully placed a bid for <%out.println(bidAmount.toString());%>
			</td>

		</tr>
		<% String seq2 = "INSERT INTO bidsPlaced (itemid, bidPerson, bidDate, bidAmount) VALUES (?,?,NOW(),?)";
		PreparedStatement ps2 = con.prepareStatement(seq2);
		ps2.setInt(1, Integer.parseInt(itemid));
		ps2.setString(2, userid);
		ps2.setDouble(3, bidAmount);
		ps2.executeUpdate(); }%>
</body>
</html>