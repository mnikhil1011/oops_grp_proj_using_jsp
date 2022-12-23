<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
            <center><h2>My Account<i class="fa fa-edit"></i></h2></center>
             <% String userid=session.getAttribute("userid").toString();%>
            <h2><a href="home.jsp"><i class='fas fa-arrow-circle-left'>Back</i></a></h2>
             <h2><a href="changeDetails.jsp">Your Profile(<%out.println(userid);%>)<i class='fas fa-user-alt'></i></a></h2>
            <a href="changePassword.jsp">Change Password <i class='fas fa-key'></i></a>
            <a href="addMoney.jsp">Add money to wallet <i class="fa fa-edit"></i></a>
            
          </div>
           <br>
           <!--table-->
