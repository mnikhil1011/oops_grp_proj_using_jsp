<%@ page import="project.User" %>
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%

User user=new User();
user.username=request.getParameter("username");
user.userid=request.getParameter("userid");
user.usertype=request.getParameter("usertype");
user.email=request.getParameter("email");
user.password=request.getParameter("password");
user.phone=request.getParameter("phone");
user.address=null;
user.wallet=request.getParameter("wallet");
user.securityQuestion=request.getParameter("securityQuestion");
user.answer=request.getParameter("answer");
try{
	Connection con=ConnectionProvider.getCon();
	 PreparedStatement st = con.prepareStatement("select * from users where userid = '"+user.userid+"' ");
     ResultSet r1=st.executeQuery();
     if(r1.next()){
    	 response.sendRedirect("addUser.jsp?msg=not");
     }
     else{
	PreparedStatement ps=con.prepareStatement("insert into users values(?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1,user.username);
	ps.setString(2,user.userid);
	ps.setString(3,user.usertype);
	ps.setString(4,user.email);
	ps.setString(5,user.password);
	ps.setString(6,user.phone);
	ps.setString(7,user.address);
	ps.setString(8,user.wallet);
	ps.setString(9,user.securityQuestion);
	ps.setString(10,user.answer);
	ps.executeUpdate();
	response.sendRedirect("addUser.jsp?msg=valid");
     }
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("addUser.jsp?msg=invalid");
}
%>