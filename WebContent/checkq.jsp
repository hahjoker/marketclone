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
   <tr>
        <td>subject</td>
        <td>subcat</td>
        <td>userid</td>
   </tr>
   <%
   String subcat = request.getParameter("subcat");
   try
   {
       Class.forName("com.mysql.jdbc.Driver");
       
       Connection con = DriverManager.getConnection("jdbc:mysql://ilovedb.ckpzn75wp0we.us-east-1.rds.amazonaws.com/alphanum",
               "hahjoker", "rootroot");
       String insert1="select * from qquestions where subcat = ?"; 
       PreparedStatement ps = con.prepareStatement(insert1);
	 	ps.setString(1, subcat);
       ResultSet rs=ps.executeQuery();
       while(rs.next())
       {
   %>
           <tr><td><%out.print(rs.getString("subject"));%></td>
           <td><%out.print(rs.getString("subcat")); %></td>
           <td><%out.println(rs.getString("userid"));%></td></tr>

   <%
       }
   %>
   
   </table>
   <%
        rs.close();
        con.close();
   }
   catch(Exception e)
   {
        e.printStackTrace();
   }
   %>
</body>
</html>