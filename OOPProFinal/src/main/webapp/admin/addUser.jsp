<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
h2, h4{
text-align:center;}

form {
    width: 90%;
    background: #439A97;
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
function validateForm() {
    // Retrieving the values of form elements
    var name = document.contactForm.name.value;
    var email = document.contactForm.email.value;
    var password = document.contactForm.password.value;
   var usertype = document.contactForm.usertype.value;
   var phone = document.contactForm.phone.value;

   var wallet = document.contactForm.wallet.value;
   var userid= document.contactForm.userid.value;


	// Defining error variables with a default value
    var nameErr = emailErr = passwordErr = usertypeErr = phoneErr=walletErr=useridErr= true;

    // Validate name
    if(name == "") {
        printError("nameErr", "Please enter your name");
    } else {
        var regex = /^[a-zA-Z0-9\s]+$/;
        if(regex.test(name) === false) {
            printError("nameErr", "Please enter a valid name");
        } else {
            printError("nameErr", "");
            nameErr = false;
        }
    }
    if(userid == "") {
        printError("useridErr", "Please enter your userid");
    }  else {
            printError("useridErr", "");
            useridErr = false;
        }
    // Validate password
    if(password == "") {
        printError("passwordErr", "Please enter password");
    }
  else {
            printError("passwordErr", "");
            passwordErr = false;
        }

    // Validate email address
    if(email == "") {
        printError("emailErr", "Please enter your email address");
    } else {
        // Regular expression for basic email validation
        var regex = /^\S+@\S+\.\S+$/;
        if(regex.test(email) === false) {
            printError("emailErr", "Please enter a valid email address");
        } else{
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
            
            if(usertype == "") {
        printError("usertypeErr", "Please enter usertype");
    }
  else if(usertype==admin || usertype==normal || usertype== manager) {
            printError("usertypeErr", "");
            usertypeErr = false;
        }
        else 
        {
        printError("usertypeErr", "Please enter a valid usertype");
        }
        
       
 if(wallet == "") {
        printError("walletErr", "Wallet can't be empty");
    }
  else if(wallet<1000)
  {
            printError("walletErr", "Amount is less than 1000");
            
        }
        else
              	{
            printError("walletErr", "");
            walletErr = false;
        		}

    // Prevent the form from being submitted if there are any errors
    if((useridErr||nameErr || emailErr || phoneErr || walletErr || passwordErr || usertypeErr) == true) {
       return false;
    }

};
</script> 
</head>
<body>
<h2>Hello Admin! You can now add users too</h2>
                   <% 
String msg=request.getParameter("msg");
    		if("valid".equals(msg))
    		{
    			%>
    			<h4>Successfully Registered</h4>
    		<%
    		}

%>
<%
if("invalid".equals(msg))
{
	%>
	<h4>Some thing Went Wrong! Try Again !</h4>
	<% 
}
%>
<%
if("not".equals(msg))
{
	%>
	<h4>User Id not available! Try Again !</h4>
	<% 
}
%>

<form class="f" name="contactForm" onsubmit="return validateForm()"  action="addUserAction.jsp" method="post">
                     <div class="form-group">
    <label class="required" for="username">User Name</label>
    <input required name="username" type="text" class="form-control" id="username"  placeholder="Enter name">
    <div class="error" id="nameErr"></div>
     </div>  
     <div class="form-group">
    <label class="required" for="userid">User Id</label>
    <input required name="userid" type="text" class="form-control" id="userid"  placeholder="Enter user id">
    <div class="error" id="useridErr"></div>
     </div>  
                        <div class="form-group">
    <label class="required" for="email">Email</label>
    <input required onkeyup="check(this.value);" name="email" type="email" class="form-control" id="email"  placeholder="Enter your email address">
    <div class="error" id="emailErr"></div>
     </div>  
                  <div class="form-group">
    <label class="required" for="password">Password</label>
    <input required name="password" type="password" class="form-control" id="password"  placeholder="Enter your password">
    <div class="error" id="passwordErr"></div>
     </div>    
        <label class="required" for="password">Security Question</label>
      <select class="form-control" name="securityQuestion" required>
      <option value="What is the name of the first school that you attended?">What is the name of the first school that you attended?</option>
      <option value="What was your first car?">What was your first car?</option>
      <option value="What is your nickname?">What is your nickname?</option>
      
      </select>
      <input class="form-control" required type="text" name="answer" placeholder="Enter answer" required>
       <br></br>
                        <div class="form-group">
    <label class="required" for="userid">User Type</label>
    <input required name="usertype" type="text" class="form-control" id="usertype" value="user" placeholder="user">
    <div class="error" id="usertypeErr"></div>
     </div>  
                               <div class="form-group">
    <label class="required" for="phone">Phone number</label>
    <input required name="phone" type="number" class="form-control" id="phone"  placeholder="Enter phone number">
    <div class="error" id="phoneErr"></div>
     </div>  
                             
                               <div class="form-group">
    <label class="required" for="wallet">Add money to the wallet</label>
    <input required name="wallet" type="number" class="form-control" id="wallet"  placeholder="Enter amount of money(min 1000)">
    <div class="error" id="walletErr"></div>
     </div>  
                     <input class="btn btn-primary" type="submit" value="Create user">
                       <a class="btn btn-primary" href="../login.jsp">Login</a>   
                   <a class="btn btn-primary" href="allProductEditProduct.jsp">Back</a> 
                   </form>
                  

                   
</body>
</html>