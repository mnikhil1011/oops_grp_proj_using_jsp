<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String userid=session.getAttribute("userid").toString();
String itemcode=request.getParameter("itemcode");
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("delete from cart where userid='"+userid+"' and itemid='"+itemcode+"' and address is NULL");
	response.sendRedirect("myCart.jsp?msg=removed");
}
catch(Exception e){
	System.out.println(e);
	
}

%>

%>
