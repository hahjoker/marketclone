<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Item</title>
</head>
<body>
	<h1
		style="text-align: center; font-family: Sans-serif; margin-top: 10%;">Tell
		Us About Your Item:</h1>
	<form action="itemCreation.jsp" method="post">
		Phone Name: <input type="text" name="itemname" />
		<div></div>
		Description:
		<textarea rows="5" cols="50" name="desc"></textarea>
		<div></div>
		Condition:
		<td>
		</td><select name="cond" value = "cond">
				<option value="null"></option>
				<option value="Brand New">Brand New</option>
				<option value="Like New">Like New</option>
				<option value="Used">Used</option>
		</select></td>
		<div></div>
		Phone OS:
		</td>
		<td><select name="OS" value = "OS">
				<option value="null"></option>
				<option value="Android">Android</option>
				<option value="iOS">iOS</option>
				<option value="Other">Other</option>
		</select></td>
		<div></div>
		Phone Manufacturer:
		</td>
		<td><select name="manufacturer" value = "manufacturer">
				<option value="null"></option>
				<option value="Apple">Apple</option>
				<option value="Google">Google</option>
				<option value="Samsung">Samsung</option>
				<option value="Other">Other</option>
		</select></td>
		<div></div>
		Phone Color: <input type="text" name="color" />
		<div></div>
		<button type="submit" id="submit-item">Submit</button>
	</form>
</body>
</html>