<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String userid=session.getAttribute("userid").toString();
String address =request.getParameter("address");
String phone =request.getParameter("phone");
String status="bill";


try{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("update users set address=?, phone=? where userid=?");
	ps.setString(1,address);
	ps.setString(2,phone);
	ps.setString(3,userid);
	ps.executeUpdate();
	
	PreparedStatement ps1=con.prepareStatement("update cart set address=?, phone=?, orderdate=now(),deliverydate=DATE_ADD(orderdate,INTERVAL 7 DAY),status=? where userid=?  and address is NULL");
  ps1.setString(1,address);
  ps1.setString(2,phone);
  ps1.setString(3,status);
  ps1.setString(4,userid);
  ps1.executeUpdate();
  response.sendRedirect("bill.jsp");
  

}
catch(Exception e){
	System.out.println(e);
}

%>