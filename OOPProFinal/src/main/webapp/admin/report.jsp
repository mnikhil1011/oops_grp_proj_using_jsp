<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: black; text-align: center; font-size: 30px;">Order history <i class='fab fa-elementor'></i></div>
<table class="table-custom">
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col"><i class="fa fa-inr"></i>  Price</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fa fa-inr"></i> Sub Total</th>
            <th scope="col">Order Date</th>
             <th scope="col">Status</th>
            <th scope="col">User id</th>
              
          </tr>
        </thead>
        <tbody>
<%
int sno=0;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from cart inner join product where cart.itemid=product.itemcode and cart.orderdate is not NULL");
    while(rs.next()){
    	sno=sno+1;
%>
	<tr>
            <td><%out.println(sno); %></td>
            <td><%=rs.getString(12) %></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(4) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i> <%=rs.getString(5) %></td>
             <td><%=rs.getString(9) %></td>
              <td><%=rs.getString(11) %></td>
               
               <td><%=rs.getString(1) %></td>
            </tr>
         <%
         }}
        catch(Exception e){System.out.println(e);}
        %>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>