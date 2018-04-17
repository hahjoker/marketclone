<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>More Customer Reps!</title>
</head>
<body>
		<form class="form" method="post" action="registration.jsp">
			<input type="text" name="firstname" value="" placeholder="First Name"/>
			<div></div>
			<input type="text" name="lastname" value="" placeholder="Last Name"/>
			<div></div>
			<input type="text" name="email" value="" placeholder="name@email.com"/>
			<div></div>
			<input type="text" name="username" value="" placeholder="Username"/>
			<div></div>
			<input type="password" name="password" value="" placeholder="Password"/>
			<div></div>
			<input type="hidden" name="admin" value="0">
			<button type="submit" id="login-button">Register new workers</button>
			<div></div>
		</form>
</body>
</html>