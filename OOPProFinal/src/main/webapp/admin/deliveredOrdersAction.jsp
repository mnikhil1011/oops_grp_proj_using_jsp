<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String itemcode=request.getParameter("itemcode");
String userid=request.getParameter("userid");
String status="delivered";
try{
	Connection con=ConnectionProvider.getCon();
Statement st=con.createStatement();
	st.executeUpdate("update cart set status='"+status+"' where itemid='"+itemcode+"' and userid='"+userid+"' and address is not NULL ");
	response.sendRedirect("ordersReceived.jsp?msg=delivered");
}
catch(Exception e){
	response.sendRedirect("ordersReceived.jsp?msg=wrong");
	System.out.println(e);
}
%>