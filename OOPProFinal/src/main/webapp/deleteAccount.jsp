<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

form {
   
    margin: 0 auto;
}
form {
    width: 90%;
    background: #439A97;
    padding: 40px 40px 40px;
    border: 1px solid #ccc;
    margin: 50px auto 0;
    border-radius: 5px;

}
</style>

</head>
<body>
<form class="f" name="contactForm"  action="deleteAccountAction.jsp" method="post">
                     <div class="form-group">
    <label class="required" for="username">Want to delete your account?</label>
    <input name="userid" type="text" class="form-control" id="username"  placeholder="Enter your user id if you want to delete your account">
   <br>
   
                     <input class="btn btn-info"  class="btn" type="submit" value="Delete my account">
                         <a class="btn btn-info"  href="home.jsp">Go back to home page</a>
                   
                   </form>
                   

                   
</body>
</html>