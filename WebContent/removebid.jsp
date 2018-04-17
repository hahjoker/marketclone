<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*"%>

<%Object bidid = request.getParameter("bidId");
 	Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ilovedb.ckpzn75wp0we.us-east-1.rds.amazonaws.com/alphanum",
            "hahjoker", "rootroot");
    String seq= "DELETE FROM bidsPlaced WHERE bidDate = ?";
	PreparedStatement ps = con.prepareStatement(seq);
  	ps.setObject(1, bidid);
  	ps.executeUpdate();
	response.sendRedirect("allAccounts.jsp");
  	%>
	
</body>
</html>