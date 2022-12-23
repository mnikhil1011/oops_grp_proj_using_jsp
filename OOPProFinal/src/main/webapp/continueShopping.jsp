<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String userid=session.getAttribute("userid").toString();
String status="processing";
try{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("update cart set status=? where userid =? and status='bill'");
	ps.setString(1,status);
	ps.setString(2,userid);
	ps.executeUpdate();
	response.sendRedirect("home.jsp");
}
catch(Exception e){
	System.out.println(e);
}
%>