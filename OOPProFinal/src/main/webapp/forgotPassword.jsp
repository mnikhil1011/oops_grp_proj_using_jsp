<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style>
a{
margin: auto 0;
  text-align: center;
}
form {
    width: 90%;
    background: #8EC3B0;
    padding: 40px 40px 40px;
    border: 1px solid #ccc;
    margin: 50px auto 0;
    border-radius: 5px;

}
  .whyforgotPassword{
 width: 90%;
    background: #8EC3B0;
    padding: 40px 40px 40px;
    border: 1px solid #ccc;
    margin: 50px auto 0;
    border-radius: 5px;
}
</style>
<title>ForgotPassword</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  <div class='whyforgotPassword'>
   <%
   String msg=request.getParameter("msg");
        if("done".equals(msg))
        {
        	%>
        	<h1>Password Changed Successfully!</h1>
        	<%
        }
   %>
<%if("invalid".equals(msg))
        {
        	%>
        	<h1>Some thing Went Wrong! Try Again !</h1>
        	<%
        }
   %>




    <h2>Welcome to Cannought Place!</h2>
    <p>
  </div>
     <form action="forgotPasswordAction.jsp" method="post">
                                <div class="form-group">
                                    <label for="userid">Email id</label>
                                    <input required name="email" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter email id">
                                   </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Mobile Number</label>
                                    <input required  name="phone" type="number" class="form-control" id="exampleInputPassword1" placeholder="Enter mobile number">
                                </div>
                                <div class="form-group">
                                   <select class="form-control" name="securityQuestion" required>
      <option class="form-control" value="What is the name of the first school that you attended?">What is the name of the first school that you attended?</option>
      <option class="form-control" value="What was your first car?">What was your first car?</option>
      <option class="form-control" value="What is your nickname?">What is your nickname?</option>
      
      </select>
      
      <input class="form-control" type="text" name="answer" placeholder="Enter answer" required>
         </div>
      <div class="form-group">
                                    <label for="exampleInputPassword1">New Password</label>
      <input class="form-control" type="password" name="newPassword" placeholder="Enter new password" required>
         </div>
         <input class="btn btn-primary" type="submit" value="Save"></input>
         <br></br>
        <a  class="btn btn-outline-info" href="login.jsp">Login</a>
         
   
                          
                              

                            </form>
     
     
     
      
  </div>
  
</div>
</body>
</html>