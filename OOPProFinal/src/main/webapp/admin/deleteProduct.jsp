<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String itemcode=request.getParameter("itemcode");
try{
	
	Connection con=ConnectionProvider.getCon();
	PreparedStatement st = con.prepareStatement("DELETE FROM product WHERE itemcode='"+itemcode+"'");
	PreparedStatement st1 = con.prepareStatement("DELETE FROM managerproduct WHERE itemcode='"+itemcode+"'");
    st.executeUpdate();
    st1.executeUpdate();

	response.sendRedirect("allProductEditProduct.jsp?msg=deleted");
	
	
}
catch(Exception e){
	response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
	System.out.println(e);
	
}
%>