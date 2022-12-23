<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp" %>

<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style>
label, input{
 font-size: 25px;}
 input::placeholder {
    font-size: 20px;
}
form {
    width: 90%;
    background: #439A97;
    padding: 40px 40px 40px;
    border: 1px solid #ccc;
    margin: 50px auto 0;
    border-radius: 5px;

}</style>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>
</head>
<body>

<%
String msg=request.getParameter("msg");
if("notMatch".equals(msg)){
	%>
	<h3 class="alert">New password and Confirm password does not match!</h3>
<%}
%>
<%

if("wrong".equals(msg)){
	%>
<h3 class="alert">Your old Password is wrong!</h3><%}
%>
<%

if("done".equals(msg)){
	%>
<h3 class="alert">Password change successfully!</h3><%}
%>

<%

if("invalid".equals(msg)){
	%>
<h3 class="alert">Some thing went wrong! Try again!</h3><%}
%>




<form action="changePasswordAction.jsp" method="post"> 
<div class="form-group">
                                    <label for="userid">Enter Old Password</label>
                                    <input required name="oldPassword" type="password" class="form-control" id="userid" aria-describedby="emailHelp" placeholder="Enter old password">
                                  
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Enter New Password</label>
                                    <input required  name="newPassword" type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter new password">
                                </div>

  <div class="form-group">
                                    <label for="exampleInputPassword1">Enter Confirm Password</label>
                                    <input required  name="confirmPassword" type="password" class="form-control" id="exampleInputPassword1" placeholder="Confirm password">
                                </div>
 

<button class="btn btn-info button"  type="submit">Save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>



</body>
<br><br><br>
</html>