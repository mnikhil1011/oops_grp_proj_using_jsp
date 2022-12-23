<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>

<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
<style>
.table-custom { margin: 0px auto; }
body{
	background:#439A97;
}
.back
{
  color: white;
  margin-left: 2.5%
}form {
    width: 90%;
    background: #8EC3B0;
    padding: 40px 40px 40px;
    border: 1px solid #ccc;
    margin: 50px auto 0;
    border-radius: 5px;

}
</style>
</head>
<body>
 <h2><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
<%
String itemcode=request.getParameter("itemcode");
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from product where itemcode='"+itemcode+"'");
	while(rs.next())
	{
		
	


%>


 <form action="editProductAction.jsp" method="post">

<input type="hidden" name="itemcode" value="<%out.println(itemcode);%>">

<div class="form-group">
                                    <label for="userid">Enter item name</label>
                                    <input required value="<%=rs.getString(1) %>" name="itemname" type="text" class="form-control" id="userid" aria-describedby="emailHelp" placeholder="Enter name of the item">
                                  
                                </div>
                                <div class="form-group">
                                    <label for="price">Enter price</label>
                                    <input required value="<%=rs.getString(3) %>" name="price" type="text" class="form-control" id="userid" aria-describedby="emailHelp" placeholder="Enter price">
                                  
                                </div>
                                <div class="form-group">
                                    <label for="userid">Enter discount</label>
                                    <input required value="<%=rs.getString(4) %>" name="discount" type="text" class="form-control" id="userid" aria-describedby="emailHelp" placeholder="Enter discount">
                                  
                                </div>
                                <div class="form-group">
                                    <label for="userid">Enter quantity available</label>
                                    <input required value="<%=rs.getString(5) %>" name="qtyavailable" type="text" class="form-control" id="userid" aria-describedby="emailHelp" placeholder="Enter quantity available">
                                  
                               
 <button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
   </form>

<%

}
}
catch(Exception e){
	System.out.println(e);
}
%>
 
</body>
<br><br><br>
</body>
</html>