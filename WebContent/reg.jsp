<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <link rel="stylesheet" href="css/index.css">
    </head>
    <body>
    <div class="wrapper">
		<div class="container">
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
			<input type="hidden" name="admin" value="1">
			<button type="submit" id="login-button">Register</button>
			<div></div>
			Already registered? <a href="index.jsp">Login Here</a>
		</form>
		</div>
	</div>	
	</body>
</html>