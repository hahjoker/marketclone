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
	String phoneType = request.getParameter("OS");
	String cond = request.getParameter("cond");
	String manufacturer = request.getParameter("manufacturer");
	String description = request.getParameter("desc");
	String type = request.getParameter("type");
	String color = request.getParameter("color");
	
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ilovedb.ckpzn75wp0we.us-east-1.rds.amazonaws.com/alphanum",
            "hahjoker", "rootroot");
    
  		String insert1 = "INSERT INTO phones(user,itemname,conditionPhone,manufacturer,description,phoneOS,color) VALUES(?,?,?,?,?,?,?)";
  		PreparedStatement ps = con.prepareStatement(insert1);
  	  	ps.setString(1, user);
  	  	ps.setString(2, itemname);
  	  	ps.setString(3, cond);
  	  	ps.setString(4, manufacturer);
  	  	ps.setString(5, description);
	  	ps.setString(6, phoneType);
	  	ps.setString(7, color);
  	  	ps.executeUpdate();
  	  	
  	  	String query = "SELECT itemid FROM phones ORDER BY itemid DESC LIMIT 1";
  	 	PreparedStatement psrs = con.prepareStatement(query);
	    ResultSet rs = psrs.executeQuery();
	    rs.next();
		int itemid = rs.getInt("itemid");
		con.close();
		session.setAttribute("itemid", itemid);
		//session.setAttribute("comingfrom", 0);
%>
		<name="itemid" value="<%= itemid %>">
		<%response.sendRedirect("auctionCreate.jsp"); %>
</body>
</html>