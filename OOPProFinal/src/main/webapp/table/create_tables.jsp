
<%@ page import="project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>
<%
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	String q1="create table users(username varchar(100),userid varchar(50),usertype varchar(20),email varchar(100)primary key, phone bigint,password varchar(500),address varchar(500), wallet bigint,securityQuestion varchar(200), answer varchar(200))";
	String q2="create table product(itemname varchar(100),itemcode int,price bigint,discount int,qtyavailable int,deliverydate DATE)";
	String q3="create table cart(userid varchar(100), itemid int, quantity int, price int, total int, address varchar(500),wallet bigint,phone bigint, orderdate varchar(100), deliverydate varchar(100), status varchar(10)) ";
	String q4="create table managerproduct(userid varchar(50),itemname varchar(100),itemcode int,price bigint,discount int,qtyavailable int,deliverydate DATE)";
	System.out.println(q1);
	System.out.println(q2);
	System.out.println(q3);
	//st.execute(q1);
	//st.execute(q2);
	//st.execute(q3);
	st.execute(q4);
	System.out.print("Table created");
	
	con.close();
}
catch(Exception e){
	System.out.print(e);
}
%>



