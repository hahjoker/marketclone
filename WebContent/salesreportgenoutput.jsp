<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SRP Output</title>
</head>
<body>
<table border="2">
   
   <%
   String subcat = request.getParameter("genoutput");
   try
   {
       Class.forName("com.mysql.jdbc.Driver");
       String insert1="";
       Statement stmt=null;
       ResultSet rs=null;
       Connection con = DriverManager.getConnection("jdbc:mysql://ilovedb.ckpzn75wp0we.us-east-1.rds.amazonaws.com/alphanum",
               "hahjoker", "rootroot");
       if(subcat.equals("total"))
       {
    	   %>
    	   <tr>
           <td>Total Money</td>
      		</tr>
      		<%
    	   insert1="select sum(T.max) from (select max(bidAmount) as max from bidsPlaced NATURAL JOIN phones group by itemid) as T";
    	   stmt=con.createStatement();
    	   rs=stmt.executeQuery(insert1);
    	   while(rs.next())
           {
       %>
               <tr><td><%out.print(rs.getString("sum(T.max)"));%></td></tr>

       <%
           }
       }
       if(subcat.equals("peritem"))
       {
    	   %>
    	   <tr>
           <td>Item Name</td>
           <td>Sold for</td>
      		</tr>
      		<%
    	   insert1="select itemname, sum(T.max) from (select itemid, itemname, max(bidAmount) as max from bidsPlaced NATURAL JOIN phones group by itemid) as T group by T.itemid";
    	   stmt=con.createStatement();
    	   rs=stmt.executeQuery(insert1);
    	   while(rs.next())
           {
       %>
       <tr><td><%out.print(rs.getString("itemname"));%></td>
               <td><%out.print(rs.getString("sum(T.max)"));%></td></tr>

       <%
           }
       }
       if(subcat.equals("peros"))
       {
    	   %>
    	   <tr>
           <td>Phone OS</td>
           <td>Total Sales</td>
      		</tr>
      		<%
    	   insert1="select phoneOS, sum(T.max) from (select phoneOS, max(bidAmount) as max from bidsPlaced NATURAL JOIN phones group by itemid) as T group by T.phoneOS";
    	   stmt=con.createStatement();
    	   rs=stmt.executeQuery(insert1);
    	   while(rs.next())
           {
       %>
       <tr><td><%out.print(rs.getString("phoneOS"));%></td>
               <td><%out.print(rs.getString("sum(T.max)"));%></td></tr>

       <%
           }
       }
       if(subcat.equals("manu"))
       {
    	   %>
    	   <tr>
           <td>Manufacturer</td>
           <td>Total Sales</td>
      		</tr>
      		<%
    	   insert1="select manufacturer, sum(T.max) from (select manufacturer, max(bidAmount) as max from bidsPlaced NATURAL JOIN phones group by itemid) as T group by T.manufacturer";
    	   stmt=con.createStatement();
    	   rs=stmt.executeQuery(insert1);
    	   while(rs.next())
           {
       %>
       <tr><td><%out.print(rs.getString("manufacturer"));%></td>
               <td><%out.print(rs.getString("sum(T.max)"));%></td></tr>

       <%
           }
       }
       if(subcat.equals("puser"))
       {
    	   %>
    	   <tr>
           <td>User</td>
           <td>Total Sales</td>
      		</tr>
      		<%
    	   insert1="select user, sum(T.max) from (select user, max(bidAmount) as max from bidsPlaced NATURAL JOIN phones group by itemid) as T group by T.user";
    	   stmt=con.createStatement();
    	   rs=stmt.executeQuery(insert1);
    	   while(rs.next())
           {
       %>
       <tr><td><%out.print(rs.getString("user"));%></td>
               <td><%out.print(rs.getString("sum(T.max)"));%></td></tr>

       <%
           }
       }
       if(subcat.equals("bsi"))
       {
    	   %>
    	   <tr>
           <td>Item</td>
           <td>Sold At</td>
      		</tr>
      		<%
    	   insert1="select itemname, sum(T.max) from (select itemid, itemname, max(bidAmount) as max from bidsPlaced NATURAL JOIN phones group by itemid) as T group by T.itemid ORDER BY sum(T.max) DESC LIMIT 1";
    	   stmt=con.createStatement();
    	   rs=stmt.executeQuery(insert1);
    	   while(rs.next())
           {
       %>
       <tr><td><%out.print(rs.getString("itemname"));%></td>
               <td><%out.print(rs.getString("sum(T.max)"));%></td></tr>

       <%
           }
       }
       if(subcat.equals("bsu"))
       {
    	   %>
    	   <tr>
           <td>User</td>
           <td>Total Sales</td>
      		</tr>
      		<%
    	   insert1="select user, sum(T.max) from (select user, max(bidAmount) as max from bidsPlaced NATURAL JOIN phones group by itemid) as T group by T.user ORDER BY sum(T.max) DESC LIMIT 1";
    	   stmt=con.createStatement();
    	   rs=stmt.executeQuery(insert1);
    	   while(rs.next())
           {
       %>
       <tr><td><%out.print(rs.getString("user"));%></td>
               <td><%out.print(rs.getString("sum(T.max)"));%></td></tr>

       <%
           }
       }
    	   
       
   %>
   
   </table>
   <%
        rs.close();
        con.close();
   }
   catch(Exception e)
   {
        e.printStackTrace();
   }
   %>
</body>
</html>