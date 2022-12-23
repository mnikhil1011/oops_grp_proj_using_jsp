<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Signup</title>
<style>
h2{
text-align:center;}
h3{
text-align:center;}
.center{

  position: absolute;
  margin: auto;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;

  
  border-radius: 3px;
}

.required:after {
    content:" *";
    color: red;}
    .error {
    color: red;
    font-size: 90%;}
 form {
    width: 90%;
    background: #8EC3B0;
    padding: 40px 40px 40px;
    border: 1px solid #ccc;
    margin: 50px auto 0;
    border-radius: 5px;

}
  
.whysign{
 width: 90%;
    background: #8EC3B0;
    padding: 40px 40px 40px;
    border: 1px solid #ccc;
    margin: 50px auto 0;
    border-radius: 5px;
}
</style>
 <script>
// Defining a function to display error message
function printError(elemId, hintMsg) {
    document.getElementById(elemId).innerHTML = hintMsg;
}

// Defining a function to validate form
function validateForm() 
{
    // Retrieving the values of form elements
    var username = document.contactForm.username.value;
    var email = document.contactForm.email.value;
    var password = document.contactForm.password.value;
   var usertype = document.contactForm.usertype.value;
   var phone = document.contactForm.phone.value;
   var answer = document.contactForm.answer.value;
   var wallet = document.contactForm.wallet.value;
   var userid= document.contactForm.userid.value;


	// Defining error variables with a default value
    var secErr= usernameErr = emailErr = passwordErr = usertypeErr = phoneErr = walletErr = useridErr = true;

    // Validate name
    if(username == "")
   		 {
        printError("nameErr", "Please enter your name");
    	} else
   		 {
        var regex = /^[a-zA-Z0-9\s]+$/;
        if(regex.test(username) === false) 
        {
            printError("nameErr", "Please enter a valid name");
        } else
        {
            printError("nameErr", "");
            nameErr = false;
        }
    }
    // validating userid
    if(userid == "") 
    {
        printError("useridErr", "Please enter your userid");
    }  else 
    {
            printError("useridErr", "");
            useridErr = false;
       }
    // validating answer
    if(answer == "")
    {
        printError("secErr", "Please enter your answer");
    }  else 
    {
            printError("secErr", "");
           secErr = false;
       }
    // Validate password
    if(password == "")
    {
        printError("passwordErr", "Please enter password");
    }
  else {
            printError("passwordErr", "");
            passwordErr = false;
        }

    // Validate email address
    if(email == "")
    {
        printError("emailErr", "Please enter your email address");
    } else 
    {
        // Regular expression for basic email validation
        var regex = /^\S+@\S+\.\S+$/;
        if(regex.test(email) === false)
        {
            printError("emailErr", "Please enter a valid email address");
        } else
        {
            printError("emailErr", "");
            emailErr = false;
        }
    }

    // Validate mobile number
    if(phone == "")
      	{
        printError("phoneErr", "Please enter your mobile number");
    	} else
        	{
        var regex = /^[1-9]\d{9}$/;
        if(regex.test(phone) === false)
        	{
            printError("phoneErr", "Please enter a valid 10 digit mobile number");
       		 }
              else
              	{
            printError("phoneErr", "");
            phoneErr = false;
        		}
    		}
            // validating usertype
            
            if(usertype == "")
            {
        printError("usertypeErr", "Please enter usertype");
    		  }
  else 
	 	 {
	  		if(usertype != admin && usertype != user && usertype != manager)
	  			{
		  printError("usertypeErr", "Please enter a valid usertype");
            
        		}
       			 else 
        {
       
        printError("usertypeErr", "");
        usertypeErr = false;
        }
	  }
        
       //validating wallet
 if(wallet == "")
 {
        printError("walletErr", "Wallet can't be empty");
 }
  else
	  {
	  if(wallet<1000)
            printError("walletErr", "Amount is less than 1000");
        else
              	{
            printError("walletErr", "");
            walletErr = false;
        		}
 }

    // Prevent the form from being submitted if there are any errors
    if(( secErr || useridErr || nameErr || emailErr || phoneErr || walletErr || passwordErr || usertypeErr) == true) 
    {
       return false;
    }

};
</script>  
</head>
<body>
<div id='container'>
  <div class='signup'>
    <div class="container-fluid">
               <div class="row mt-5">
               <div class="col-md-7 offset-md-4 center">
    <h3 class="text-center my-3">Sign up here!!</h3>
                            <div class='whysign'>
<% 
String msg=request.getParameter("msg");
    		if("valid".equals(msg))
    		{
    			%>
    			<h3>Successfully Registered</h3>
    		<%
    		}

%>
<%
if("invalid".equals(msg))
{
	%>
	<h3>Some thing Went Wrong! Try Again !</h3>
	<% 
}
%>
<%
if("not".equals(msg))
{
	%>
	<h3>User Id not available! Try Again !</h3>
	<% 
}
%>





    <h2>Welcome to Cannought place!</h2>
  </div>
                   <form class="f" name="contactForm" onsubmit="return validateForm()"  action="signupAction.jsp" method="post">
                     <div class="form-group">
    <label class="required" for="username">User Name</label>
    <input name="username" type="text" class="form-control" id="username"  placeholder="Enter name">
    <div class="error" id="nameErr"></div>
     </div>  
     <div class="form-group">
    <label class="required" for="userid">User Id</label>
    <input name="userid" type="text" class="form-control" id="userid"  placeholder="Enter user id">
    <div class="error" id="useridErr"></div>
     </div>  
                        <div class="form-group">
    <label class="required" for="email">Email</label>
    <input onkeyup="check(this.value);" name="email" type="email" class="form-control" id="email"  placeholder="Enter your email address">
    <div class="error" id="emailErr"></div>
     </div>  
                  <div class="form-group">
    <label class="required" for="password">Password</label>
    <input name="password" type="password" class="form-control" id="password"  placeholder="Enter your password">
    <div class="error" id="passwordErr"></div>
     </div >    
      <div class="form-group">
      <label class="required" for="answer">Security Question</label>
      <select  class="form-control" name="securityQuestion" required>
      <option  class="form-control" value="What is the name of the first school that you attended?">What is the name of the first school that you attended?</option>
      <option  class="form-control" value="What was your first car?">What was your first car?</option>
      <option  class="form-control"  value="What is your nickname?">What is your nickname?</option>
      
      </select>
      <input id="answer" class="form-control" type="text" name="answer" placeholder="Enter answer" >
      <div class="error" id="secErr"></div>
       </div>
                        <div class="form-group">
    <label class="required" for="usertype">User Type</label>
    <input name="usertype" type="text" class="form-control" id="usertype"  placeholder="Enter user type(user/manager/admin)">
    <div class="error" id="usertypeErr"></div>
     </div>  
                               <div class="form-group">
    <label class="required" for="phone">Phone number</label>
    <input name="phone" type="text" class="form-control" id="phone"  placeholder="Enter phone number">
    <div class="error" id="phoneErr"></div>
     </div>  
                             
                               <div class="form-group">
    <label class="required" for="wallet">Add money to your wallet</label>
    <input name="wallet" type="text" class="form-control" id="wallet"  placeholder="Enter amount of money(min 1000)">
    <div class="error" id="walletErr"></div>
    
    <div class="form-group">
    <label ">Address</label>
    <input name="address" type="text" class="form-control" id="address"  placeholder="Enter address">
   
     </div>  
                     <input   class="btn btn-info" type="submit" value="Submit">
                       <a  class="btn btn-info" href="login.jsp">Login</a>   
                   
                   </form>

</div> 
                   </div>
                   
                   
               </div>
           </div>
    
  </div>
 

</body>
</html>