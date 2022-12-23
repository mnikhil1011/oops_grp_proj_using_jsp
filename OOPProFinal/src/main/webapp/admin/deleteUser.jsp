<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

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
<form class="f" name="contactForm"  action="deleteUserAction.jsp" method="post">
                     <div class="form-group">
    <label class="required" for="username">User Id</label>
    <input name="userid" type="text" class="form-control" id="username"  placeholder="Enter user id that you want to delete">
   <br>
   
                     <input class="btn btn-info button"  class="btn" type="submit" value="Delete user">
                        <a class="btn btn-info "  href="allProductEditProduct.jsp">Go back to admin page</a> 
                   
                   </form>
                   <% 
String msg=request.getParameter("msg");
    		if("deleted".equals(msg))
    		{
    			%>
    			<h1>Successfully Deleted</h1>
    		<%
    		}

%>
<%
if("wrong".equals(msg))
{
	%>
	<h4>Some thing Went Wrong! Try Again !</h4>
	<% 
}
%>

                   
</body>
</html>