<%@page import = "java.sql.*,java.io.*,java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="${pageContext.request.contextPath}\css\AddDtlsRes.css">
<meta charset="ISO-8859-1">
<title>Admin Page</title>
</head>
<body>
	<%! Connection con;
		ResultSet rs;
		String uname1,pass,email;
		PreparedStatement statement2;
		%>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo_schema1","root","Steve07@mysql");

	     String name = request.getParameter("name");
	     String rollno = request.getParameter("rollno");
	     String degree = request.getParameter("degree");
	     String dpt = request.getParameter("dept");
	     String joindate = request.getParameter("joindate");   
		 String dob = request.getParameter("birth_date");
	     String bloodgp = request.getParameter("bloodgrp");
	     String mobile = request.getParameter("mobile");
	     String gender= request.getParameter("gender");
	     String address = request.getParameter("address");
	     
	     String tenth = request.getParameter("10");
	     String twelvth = request.getParameter("12");
	     String diploma = request.getParameter("Diploma");
	     email = request.getParameter("email");
	     
	     		String sql = "update sms_stddatabase set name = ?, RollNo = ?,Degree=?,Dept=?,joindate=?,dob=?,bloodgp=?,mobile=?,gender=?,address=?,email=?,tenth=?,twelvth=?,diploma=? where RollNo = ?";
	            statement2 = con.prepareStatement(sql);
	            statement2.setString(1, name);
	            statement2.setString(2, rollno);
	            statement2.setString(3, degree);
	            statement2.setString(4, dpt);
	            statement2.setString(5, joindate);
	            statement2.setString(6, dob);
	            statement2.setString(7, bloodgp);
	            statement2.setString(8, mobile);
	            statement2.setString(9, gender);
	            statement2.setString(10, address);
	            statement2.setString(11, email);
	            statement2.setInt(12,Integer.parseInt(tenth));
	            if(twelvth!=null){
	            	statement2.setInt(13, Integer.parseInt(twelvth));
	            	statement2.setInt(14, 0);
	            		
	            }
	            else if(diploma!=null){
	            	statement2.setInt(14, Integer.parseInt(diploma));
	            	statement2.setInt(13, 0);
	            	}
	            statement2.setString(15, rollno);
	            String message;
	            
	            int row = statement2.executeUpdate();
	            
	            if (row>0) {
	            	message="Details Updated sucessfully !";
	            }
	            else {
					message= "couldn't register";
				}
				
	%>
		<h1 ><%=message %></h1>
	<div class="form">
	<form method="get" action="Adminhome.jsp">
    <button type="submit">HOME</button>
	</form>
	</div>
</body>
</html>