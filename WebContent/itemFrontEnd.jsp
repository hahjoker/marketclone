<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Item</title>
</head>
<body>
<h1 style="text-align:center; font-family:Sans-serif; margin-top:10%;">Tell Us About Your Item:</h1>
		<form action="itemCreation.jsp" method = "post">
					Phone Name:
					<input type="text" name="itemname" />
					Description:
					<textarea rows="5" cols="50" name="desc"></textarea>
					Condition:
					<h4>Brand New</h4><input type="radio" name="cond" value="Brand New"/>
					<h4>Like New</h4><input type="radio" name="cond" value="Like New"/>
					<h4>Used</h4><input type="radio" name="cond" value="Used"/>
					Type of Phone:
					<h5>iPhone</h5><input type="radio" name="type" value="iPhone" />
					<h5>Android</h5><input type="radio" name="type" value="Android" />
					<h5>Other</h5><input type="radio" name="type" value="Other" />
					Phone Manufacturer:
					<input type="text" name="manufacturer" />
					Phone Color:
					<input type="text" name="color" />
					<button type="submit" id="submit-item">Submit</button>
	</form>
</body>
</html>