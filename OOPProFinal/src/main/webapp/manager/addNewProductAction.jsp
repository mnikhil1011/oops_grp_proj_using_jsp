<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String userid=session.getAttribute("userid").toString();
String itemname=request.getParameter("itemname");
String itemcode=request.getParameter("itemcode");
String price=request.getParameter("price");
String discount=request.getParameter("discount");
String qtyavailable=request.getParameter("qtyavailable");
String deliverydate=null;




try{
	
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("insert into product values(?,?,?,?,?,?,?)");
	PreparedStatement ps1=con.prepareStatement("insert into managerproduct values(?,?,?,?,?,?,?)");
	ps.setString(1,itemname);
	ps.setString(2,itemcode);
	ps.setString(3,price);
	ps.setString(4,discount);
	ps.setString(5,qtyavailable);
	ps.setString(6,deliverydate);
	ps.setString(7,userid);
	ps1.setString(1,userid);
	ps1.setString(2,itemname);
	ps1.setString(3,itemcode);
	ps1.setString(4,price);
	ps1.setString(5,discount);
	ps1.setString(6,qtyavailable);
	ps1.setString(7,deliverydate);

	ps.executeUpdate();
	ps1.executeUpdate();
	response.sendRedirect("addNewProduct.jsp?msg=done");
	
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("addNewProduct.jsp?msg=wrong");
}
%>