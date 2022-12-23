
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<style>
h3,h2{
color:#000;
text-align:center;
}
.custom-bg, .card-body{
background: #8EC3B0;
}
form {
    width: 90%;
    background: #8EC3B0;
    padding: 40px 40px 40px;
    border: 1px solid #ccc;
    margin: 50px auto 0;
    border-radius: 5px;

}
  
.whysignLogin{
 width: 90%;
    background: #8EC3B0;
    padding: 40px 40px 40px;
    border: 1px solid #ccc;
    margin: 50px auto 0;
    border-radius: 5px;
}
</style>
<title>Login</title>
</head>
<body>

      <div class="container">
      
            <div class="row">
                <div class="col-md-7 offset-md-3 center">

                    <div class="card mt-3">

                        <div class="card-header custom-bg text-white">
                            <h3>Login here</h3>
                               
                              <div class='whysignLogin'>
                               <h2>Welcome to cannought place!</h2>
  <%
  String msg=request.getParameter("msg");
	if("notexist".equals(msg))	
	{
		%>
		 <h3>Username or password or usertype doesn't match</h3>
		<%
	}
  %>
 <% if("invalid".equals(msg))	
	{
		%>
		<h3>Some thing Went Wrong! Try Again !</h3>
		<%
	}
  %>
   <% if("deleted".equals(msg))	
	{
		%>
		<h3>Your account has been deleted!</h3>
		<%
	}
  %>
 



  </div>
                        </div>

                        <div class="card-body">                            
                         
                            <form action="loginAction.jsp" method="post">
                                <div class="form-group">
                                    <label for="userid">User Id</label>
                                    <input required name="userid" type="text" class="form-control" id="userid" aria-describedby="emailHelp" placeholder="Enter user id">
                                  
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input required  name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <input name="usertype" type="radio" id="html"  value="admin">
<label for="html">admin</label>
<input type="radio" id="css" name="usertype" value="user">
<label for="css">user</label>
<input type="radio" id="javascript" name="usertype" value="manager">
<label for="javascript">manager</label><br>
                                <a  class="btn btn-info" href="signup.jsp" class="text-center d-block mb-2"> Sign up </a>
                               <br></br>
                               <a  class="btn btn-info" href="forgotPassword.jsp">Forgot Password?</a>

                             

                                    <button  class="btn btn-info" type="submit" class="btn btn-primary border-0 custom-bg ">Submit</button>
                                    
                              

                            </form>

                        </div>


                    </div>




                </div>
            </div>
      

</div>

</body>
</html>