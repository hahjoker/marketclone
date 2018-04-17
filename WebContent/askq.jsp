<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/index.css">
        <title>Q/A</title>
    </head>
    <body>
    	<div class="wrapper">
		<div class="container">
		<div>Ask a question!</div>
        <form class="form" method="post" id="qform" action="askqbackend.jsp">
            <input type="text" name="subject" value="" placeholder="Question"/>
            <div></div>
            <input type="hidden" name="uname" value="<%=session.getAttribute("userid")%>" placeholder=""/>
            <div></div>
            <select name="subcat" form="qform">
					    <option value="Android">Android</option>
					    <option value="iOS">iOS</option>
					    <option value="Other">Other</option>
			</select>	
			<button type="submit">Ask</button>
			<div></div>
            
        </form>
        <div>Check past questions based off a subcategory!</div>
        <form class ="form" method="post" id="cform" action="checkq.jsp">
        <select name="subcat" form="cform">
					    <option value="Android">Android</option>
					    <option value="iOS">iOS</option>
					    <option value="Other">Other</option>
			</select>	
        <button type ="submit">Check</button>
        </form>
        </div>
        </div>
    </body>
</html>