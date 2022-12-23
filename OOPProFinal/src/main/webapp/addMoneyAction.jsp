<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "java.lang.*"%>
<%
String userid=session.getAttribute("userid").toString();
String m=request.getParameter("money");
Double money=Double.parseDouble(m);
try{
	double wallet=0;
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where userid='"+userid+"'");
	while(rs.next()){
		wallet=rs.getDouble(8);
	}
	double totalmoney=wallet+money;
		st.executeUpdate("update users set wallet='"+totalmoney+"' where userid='"+userid+"'");
		st.executeUpdate("update cart set wallet='"+totalmoney+"' where userid='"+userid+"'");
		response.sendRedirect("addMoney.jsp?msg=done");
}
	

catch(Exception e)
{response.sendRedirect("addMoney.jsp?msg=wrong");
	System.out.println(e);
}
%>
