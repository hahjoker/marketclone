<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modify</title>
</head>
<body>
<%@ page import ="java.sql.*" %>

<% 
		String username = request.getParameter("usernameHistory");
		String fn = request.getParameter("firstname");
		String ln = request.getParameter("lastname");
		String email = request.getParameter("email");
		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://ilovedb.ckpzn75wp0we.us-east-1.rds.amazonaws.com/alphanum",
	            "hahjoker", "rootroot");
	    
	    String seq1 = "UPDATE credentials SET first_name = ?, last_name = ?, email_address = ? WHERE username = ?";
	    PreparedStatement ps1 = con.prepareStatement(seq1);
		ps1.setString(1,fn);
		ps1.setString(2,ln);
		ps1.setString(3,email);
		ps1.setString(4,username);
		ps1.executeUpdate();
	    
	    	
	 	%>
	 	SUCCESS!
	 	<%response.sendRedirect("success.jsp"); %>
	 	
</body>
</html>