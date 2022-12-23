<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String itemname=request.getParameter("itemname");
String itemcode=request.getParameter("itemcode");
String price=request.getParameter("price");
String discount=request.getParameter("discount");
String qtyavailable=request.getParameter("qtyavailable");

try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	Statement st1=con.createStatement();
	st.executeUpdate("update product set itemname='"+itemname+"' , price ='"+price+"',discount='"+discount+"', qtyavailable='"+qtyavailable+"' where itemcode='"+itemcode+"'");
	st1.executeUpdate("update managerproduct set itemname='"+itemname+"' , price ='"+price+"',discount='"+discount+"', qtyavailable='"+qtyavailable+"' where itemcode='"+itemcode+"'");
	if(qtyavailable.equals("0")){
		st.executeUpdate("DELEET FROM cart WHERE itemid='"+itemcode+"' and address is NULL");
		st1.executeUpdate("DELETE FROM managerproduct WHERE itemid='"+itemcode+"' and address is NULL");
	}
	response.sendRedirect("allProductEditProduct.jsp?msg=done");
	
}

	catch(Exception e){
		System.out.println(e);
		response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
	}
%>