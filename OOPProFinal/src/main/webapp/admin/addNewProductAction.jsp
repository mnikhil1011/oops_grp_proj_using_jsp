<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page import="project.User" %>
<%

String itemname=request.getParameter("itemname");
String itemcode=request.getParameter("itemcode");
String price=request.getParameter("price");
String discount=request.getParameter("discount");
String qtyavailable=request.getParameter("qtyavailable");
String deliverydate=null;
String admin="admin";



try{
	
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("insert into product values(?,?,?,?,?,?,?)");
	ps.setString(1,itemname);
	ps.setString(2,itemcode);
	ps.setString(3,price);
	ps.setString(4,discount);
	ps.setString(5,qtyavailable);
	ps.setString(6,deliverydate);
	ps.setString(7,admin);
	
	ps.executeUpdate();
	response.sendRedirect("addNewProduct.jsp?msg=done");
	
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("addNewProduct.jsp?msg=wrong");
}
%>