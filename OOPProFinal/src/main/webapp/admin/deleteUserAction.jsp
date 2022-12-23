<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String userid =request.getParameter("userid");
try{
	
	Connection con=ConnectionProvider.getCon();
	PreparedStatement st = con.prepareStatement("DELETE FROM users WHERE userid = '"+userid+"'");
	PreparedStatement st1 = con.prepareStatement("DELETE FROM cart WHERE userid = '"+userid+"'");
    st.executeUpdate();
    st1.executeUpdate();

	response.sendRedirect("deleteUser.jsp?msg=deleted");
	
	
}
catch(Exception e){
	response.sendRedirect("deleteUser.jsp?msg=wrong");
	System.out.println(e);
	
}

%>
