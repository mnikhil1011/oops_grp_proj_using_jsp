<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
String userid=session.getAttribute("userid").toString();
String itemid =request.getParameter("itemcode");

int quantity=1;
double product_price=0;
double product_total=0;
double cart_total=0;
int wallet=0;
double dis=0;
int z=0;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs2=st.executeQuery("select * from users where userid='"+userid+"'");
	while(rs2.next())
	{
		
		wallet=rs2.getInt(8);
	}
	ResultSet rs=st.executeQuery("select * from product where itemcode='"+itemid+"'");
	while(rs.next())
	{
		product_price=rs.getDouble(3);
		dis=rs.getDouble(4);
		product_price=product_price-((dis/100.0)*product_price);
		
		product_total=product_price;
		
	}
	ResultSet rs1=st.executeQuery("select * from cart where itemid='"+itemid+"' and userid='"+userid+"' and address is NULL");
	while(rs1.next())
	{
		cart_total=rs1.getDouble(5);
		cart_total=cart_total+product_total;
		quantity=rs1.getInt(3);
		quantity=quantity+1;
		z=1;
	}
	if(z==1)
	{
		st.executeUpdate("update cart set total='"+cart_total+"',quantity='"+quantity+"' where itemid='"+itemid+"' and userid= '"+userid+"' and address is NULL ");
		response.sendRedirect("home.jsp?msg=exist");
		
	}
	if(z==0)
	{
		PreparedStatement ps=con.prepareStatement("insert into cart(userid,itemid,quantity,price,total,wallet) values(?,?,?,?,?,?)");
	ps.setString(1,userid);
	ps.setString(2,itemid);
	ps.setDouble(3,quantity);
	ps.setDouble(4,product_price);
	ps.setDouble(5,product_total);
	ps.setInt(6,wallet);
	ps.executeUpdate();
	response.sendRedirect("home.jsp?msg=added");
	}
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("home.jsp?msg=invalid");
}
%>