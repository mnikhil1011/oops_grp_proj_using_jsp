<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String userid=session.getAttribute("userid").toString();

try{
	double wallet=0;
	double total=0;
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where userid='"+userid+"'");
	ResultSet rs1=st.executeQuery("select * from cart where userid='"+userid+"'");
	while(rs1.next())
	{
		total=rs1.getDouble(5);
		wallet=rs1.getDouble(7);
	}
	if(total<wallet)
	{
		st.executeUpdate("update users set wallet='"+(wallet-total)+"' where userid= '"+userid+"' ");
		st.executeUpdate("update cart set wallet='"+(wallet-total)+"' where userid= '"+userid+"' ");
		response.sendRedirect("addressPaymentForOrder.jsp?msg=successful");
		
	}
	else
	{
		response.sendRedirect("addressPaymentForOrder.jsp?msg=notEnoughMoney");
	}
}
	catch(Exception e)
{
		System.out.println(e);
		response.sendRedirect("addressPaymentForOrder.jsp?msg=invalid");
	}

%>