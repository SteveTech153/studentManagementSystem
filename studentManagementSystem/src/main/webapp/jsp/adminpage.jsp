 <%@page import = "com.studentManagementSystem.AdminLogin" %>
 <%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Home</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}\css\adminstyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	<%! Connection con;
		Statement stmt;
		ResultSet rs;
		static String uname1,pass,email;
		%>
	<%  Class.forName("com.mysql.jdbc.Driver");
	uname1=request.getParameter("uname");
	session.setAttribute("uname",uname1);
    email=request.getParameter("email");
    pass=request.getParameter("pass");
    Connection con= null;
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo_schema1","root","Steve07@mysql");
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("select * from sms_adminlogin");
    boolean flag1 = false;
    while(rs.next()) {
    	if(rs.getString("username").compareTo(uname1)==0) {
    		flag1=true;
    		break;
    	}
    	
    }
    if(!flag1)
    	out.println("Invalid username");
    else {
        	boolean flag3 = false;
        	ResultSet rs2 = stmt.executeQuery("select * from sms_adminlogin");
        		while(rs2.next()) {
            	if(rs2.getString("password").compareTo(pass)==0) {
            		flag3=true;
            		break;
            		
            	}
        
            }
        	if(!flag3)
            	out.println("Invalid Password");
        	else {
        			
        		 
			}
        } %>
    <div class="container">
        <div class="navigation">
          <div class="menu-toggle"></div>
          <ul class="list">
            <li class="list-item active" style="--color:#f44336"><a href="Adminhome.jsp">
              <span class="icon">
                <ion-icon name="home-outline"></ion-icon>
              </span>
              <span class="text">Home</span>
              </a></li>
            <li class="list-item" style="--color:#ff6801"><a href="Adminadd.jsp">
              <span class="icon">
                <ion-icon name="person-add"></ion-icon>
            </span>
              <span class="text">Add Students</span>
              </a></li>
            <li class="list-item" style="--color:#0fc70f"><a href="Adminview.jsp">
              <span class="icon">
                <ion-icon name="eye"></ion-icon>
            </span>
              <span class="text">View Students</span>
              </a></li>
            <li class="list-item" style="--color:#2196f3"><a href="#">
              <span class="icon">
                <i class="fa fa-pencil " aria-hidden="true"></i>
            </span>
              <span class="text">Update Student</span>
              </a></li>
          </ul>
        </div>
        <div class="desc">
            <h2>Welcome <span style="color:#f44336;"></span>to the Admin Side</h2>
            
            <p><code><em>User name:</em></code><span style="color:#f44336;">&#9;<%=uname1 %></span>, </p>
            <p><code><em>User Role:</em></code><span style="color:#f44336;">&#9;Teacher</span> </p>
          </div>
      </div>
      
      <!-- jakarta.servlet.RequestDispatcher requestDispatcher = request.getRequestDispatcher("adminpage.jsp");
                 requestDispatcher.forward(request, response);
                  -->


<script src="script/admin.js"></script>
<script>$(function(){
  $("a").click(function(evt){
      var link = $(this).attr("href");
      setTimeout(function() {
          window.location.href = link;
      }, 15000);
  });
});</script>
    </body>

</html>