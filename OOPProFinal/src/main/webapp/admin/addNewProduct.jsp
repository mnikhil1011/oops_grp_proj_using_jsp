<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>

<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
<style>
label{
font-weight: bold;
}
body{
	background:#439A97;
}
form {
    width: 90%;
    background: #62B6B7;
    padding: 40px 40px 40px;
    
    margin: 50px auto 0;
    border-radius: 5px;

}</style>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
	%>
	<h3 class="alert">Product Added Successfully!</h3>
<%	
}
%>
<%

if("wrong".equals(msg))
{
	%>
	<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%	
}
%>



<%
int itemcode=1;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select max(itemcode) from product");
	while(rs.next())
	{
		itemcode=rs.getInt(1);
		itemcode=itemcode+1;
		
	}
}
catch(Exception e)
{
	
}
%>
 <form action="addNewProductAction.jsp" method="post">
 <h3 style="color: black;">Item code: <% out.println(itemcode); %> </h3>
<input type="hidden" name="itemcode" value="<%out.println(itemcode);%>">

<div class="form-group">
                                    <label for="userid">Enter item name</label>
                                    <input required name="itemname" type="text" class="form-control" id="userid" aria-describedby="emailHelp" placeholder="Enter name of the item">
                                  
                                </div>
                                <div class="form-group">
                                    <label for="price">Enter price</label>
                                    <input required name="price" type="text" class="form-control" id="userid" aria-describedby="emailHelp" placeholder="Enter price">
                                  
                                </div>
                                <div class="form-group">
                                    <label for="userid">Enter discount</label>
                                    <input required name="discount" type="text" class="form-control" id="userid" aria-describedby="emailHelp" placeholder="Enter discount">
                                  
                                </div>
                                <div class="form-group">
                                    <label for="userid">Enter quantity available</label>
                                    <input required name="qtyavailable" type="text" class="form-control" id="userid" aria-describedby="emailHelp" placeholder="Enter quantity available">
                                  
                                </div>


 <button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
   </form>
</body>
<br><br><br>
</body>
</html>