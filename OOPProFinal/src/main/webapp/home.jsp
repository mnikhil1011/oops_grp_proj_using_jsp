<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="header.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
.table-custom { margin: 0px auto; }
body{
	background:#439A97;
}
h3
{
	color: yellow;
	text-align: center;
}
</style>

</head>
<body>
<div style="color: black; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<%
String msg=request.getParameter("msg");
if("added".equals(msg))
{
	%><h3 class="alert">Product added successfully!</h3><% 
}
%>
<%

if("exist".equals(msg))
{
	%><h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>
<% 
}
%>

<%

if("invalid".equals(msg))
{
	%><h3 class="alert">Something went wrong!! Try again</h3>
<% 
}
%>

<table class="table-custom">
        <thead>
          <tr>
            <th scope="col">Item name</th>
            <th scope="col">Item code</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Discount</th>
           
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
<%
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from product where qtyavailable > 0");
	while(rs.next())
	{
	
%>
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><i class="fa fa-inr"></i> </i><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %></td>
           
            <td><a href="addToCartAction.jsp?itemcode=<%=rs.getString(2) %>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
          </tr>
<% }
}
catch(Exception e)	{
	System.out.println(e);
}
	%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>