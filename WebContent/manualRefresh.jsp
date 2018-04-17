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
	    <%Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://ilovedb.ckpzn75wp0we.us-east-1.rds.amazonaws.com/alphanum",
	            "hahjoker", "rootroot");
	    String seq= "SELECT itemid, bidPerson, MAX(bidAmount) AS maxBid, reserve FROM ItemsForSale NATURAL JOIN bidsPlaced WHERE ItemsForSale.endingDate <= NOW() GROUP BY itemid";
		PreparedStatement ps = con.prepareStatement(seq);
		ResultSet rs = ps.executeQuery();
		int itemid; 
		while (rs.next()) {
			itemid = rs.getInt("itemid");
			Double reserve = rs.getDouble("reserve");
			if(reserve != null && rs.getDouble("maxBid") > reserve) {
				String sendMessage = "INSERT INTO messages(sentTo, message, timestamp, sentFrom) VALUES (?,?,NOW(), ?)";
				PreparedStatement ps2 = con.prepareStatement(sendMessage);
				ps2.setString(1, rs.getString("bidPerson"));
				ps2.setString(2, "Congratulations! You have won the auction for item number " + rs.getInt("itemid"));
				ps2.setString(3, "SYSTEM");
				ps2.executeUpdate();
				String sendOld = "INSERT INTO oldListings(itemid, soldFor, soldTo, timeSold) VALUES (?,?,?,NOW())";
				PreparedStatement ps3 = con.prepareStatement(sendOld);
				ps3.setInt(1, itemid);
				ps3.setDouble(2, rs.getDouble("maxBid"));
				ps3.setString(3, rs.getString("bidPerson"));
				ps3.executeUpdate();
				String deleteListing = "DELETE FROM ItemsForSale WHERE itemid = ?";
				PreparedStatement ps4 = con.prepareStatement(deleteListing);
				ps4.setInt(1, itemid);
				ps4.execute();
				
			} else if(reserve != null && rs.getDouble("maxBid") < reserve) {
				String sendOld = "INSERT INTO oldListings(itemid, soldFor, soldTo, timeSold) VALUES (?,?,?,NOW())";
				PreparedStatement ps3 = con.prepareStatement(sendOld);
				ps3.setInt(1, itemid);
				ps3.setDouble(2, rs.getDouble("maxBid"));
				ps3.setString(3, rs.getString("bidPerson"));
				ps3.executeUpdate();
				String deleteListing = "DELETE FROM ItemsForSale WHERE itemid = ?";
				PreparedStatement ps4 = con.prepareStatement(deleteListing);
				ps4.setInt(1, itemid);
				ps4.execute();
			} else {
				String sendMessage = "INSERT INTO messages(sentTo, message, timestamp, sentFrom) VALUES (?,?,NOW(),?)";
				PreparedStatement ps2 = con.prepareStatement(sendMessage);
				ps2.setString(1, rs.getString("bidPerson"));
				ps2.setString(2, "Congratulations! You have won the auction for item number " + rs.getInt("itemid"));
				ps2.setString(3, "SYSTEM");
				ps2.executeUpdate();
				String sendOld = "INSERT INTO oldListings(itemid, timeSold) VALUES (?, NOW())";
				PreparedStatement ps3 = con.prepareStatement(sendOld);
				ps3.setInt(1, itemid);
				ps3.executeUpdate();
				String deleteListing = "DELETE FROM ItemsForSale WHERE itemid = ?";
				PreparedStatement ps4 = con.prepareStatement(deleteListing);
				ps4.setInt(1, itemid);
				ps4.execute();
			}
		}
		
		String seq2= "SELECT * FROM ItemsForSale WHERE endingDate >= NOW()";
		PreparedStatement ps2 = con.prepareStatement(seq2);
		ResultSet rs2 = ps2.executeQuery();
		while(rs2.next()) {
			itemid = rs2.getInt("itemid");
			String sendMessage = "INSERT INTO messages(sentTo, message, timestamp, sentFrom) VALUES (?,?,NOW(), ?)";
			PreparedStatement ps5 = con.prepareStatement(sendMessage);
			ps5.setString(1, (String) session.getAttribute("userid"));
			ps5.setString(2, "Your item, item #" + itemid + " was not sold");
			ps5.setString(3, "SYSTEM");
			ps5.executeUpdate();
			String sendOld = "INSERT INTO oldListings(itemid, timeSold) VALUES (?, NOW())";
			PreparedStatement ps3 = con.prepareStatement(sendOld);
			ps3.setInt(1, itemid);
			ps3.executeUpdate();
			String deleteListing = "DELETE FROM ItemsForSale WHERE itemid = ?";
			PreparedStatement ps4 = con.prepareStatement(deleteListing);
			ps4.setInt(1, itemid);
			ps4.execute();
		}
	            %>
	        Data refresh successful, click here to return to your account page -> 
	        <tr><a href='success.jsp'>My Account</a></tr>
</body>
</html>