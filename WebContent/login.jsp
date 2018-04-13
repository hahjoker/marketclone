<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login process</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://ilovedb.ckpzn75wp0we.us-east-1.rds.amazonaws.com/alphanum",
            "hahjoker", "rootroot");
    ResultSet rs;
    String seq= "SELECT * from ccredentials WHERE username= ? and password =?";
	PreparedStatement ps = con.prepareStatement(seq);
  	ps.setString(1, user);
  	ps.setString(2, pwd);
    rs = ps.executeQuery();
    if (rs.next()) {
        session.setAttribute("userid", user);
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password! <a href='index.jsp'>try again</a>");
    }
%>
</body>
</html>