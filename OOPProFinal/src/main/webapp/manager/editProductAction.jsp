<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String userid=session.getAttribute("userid").toString();
String itemname=request.getParameter("itemname");
String itemcode=request.getParameter("itemcode");
String price=request.getParameter("price");
String discount=request.getParameter("discount");
String qtyavailable=request.getParameter("qtyavailable");

try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	Statement st1=con.createStatement();
	st1.executeUpdate("update product set itemname='"+itemname+"' , price ='"+price+"',discount='"+discount+"', qtyavailable='"+qtyavailable+"' where itemcode='"+itemcode+"' ");
	st.executeUpdate("update managerproduct set itemname='"+itemname+"' , price ='"+price+"',discount='"+discount+"', qtyavailable='"+qtyavailable+"' where itemcode='"+itemcode+"' and userid='"+userid+"'");
	if(qtyavailable.equals("0")){
		st.executeUpdate("delete from cart where itemid='"+itemcode+"' and address is NULL");
	}
	response.sendRedirect("allProductEditProduct.jsp?msg=done");
	
}

	catch(Exception e){
		System.out.println(e);
		response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
	}
%>