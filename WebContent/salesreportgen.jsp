<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Let's so some sales</title>
</head>
<body>
<form action="salesreportgenoutput.jsp" method = "post">
		
			<tr>
				<td>
					Create Report By:
				</td>
				<td>
					<select name="genoutput">
					    <option value="0"> </option>
					    <option value="total">Total Earnings</option>
					    <option value="peritem">Per Item</option>
					    <option value="peros">Per Operating System</option>
					    <option value="manu">Per Manufacturer</option>
					    <option value="puser">Per User</option>
					    <option value="bsi">Best Selling Item</option>
					    <option value="bsu">Best Selling User</option>
					</select>				
				</td>
			</tr>
	 <button type ="submit">Check</button>
	 </form>
</body>
</html>