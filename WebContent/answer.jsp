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
	   String subcat = request.getParameter("threadId");
		int i= Integer.parseInt(subcat); %>
	           <form action="answerbackend.jsp" method = "post">
	 		  		<input type="text" name="message" value="" placeholder="Message"/>
		            <button type="submit">Reply</button>
        			<input type="hidden" name="threadId" value="<%=i%>"/>
        			<input type="hidden" name="uname" value="<%=session.getAttribute("userid")%>"/>
	            
	            </form>
</body>
</html>