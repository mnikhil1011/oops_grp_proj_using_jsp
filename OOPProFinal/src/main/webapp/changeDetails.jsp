<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<link rel="stylesheet" href="css/changeDetails.css">
<title>My Account</title>
<style>
hr
{width:70%;}</style>
</head>
<body>
<%
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where userid='"+userid+"' ");
	while(rs.next())
	{

%>
<h3 >Name:<%=rs.getString(1) %> </h3>
<hr>
 <h3>Email:<%=rs.getString(4) %> </h3>
 <hr>
 <h3>Mobile Number:<%=rs.getString(6) %> </h3>
 <hr>
<h3>Security Question: <%=rs.getString(9) %></h3>
<hr>
<h3 >Wallet:<%=rs.getString(8) %> </h3>
<hr>
      <br>
      <br>
 <%
 }
 }
 catch(Exception e){
	 System.out.println(e);
	 
 }%>     <br>

</body>
</html>