<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>registration prowess</title>
</head>
<body>
<%@ page import ="java.sql.*" import = "java.util.*"%>
<%
	String question = request.getParameter("subject");
	String subcat = request.getParameter("subcat");
	String uname = request.getParameter("uname");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ilovedb.ckpzn75wp0we.us-east-1.rds.amazonaws.com/alphanum",
            "hahjoker", "rootroot");
  	String insert1= "INSERT INTO qquestions (subject, subcat, userid, created) VALUES (?, ?, ?, ?)";
  	PreparedStatement ps = con.prepareStatement(insert1);
  	ps.setString(1, question);
  	ps.setString(2, subcat);
  	ps.setString(3, uname);
  	ps.setTimestamp(4, new java.sql.Timestamp(new java.util.Date().getTime()));
  	ps.executeUpdate();
	response.sendRedirect("askq.jsp");
  	con.close();
%>
</body>
</html>