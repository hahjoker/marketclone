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
	         <td><b>Account Username</b></td>
	         <td><b>Actions</b></td>
	    </tr>
	<%

		Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://ilovedb.ckpzn75wp0we.us-east-1.rds.amazonaws.com/alphanum",
	            "hahjoker", "rootroot");
	    
	    	String seq = "SELECT username FROM credentials";
	    	PreparedStatement ps = con.prepareStatement(seq);
	 	    ResultSet rs = ps.executeQuery();
	 	   while (rs.next()) {
	 		  %>
	 		  	
	 		  	<tr>
	 		  	<form action="bidPersonHistory.jsp" method = "post">
	 		  		<%String usernameHistory = rs.getString("username");%>
	 		  		<td><%out.println(usernameHistory);%></td>
		            <td id="buttonrow">
           				 <input type="submit" value="See Bid History">
        			</td>
	            </form>
        		<%if(session.getAttribute("isrep") == (Object)1){%>
				<form action="modifyinfo.jsp" method = "post">
        			<td>
        				 <td id="buttonrow">
           				 <input type="submit" value="Modify">
        			</td>
	            </form>
	            <%} %>
        			<input type="hidden" name="usernameHistory" value="<%=usernameHistory%>">
	            </tr>
	 	      
	 	     <%
	 	} %>
	    </table>
</body>
</html>