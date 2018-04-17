<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div></div>
<a href='success.jsp'>Home Page</a>
<div></div>
<table border="2">
   <tr>
        <td>user</td>
        <td>message</td>
   </tr>
   <%
   		int i;
   		if (request.getParameter("threadId")!= null)
   		{
		   	String subcat = request.getParameter("threadId");
			i= Integer.parseInt(subcat);
			session.setAttribute("threadId", subcat);
			System.out.println("HELPHELPHELPSET   "+subcat);
   		}
   		else
   		{
   			String subcat=(String) session.getAttribute("threadId");
   			i= Integer.parseInt(subcat);
   			System.out.println("HELPHELPHELPREAD   "+i);
   		}
		Class.forName("com.mysql.jdbc.Driver");
	   Connection con = DriverManager.getConnection("jdbc:mysql://ilovedb.ckpzn75wp0we.us-east-1.rds.amazonaws.com/alphanum",
	           "hahjoker", "rootroot");
	   
	   	String seq = "SELECT *  FROM post WHERE tid = ?";
	   	PreparedStatement ps = con.prepareStatement(seq);
	   	
	   	ps.setInt(1, i);
		    ResultSet rs = ps.executeQuery();
		    boolean isMoreThanOneRow = rs.first() && rs.next();
		    System.out.println(isMoreThanOneRow);
		    if(!rs.next())
		    {
		    	%><tr><td>No answers yet</td><%
		    	if(session.getAttribute("isrep") == (Object)1){%>
		           <form action="answer.jsp" method = "post">
		 		  	
			            <td id="buttonrow">
	           				 <input type="submit" value="reply">
	        			</td>
	        			<input type="hidden" name="threadId" value="<%=i%>">
		            
		            </form><%
		    }
		    }
		    else{
		   while (rs.next()) {
			   
			   %>
			   <tr>
           <td><%out.print(rs.getString("user")); %></td>
           <td><%out.println(rs.getString("message"));%></td>
           <%
	           if(session.getAttribute("isrep") == (Object)1){%>
	           <form action="answer.jsp" method = "post">
	 		  	
		            <td id="buttonrow">
           				 <input type="submit" value="reply">
        			</td>
        			<input type="hidden" name="threadId" value="<%=rs.getInt("tid")%>">
	            
	            </form>
	
	 	     <%	 	}
	           %>
	           </tr>
	   		<% 
		   }}
		   rs.close();
	        con.close();
   %>
</body>
</html>