<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="managerHeader.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<div style="color: black; text-align: center; font-size: 30px;">All Products & Edit Products <i class='fab fa-elementor'></i></div>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
	%><h3 class="alert">Product Successfully Updated!</h3><%
}
%>
<%

if("wrong".equals(msg))
{
	%><h3 class="alert"><h3 class="alert">Some thing went wrong! Try again!</h3><%
}
%>
<%
if("deleted".equals(msg))
{
	%><h3 class="alert"><h3 class="alert">Successfully deleted!</h3><%
}
%>

<table class="table-custom">
        <thead>
          <tr>
            <th scope="col">Item name</th>
            <th scope="col">Item Code</th>
            <th scope="col"><i class="fa fa-inr"></i>Price</th>
            <th scope="col">Discount</th>
            <th scope="col">Quantity Available</th>
            
            <th scope="col">Edit <i class='fas fa-pen-fancy'></i></th>
            <th scope="col">Delete <i class='fas fa-pen-fancy'></i></th>
          </tr>
        </thead>
        <tbody>
        <%
        String userid=session.getAttribute("userid").toString();
        try{
        	Connection con=ConnectionProvider.getCon();
        	Statement st=con.createStatement();
        	ResultSet rs=st.executeQuery("select * from managerproduct where userid='"+userid+"'");
        	while(rs.next())
        		
        	{
        
        %>
       
          <tr>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(4) %></td>
            <td><%=rs.getString(5) %></td>
             <td><%=rs.getString(6) %></td>
            
            <td><a href="editProduct.jsp?itemcode=<%=rs.getString(3) %>">Edit <i class='fas fa-pen-fancy'></i></a></td>
          <td><a href="deleteProduct.jsp?itemcode=<%=rs.getString(3) %>">Delete <i class='fas fa-pen-fancy'></i></a></td>
          </tr>
         <%
        	}
         }
         catch(Exception e)
         {
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