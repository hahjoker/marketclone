<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="2">
   <%
   		String message = request.getParameter("message");
	   String subcat = request.getParameter("threadId");
   		String uname = request.getParameter("uname");
   		
		int i= Integer.parseInt(subcat);
		Class.forName("com.mysql.jdbc.Driver");
	   Connection con = DriverManager.getConnection("jdbc:mysql://ilovedb.ckpzn75wp0we.us-east-1.rds.amazonaws.com/alphanum",
	           "hahjoker", "rootroot");
	   
	   String insert1= "INSERT INTO post (message, created, tid, user) VALUES (?, ?, ?, ?)";
	  	PreparedStatement ps = con.prepareStatement(insert1);
	  	ps.setString(1, message);
	  	ps.setInt(3, i);
	  	ps.setTimestamp(2, new java.sql.Timestamp(new java.util.Date().getTime()));
	  	ps.setString(4, uname);
	  	ps.executeUpdate();
	        con.close();
	        response.sendRedirect("checkans.jsp");
   %>
</body>
</html>