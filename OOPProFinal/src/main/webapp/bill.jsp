<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<link rel="stylesheet" href="css/bill.css">
<title>Bill</title>
</head>
<body>
<%
String userid=session.getAttribute("userid").toString();
try{
	int total=0;
int sno=0;
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select sum(total) from cart where userid='"+userid+"' and status='bill'");
	while(rs.next())
	{
		total=rs.getInt(1);
	}
	ResultSet rs2=st.executeQuery("select * from users inner join cart where users.userid='"+userid+"' and cart.status='bill'");
			while(rs2.next())
			{
	
%>
<h3>Cannought Place!</h3>
<hr>
<div class="left-div"><h3>Name:<%=rs2.getString(1) %>  </h3></div>
<div class="right-div-right"><h3>Email:<%=rs2.getString(4) %>  </h3></div>
<div class="right-div"><h3>Mobile Number: <%=rs2.getString(6) %> </h3></div>  

<div class="left-div"><h3>Expected Delivery: <%=rs2.getString(20) %>  </h3></div>


<div class="right-div-right"><h3>Your payment was successful!</h3></div> 


<hr>
<%break;} %>

	
	<br>
	
<table id="customers">
<h3>Product Details</h3>
  <tr>
    <th>S.No</th>
    <th>Product Name</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
  <%
  ResultSet rs1=st.executeQuery("select * from cart inner join product where cart.itemid=product.itemcode and cart.userid='"+userid+"' and cart.status='bill'");
  while(rs1.next()){
	  sno=sno+1;
  
  %>
  <tr>
    <td><%out.println(sno); %></td>
    <td><%=rs1.getString(12) %></td>
    <td><%=rs1.getString(14) %></td>
    <td><%=rs1.getString(3) %></td>
     <td><%=rs1.getString(5) %></td>
  </tr>
  <tr>
<%} %>
</table>
<h3>Total:<%out.println(total); %> </h3>
<a href="continueShopping.jsp"><button class="button left-button">Continue Shopping</button></a>
<a onclick="window.print();"><button class="button right-button">Print</button></a>
<br><br><br><br>
<%
}
catch(Exception e)
{}
%>
</body>
</html>