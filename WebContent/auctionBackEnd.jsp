<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>registration prowess</title>
</head>
<body>
	<%@ page import="java.sql.*" import = "java.util.*"%>
	<%
	
	Integer itemid = (Integer)session.getAttribute("itemid");
	Double reserve = Double.valueOf(request.getParameter("reserve"));
	Double buyNow = Double.valueOf(request.getParameter("buyNow"));
	
	
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ilovedb.ckpzn75wp0we.us-east-1.rds.amazonaws.com/alphanum",
            "hahjoker", "rootroot");

  		String insert1 = "INSERT INTO ItemsForSale(itemid,reserve,buyNow,listingDate,endingDate) VALUES(?,?,?,NOW(), DATE_ADD(NOW(), INTERVAL 1 WEEK))";
  		PreparedStatement ps = con.prepareStatement(insert1);
		
  		ps.setInt(1, itemid);
  		ps.setDouble(2, reserve);
  		ps.setDouble(3, buyNow);
  	  	ps.executeUpdate();
  	  	con.close();
  	  	
  	
  	response.sendRedirect("auctionCreate.jsp");
%>
</body>
</html>