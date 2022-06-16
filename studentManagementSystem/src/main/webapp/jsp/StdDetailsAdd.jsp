<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import = "java.sql.*,java.io.*,java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%! Connection con;
		Statement stmt;
		ResultSet rs;
		String uname1,pass,email;
		InputStream is = null;
		InputStream is2 = null;
		InputStream is3 = null;
		Part filePart,filePart2,filePart3;
		
		%>>
	<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	Class.forName("com.mysql.jdbc.Driver");
	
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo_schema1","root","Steve07@mysql");
	stmt = con.createStatement();

     String name = request.getParameter("fname");
     String rollno = request.getParameter("rollno");
     String degree = request.getParameter("degree");
     String dpt = request.getParameter("dpt");   
     String joindate = request.getParameter("joindate");   
     /*SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
     java.sql.Date startDate = sdf.parse(request.getParameter("joindate"));*/
	 String dob = request.getParameter("dob");
     String bloodgp = request.getParameter("bloodgp");
     String mobile = request.getParameter("mobile");
     String gender= request.getParameter("gender");
     String address = request.getParameter("address");
     String email = request.getParameter("email");
     
        filePart = request.getPart ("10th");
     	filePart2 = request.getPart("12th");
     	filePart3 = request.getPart("aadhar");
     	
        if (filePart != null&&filePart2 != null&&filePart3 != null) {
    		
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
            System.out.println("");
            System.out.println(filePart2.getName());
            System.out.println(filePart2.getSize());
            System.out.println(filePart2.getContentType());
            System.out.println("");
            System.out.println(filePart3.getName());
            System.out.println(filePart3.getSize());
            System.out.println(filePart3.getContentType());
            is = filePart.getInputStream();
            is2 = filePart2.getInputStream();
            is3 = filePart3.getInputStream();
        }
         
        Connection conn = null; 
        String message = null;  
       
 
            String sql = "INSERT INTO sms_stddatabase values (?, ?, ?,?, ?, ?,?, ?, ?,?, ?, ?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, rollno);
            statement.setString(3, degree);
            statement.setString(4, dpt);
            statement.setString(5, joindate);
            statement.setString(6, dob);
            statement.setString(7, bloodgp);
            statement.setString(8, mobile);
            statement.setString(9, gender);
            statement.setString(10, address);
            statement.setString(11, email);
            
            if (is != null&&is2 != null&&is3 != null) {
      
                statement.setBlob(12, is);
                statement.setBlob(13, is2);
                statement.setBlob(14, is3);
            }
 
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
            }
	%>
	<h3><% out.println(message); %> </h3>
</body>
</html>