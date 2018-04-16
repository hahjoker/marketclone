<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/index.css">
        <title>Login Page</title>
    </head>
    <body>
    	<div class="wrapper">
		<div class="container">
        <form class="form" method="post" action="login.jsp">
            <input type="text" name="uname" value="" placeholder="Username"/>
            <div></div>
            <input type="password" name="pass" value="" placeholder="Password"/>
			<div></div>
			<button type="submit" id="login-button">Login</button>
			<div></div>
            If you're not registered with us yet -> <a href="reg.jsp">Register Here</a>
            <div></div>
            To search active listings, click here! -> <a href="search.jsp">Search</a>
        </form>
        </div>
        </div>
    </body>
</html>