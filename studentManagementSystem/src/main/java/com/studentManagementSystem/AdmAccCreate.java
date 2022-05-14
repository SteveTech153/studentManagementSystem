package com.studentManagementSystem;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.cj.protocol.Resultset;

public class AdmAccCreate extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String uname;
    String email;
    String pass;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	func1(req,resp);
    }
    	@Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    		func1(req,resp);
        }
    	void func1(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    		uname=req.getParameter("uname");
            email=req.getParameter("email");
            pass=req.getParameter("pass");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con= null;
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo_schema1","root","Steve07@mysql");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("select * from sms_adminlogin");
                PrintWriter out = resp.getWriter();
                if(!rs.next()) {
                    PreparedStatement pst= con.prepareStatement("insert into sms_adminlogin(username,email,password) values(?,?,?)");
                    pst.setString(1,uname);
                    pst.setString(2,email);
                    pst.setString(3,pass);
                    if(pst.executeUpdate()>0)
                    	out.println("account created for admin successfully !");
                }else {
    				out.println("admin already exists!");
    			}
                } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
    	}
}
