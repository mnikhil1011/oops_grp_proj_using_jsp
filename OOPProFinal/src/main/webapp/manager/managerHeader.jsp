<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
       <%String usertype=session.getAttribute("usertype").toString(); %>
            <center><h2>Welcome to Cannought Place! </h2></center>
            
            
            
            
            <nav class="navbar navbar-expand-lg navbar-light bg-light">

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="addNewProduct.jsp">Add New Product <span class="sr-only">(current)</span><i class='fas fa-plus-square'></i></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="allProductEditProduct.jsp">All Products & Edit Products<i class='fab fa-elementor'></i></a>
      </li>

<li class="nav-item active">
        <a class="nav-link" href="../logout.jsp">Logout <i class='fas fa-share-square'></i><span class="sr-only">(current)</span><i class='fas fa-plus-square'></i></a>
      </li>


     
    </ul>
    <br>
  </div>
</nav>
          </div>
           <br>
           <!--table-->
