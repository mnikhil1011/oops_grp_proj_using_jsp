<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

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
<div style="color: black; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%
String msg=request.getParameter("msg");
if("notPossible".equals(msg))
{
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<%} %>
<%
if("inc".equals(msg))
{
%>
<h3 class="alert">Quantity  Increased Successfully!</h3>
<%} %>
<%
if("dec".equals(msg))
{
%>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<%} %>

<%
if("removed".equals(msg))
{
%>
<h3 class="alert">Product Successfully Removed!</h3>
<%} %>
<table class="table-custom">
<thead>
<%
int total=0;
int sno=0;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs1=st.executeQuery("select sum(total) from cart where userid='"+userid+"' and address is NULL");
	while(rs1.next())
	{
		total=rs1.getInt(1);
	}

%>
          <tr>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total); %> </th>
           <%if(total>0){ %> <th scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th><%} %>
           
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Item Name</th>
            <th scope="col"><i class="fa fa-inr"></i> Price</th>
            <th scope="col">Discount</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
          </tr>
        </thead>
        <tbody>
      <%
      ResultSet rs=st.executeQuery("select * from product inner join cart on product.itemcode=cart.itemid and cart.userid='"+userid+"' and cart.address is NULL");
     while(rs.next())
     {
    	 
      
      %>
          <tr>
			<%sno=sno+1; %>
           <td><%out.println(sno); %></td>
            <td><%=rs.getString(1)%></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(3)%> </td>
             <td><%=rs.getString(4)%></td>
            <td><a href="incDecQuantityAction.jsp?itemcode=<%=rs.getString(2)%>&quantity=inc"><i class='fas fa-plus-circle'></i></a><%=rs.getString(10)%>  <a href="incDecQuantityAction.jsp?itemcode=<%=rs.getString(2)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(12)%> </td>
            <td><a href="removeFromCart.jsp?itemcode=<%=rs.getString(2)%>">Remove <i class='fas fa-trash-alt'></i></a></td>
          </tr>
<%
}
}

catch(Exception e){}%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>