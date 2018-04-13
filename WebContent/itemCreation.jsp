<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>registration prowess</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%
	String user = (String) session.getAttribute("userid");
	String itemname = request.getParameter("itemname");
	String condition = request.getParameter("cond");
	String manufacturer = request.getParameter("manufacturer");
	String description = request.getParameter("desc");
	String type = request.getParameter("type");
	String color = request.getParameter("color");
	
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ilovedb.ckpzn75wp0we.us-east-1.rds.amazonaws.com/alphanum",
            "hahjoker", "rootroot");
    
    if(type == "Android") {
  		String insert1 = "INSERT INTO phones_android VALUES(?,?,?,?,?,?)";
  		PreparedStatement ps = con.prepareStatement(insert1);
  	  	ps.setString(1, user);
  	  	ps.setString(2, itemname);
  	  	ps.setString(3, condition);
  	  	ps.setString(4, description);
  	  	ps.setString(5, manufacturer);
	  	ps.setString(6, color);
  	  	ps.executeUpdate();
  	  	con.close();
    }
  	  	
  	if(type == "iPhone") {
  		String insert1 = "INSERT INTO phones_iPhone VALUES(?,?,?,?,?,?)";
  		PreparedStatement ps = con.prepareStatement(insert1);
  	  	ps.setString(1, user);
  	  	ps.setString(2, itemname);
  	  	ps.setString(3, condition);
  	  	ps.setString(4, description);
  	  	ps.setString(5, manufacturer);
	  	ps.setString(6, color);
  	  	ps.executeUpdate();
  	  	con.close();
  	}
  	
  	if(type == "Other") {
  		String insert1 = "INSERT INTO phones_Other VALUES(?,?,?,?,?,?)";
  		PreparedStatement ps = con.prepareStatement(insert1);
  	  	ps.setString(1, user);
  	  	ps.setString(2, itemname);
  	  	ps.setString(3, condition);
  	  	ps.setString(4, description);
  	 	ps.setString(5, manufacturer);
	  	ps.setString(6, color);
  	  	ps.executeUpdate();
  	  	con.close();
  	}
  	
  	response.sendRedirect("auctionCreate.jsp");
%>
</body>
</html>