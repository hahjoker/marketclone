<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search</title>
</head>
<body>
	<h1>Search Phones:</h1>
		<form action="search_result.jsp" method = "post">
		
			<tr>
				<td>
					Search By OS:
				</td>
				<td>
					<select name="OS">
					    <option value="Android">Android</option>
					    <option value="iOS">iOS</option>
					    <option value="Other">Other</option>
					</select>				
				</td>
			</tr>
			<tr>
			<tr>
				<td>
					Search By Manufacturer:
				</td>
				<td>
					<select name="manufacturer">
					    <option value="0"> </option>
					    <option value="Google">Google</option>
					    <option value="Apple">Apple</option>
					    <option value="Samsung">Samsung</option>
					    <option value="Other">Other</option>
					</select>	
				</td>
			</tr>
			<tr>
				<td> 
					Search By Condition:
				</td>
				<td>
					<select name="condition">
					    <option value="0"> </option>
					    <option value="Brand New">Brand New</option>
					    <option value="Like New">Like New</option>
					    <option value="Used">Used</option>
					</select>	
				</td>
			</tr>
			<tr>
				<td> 
					Sort By:
				</td>
				<td>
					<select name="sortby">
					    <option value="0"> </option>
					    <option value="Lowest Price">Lowest Price</option>
					    <option value="Highest Price">Highest Price</option>
					</select>	
				</td>
			</tr>
		</table>		
		<div style="text-align:center; margin:2%">
			<input type = "submit" value = "Search"/>	
		</div>
		</form>
</body>
</html>