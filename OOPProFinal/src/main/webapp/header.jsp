<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<style>

</style>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
    <%String userid=session.getAttribute("userid").toString(); %>
            <center><h2>Welcome to Cannought Place!</h2></center>
            <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-custom">

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
    <h2><a href=""><%out.println(userid); %> <i class='fas fa-user-circle'></i></a></h2>
      <li class="nav-item active">
       
            <a href="home.jsp">Home<i class="fa fa-institution"></i></a>
      </li>
      <li class="nav-item">
       <a href="myCart.jsp">My Cart<i class='fas fa-cart-arrow-down'></i></a>
      </li>
<li class="nav-item active">
        <a href="myOrders.jsp">My Orders  <i class='fab fa-elementor'></i></a>
      </li>
 </li>
<li class="nav-item active">
       <a href="changeDetails.jsp">My Account <i class="fa fa-edit"></i></a>
      </li>
 </li>
 <li class="nav-item active">
       <a href="addMoney.jsp">Add money to wallet <i class="fa fa-money" aria-hidden="true"></i></a>
      </li>
 </li>

<li class="nav-item active">
         <a href="deleteAccount.jsp">Delete my account <i class="fa fa-address-book"></i></a>
      </li>
<li class="nav-item active">
        <a href="logout.jsp">Logout <i class='fas fa-share-square'></i></a>
      </li>
<div class="search-container">
             
                 <form action="searchHome.jsp" method="post" class="form-inline my-2 my-lg-0">
      <input name="search" class="form-control mr-sm-1" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><i class="fa fa-search"></i></button>
    </form>
               
             
            </div>

     
    </ul>
    <br>
  </div>
          </div>
           <br>
           <!--table-->
