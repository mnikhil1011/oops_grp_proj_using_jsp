<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%

String userid=request.getParameter("userid");
String password=request.getParameter("password");
String usertype=request.getParameter("usertype");

	int z=0;
	try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where userid='"+userid+"' and password ='"+password+"' and usertype='"+usertype+"'");
	while(rs.next())
	{
		z=1;
		session.setAttribute("userid",userid);
		if(usertype.equals("admin"))
		{
			session.setAttribute("usertype","admin");
			response.sendRedirect("admin/allProductEditProduct.jsp");
			
		}
		else if(usertype.equals("manager"))
		{
			session.setAttribute("usertype", "manager");
			response.sendRedirect("manager/allProductEditProduct.jsp");
		}
		else{
		response.sendRedirect("home.jsp");
		}
	}
	if(z==0)
		response.sendRedirect("login.jsp?msg=notexist");
	}
	catch(Exception e){
		response.sendRedirect("login.jsp?msg=invalid");
	}

%>