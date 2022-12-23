<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>
<style>
body{
	background:#439A97;
}
a
{
	text-decoration: none;
}
.sticky {
  position: -webkit-sticky;
  position: sticky;
  top: 0;
}

table {
  border: 1px solid #ccc;
  border-collapse: collapse;
  margin: 0;
  padding: 0;
  width: 100%;
  /*margin-left: 5%;*/
  table-layout: fixed;
}

table caption {
  font-size: 1.5em;
  margin: .5em 0 .75em;
}

table tr {
  background-color: #f8f8f8;
  border: 1px solid #ddd;
  padding: .35em;
}

table th,
table td {
  padding: .625em;
  text-align: center;
}

table th {
  font-size: .85em;
  letter-spacing: .1em;
  text-transform: uppercase;
}

@media screen and (max-width: 600px) {
  table {
    border: 0;
  }

  table caption {
    font-size: 1.3em;
  }
  
  table thead {
    border: none;
    clip: rect(0 0 0 0);
    height: 1px;
    margin: -1px;
    overflow: hidden;
    padding: 0;
    position: absolute;
    width: 1px;
  }
  
  table tr {
    border-bottom: 3px solid #ddd;
    display: block;
    margin-bottom: .625em;
  }
  
  table td {
    border-bottom: 1px solid #ddd;
    display: block;
    font-size: .8em;
    text-align: right;
  }
  
  table td::before {
    /*
    * aria-label has no advantage, it won't be read inside a table
    content: attr(aria-label);
    */
    content: attr(data-label);
    float: left;
    font-weight: bold;
    text-transform: uppercase;
  }
  
  table td:last-child {
    border-bottom: 0;
  }
}

form {
    width: 90%;
    background: #8EC3B0;
    padding: 40px 40px 40px;
    border: 1px solid #ccc;
    margin: 50px auto 0;
    border-radius: 5px;

}</style>
<script>
if(window.history.forward(1)!=null)
	window.history.forward(1);
</script>

</head>
<body>
<%
String userid=session.getAttribute("userid").toString();
int total=0;int wallet=0;
int sno=0;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs1=st.executeQuery("select sum(total) from cart where userid='"+userid+"' and address is NULL");
	
	while(rs1.next())
	{
		total=rs1.getInt(1);
		
	}
	ResultSet rs3=st.executeQuery("select * from users where userid='"+userid+"'");
	while(rs3.next())
	{
		wallet=rs3.getInt(8);
	}
%>

<br>
<table>
<thead>


          <tr>
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total: <i class="fa fa-inr"></i><%out.println(total); %> </th>
            <th scope="col" style="background-color: yellow;">Wallet balance: <i class="fa fa-inr"></i><%out.println(wallet); %> </th>
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
           
            <td><%=rs.getString(10)%> </td>
            <td><i class="fa fa-inr"></i><%=rs.getString(12)%> </td>
            </tr>
         <%}
     ResultSet rs2=st.executeQuery("select * from users where userid='"+userid+"'");
     while(rs2.next())
     {
    	 
     
     %>
        </tbody>
      </table>
      
<hr style="width: 100%">

<form action="addressPaymentForOrderAction.jsp" method="post">
 <div class="form-group">
    <label class="required" for="address">Enter address</label>
    <input class="input-style form-control"  name="address" type="text"  required  placeholder="Enter address">
    </div>

<hr style="width: 100%">
 <div class="form-group">
    <label class="required" for="address">Enter Mobile number</label>
    <input class="input-style form-control"  name="phone" value="<%=rs2.getString(6) %>" type="text"  required  placeholder="Enter Mobile number">
    </div>

<a class="btn btn-outline-info" href="walletAction.jsp">Pay via wallet</a>
<br>
<%
String msg1=request.getParameter("msg");
if("successful".equals(msg1))
{
	%><h3 class="alert">Payment successful!</h3>
	<button  class="button" type="submit">Proceed to generate bill and save <i class='far fa-arrow-alt-circle-right'></i></button>
	<% 
}

%><%
if("notEnoughMoney".equals(msg1))
{
	%><h3 class="alert">You don't have enough money in your wallet! Add money to your wallet first</h3>
	</form>
	
<% 
}
%><%

if("moneyadded".equals(msg1))
{
	%><h3 class="alert">Money has been added successfully!</h3>

<% 
}

%><%
if("invalid".equals(msg1))
{
	%><h3 class="alert">Something went wrong!! Try again</h3>
	
<% 
}
%>

 
</form>
<%
     }
}

catch(Exception e){System.out.println(e);}
%>


      <br>
      <br>
      <br>

</body>
</html>