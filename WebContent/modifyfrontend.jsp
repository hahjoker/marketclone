<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Modify</title>
</head>
<body>
	<h1 style="text-align:center; font-family:sans-serif;">Modify All Fields</h1>
    <%String usernameHistory = request.getParameter("usernameHistory");%>
    <div class="wrapper">
		<div class="container">
        <form class="form" method="post" action="modify.jsp">
			<input type="text" name="firstname" value="" placeholder="First Name"/>
			<div></div>
			<input type="text" name="lastname" value="" placeholder="Last Name"/>
			<div></div>
			<input type="text" name="email" value="" placeholder="name@email.com"/>
			<input type="hidden" name="usernameHistory" value="<%=usernameHistory%>">
			<div></div>
			<button type="submit" id="change-button">Change</button>
			<div></div>
		</form>
		</div>
	</div>
	</body>
</html>