<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Results</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
	<h1 style="text-align:center; font-family:sans-serif;">Phones on Auction:</h1>
	 <table border="2" align = "center">
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
		String OS = request.getParameter("OS");
		String manufacturer = request.getParameter("manufacturer");
		String condition = request.getParameter("condition");
		

		
		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://ilovedb.ckpzn75wp0we.us-east-1.rds.amazonaws.com/alphanum",
	            "hahjoker", "rootroot");
	    
	    	String seq = "";
	    	ResultSet rs;
	    	PreparedStatement ps = null;
	    	if(OS.equals("0") && !manufacturer.equals("0") && !condition.equals("0")) {
	    		seq= "SELECT * FROM phones NATURAL JOIN ItemsForSale WHERE manufacturer = ? and conditionPhone = ?";
	    		ps = con.prepareStatement(seq);
	    		ps.setString(1, manufacturer);
		  	  	ps.setString(2, condition);
	    	} else if(!OS.equals("0") && manufacturer.equals("0") && !condition.equals("0")) {
	    		seq= "SELECT * FROM phones NATURAL JOIN ItemsForSale WHERE conditionPhone = ? and phoneOS = ?";
	    		ps = con.prepareStatement(seq);
	    		ps.setString(1, condition);
		  	  	ps.setString(2, OS);
	    	} else if(!OS.equals("0") && !manufacturer.equals("0") && condition.equals("0")) {
	    		seq= "SELECT * FROM phones NATURAL JOIN ItemsForSale WHERE manufacturer = ? and phoneOS = ?";
	    		ps = con.prepareStatement(seq);
	    		ps.setString(1, manufacturer);
		  	  	ps.setString(2, OS);
	    	} else if(!OS.equals("0") && manufacturer.equals("0") && condition.equals("0")) {
	    		seq= "SELECT * FROM phones NATURAL JOIN ItemsForSale WHERE phoneOS = ?";
	    		ps = con.prepareStatement(seq);
		  	  	ps.setString(1, OS);
	    	} else if(OS.equals("0") && !manufacturer.equals("0") && condition.equals("0")) {
	    		seq= "SELECT * FROM phones NATURAL JOIN ItemsForSale WHERE manufacturer = ?";
	    		ps = con.prepareStatement(seq);
		  	  	ps.setString(1, manufacturer);
	    	} else if(OS.equals("0") && manufacturer.equals("0") && !condition.equals("0")) {
	    		seq= "SELECT * FROM phones NATURAL JOIN ItemsForSale WHERE condition = ?";
	    		ps = con.prepareStatement(seq);
		  	  	ps.setString(1, condition);
	    	} else if(OS.equals("0") && manufacturer.equals("0") && condition.equals("0")) {
	    		seq= "SELECT * FROM phones NATURAL JOIN ItemsForSale";
	    		ps = con.prepareStatement(seq);
	    	} else {
	    		seq= "SELECT * FROM phones NATURAL JOIN ItemsForSale WHERE manufacturer = ? and conditionPhone = ? and phoneOS = ?";
	    		ps = con.prepareStatement(seq);
	    		ps.setString(1, manufacturer);
		  	  	ps.setString(2, condition);
		  	  	ps.setString(3, OS);
	    	}
	 	    rs = ps.executeQuery();
	 	    ResultSetMetaData rsmd = rs.getMetaData();
	 	   int columnsNumber = rsmd.getColumnCount();
	 	   while (rs.next()) {
	 		  %>
	 		  	<form action="BidHistory.jsp" method = "post">
	 		  	
	 		  	<tr>
	 		  		<td><%out.println(rs.getString("user"));%></td>
		 		  	<td><%out.print(rs.getString("itemname"));%></td>
		            <td><%out.print(rs.getString("conditionPhone")); %></td>
		            <td><%out.println(rs.getString("manufacturer"));%></td>
		            <td><%out.println(rs.getString("description"));%></td>
		            <td><%out.println(rs.getString("phoneOS"));%></td>
		            <td><%out.println(rs.getString("color"));%></td>
		            <td><%out.println(rs.getDouble("buyNow"));%></td>
		            <td><%out.println(rs.getTimestamp("endingDate"));%></td>
		            <td id="buttonrow">
           				 <input type="submit" value="Select">
        			</td>
	            </tr>
	            <input type="hidden" name="itemid" value="<%= rs.getInt("itemid") %>"> 
	            </form>
	 	      
	 	     <%
	 	} %>
	    </table>
</body>
</html>