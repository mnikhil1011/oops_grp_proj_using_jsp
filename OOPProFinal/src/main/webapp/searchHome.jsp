<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="header.jsp" %>

<html>
<head>
<style>
.table-custom { margin: 0px auto; }
body{
	background:#439A97;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: black; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<table class="table-custom">
        <thead>
          <tr>
            <th scope="col">Item Name</th>
            <th scope="col">Item code</th>
         <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Discount</th>
            <th scope="col">Add to cart <i class='fas fa-cart-plus'></i></th>
          </tr>
        </thead>
        <tbody>
<%
int z=0;
try{
	String search=request.getParameter("search");

	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from product where itemname like '%"+search+"%' and qtyavailable > 0 ");
	while(rs.next())
	{
		z=1;
	
	
%>
    
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><i class="fa fa-inr"></i> </i><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %></td>
           
            <td><a href="addToCartAction.jsp?id=<%=rs.getString(2) %>">Add to cart <i class='fas fa-cart-plus'></i></a></td>
          </tr>
         <% }
}
catch(Exception e)	{
	System.out.println(e);
}
	%>
        </tbody>
      </table>
      	<%if(z==0)
      		{%>
      		<h1 style=" text-align: center;">Nothing to show</h1>
      		<% }%>
	
	
      <br>
      <br>
      <br>
    

</body>
</html>