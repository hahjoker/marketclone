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
	String fname = request.getParameter("firstname");
	String lname = request.getParameter("lastname");    
	String email = request.getParameter("email");
	String user = request.getParameter("username");
	String pass = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ilovedb.ckpzn75wp0we.us-east-1.rds.amazonaws.com/alphanum",
            "hahjoker", "rootroot");
  	String insert1= "INSERT INTO credentials VALUES(?,?,?,?,?,?,?)";
  	PreparedStatement ps = con.prepareStatement(insert1);
  	ps.setString(1, fname);
  	ps.setString(2, lname);
  	ps.setString(3, email);
  	ps.setString(4, user);
  	ps.setString(5, pass);
  	ps.setInt(6,1);
  	ps.setInt(7,1);
  	ps.executeUpdate();
  	con.close();
  	out.print("man can dream???");
  	response.sendRedirect("index.jsp");
%>
</body>
</html>