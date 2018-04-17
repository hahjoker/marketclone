<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><h3>Bid History</h3></title>
</head>
<body>
	<%@ page import="java.sql.*"%>
	<h1 style="text-align: center; font-family: sans-serif;">Phones on
		Auction:</h1>
	<table border="2" align="center">
		<tr>
			<td><b>For Sale By</b></td>
			<td><b>Item Name</b></td>
			<td><b>ConditionPhone</b></td>
			<td><b>Manufacturer</b></td>
			<td><b>Description</b></td>
			<td><b>PhoneOS</b></td>
			<td><b>Color</b></td>
			<td><b>Buy It Now For</b></td>
			<td><b>Ending Date</b></td>
		</tr>
		<%
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://ilovedb.ckpzn75wp0we.us-east-1.rds.amazonaws.com/alphanum",
	            "hahjoker", "rootroot");
	    
	   	String itemid = request.getParameter("itemid");
	   	String itemname = request.getParameter("itemname");

	    String seq= "SELECT * FROM phones NATURAL JOIN ItemsForSale WHERE itemid = ?";
		PreparedStatement ps = con.prepareStatement(seq);
		ps.setInt(1, Integer.parseInt(itemid));
		ResultSet rs = ps.executeQuery(); 
		while (rs.next()) { %>
		<tr>
			<td>
				<%out.println(rs.getString("user"));%>
			</td>
			<td>
				<%out.print(rs.getString("itemname"));%>
			</td>
			<td>
				<%out.print(rs.getString("conditionPhone")); %>
			</td>
			<td>
				<%out.println(rs.getString("manufacturer"));%>
			</td>
			<td>
				<%out.println(rs.getString("description"));%>
			</td>
			<td>
				<%out.println(rs.getString("phoneOS"));%>
			</td>
			<td>
				<%out.println(rs.getString("color"));%>
			</td>
			<td>
				<%out.println(rs.getDouble("buyNow"));%>
			</td>
			<td>
				<%out.println(rs.getTimestamp("endingDate"));
				}%>
			</td>

		</tr>
		</table>
		<% String seq2= "SELECT bidPerson, bidDate, bidAmount FROM bidsPlaced WHERE itemid = ?";
		PreparedStatement ps2 = con.prepareStatement(seq2);
		ps2.setInt(1, Integer.parseInt(itemid));
		ResultSet rs2 = ps2.executeQuery(); 
		if(!rs2.next()){%>
		<td>
			<h3>No Bids Yet!</h3>
		</td>
		<%} else {
		while (rs2.next()) { %>
		<table>
		<tr>
			Bid History:
		<tr>
		<tr>
				<form action="bidPersonHistory.jsp" method = "post">
	 		  		<%String usernameHistory = rs2.getString("bidPerson");%>
	 		  		<td><%out.println(usernameHistory);%></td>
		            <td id="buttonrow">
           				 <input type="submit" value="See Bid History">
        			</td>
        			<input type="hidden" name="usernameHistory" value="<%=usernameHistory%>">
	            </form>
			<td>
				<%out.print(rs2.getTimestamp("bidDate"));%>
			</td>
			<td>
				<%out.print(rs2.getDouble("bidAmount"));%>;
			</td>
			</tr>
			</table>
			<%}
			}%>
			<form action="BidCreate.jsp" method="post">

				<tr>
					<td id="buttonrow"><input type="submit" value="Place Bid">
					</td>
				</tr>
				<input type="hidden" name="itemid" value="<%=itemid%>">
				<input type="hidden" name="itemname" value="<%=itemname%>">
			</form>
		
</body>
</html>