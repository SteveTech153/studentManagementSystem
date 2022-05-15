package com.studentManagementSystem;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminLogin extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	 String uname;
	 String email;
	 String pass;
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	try {
			func1(req, resp);
		} catch (ServletException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	try {
			func1(req, resp);
		} catch (ServletException | IOException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    void func1(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException,SQLException {
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
            boolean flag1 = false;
            while(rs.next()) {
            	if(rs.getString("username").compareTo(uname)==0) {
            		flag1=true;
            		break;
            	}
            	
            }
            if(!flag1)
            	out.println("Invalid username");
            else {
            	boolean flag2 = false;
//            	if(!rs.isFirst())
//            		rs.first();
            	ResultSet rs1 = stmt.executeQuery("select * from sms_adminlogin");
            	while(rs1.next()) {
                	if(rs1.getString("email").compareTo(email)==0) {
                		flag2=true;
                		break;
                	}
                
            	}
            	if(!flag2)
                	out.println("Invalid email");
                else {
                	boolean flag3 = false;
//            	if(!rs.isFirst())
//            		rs.first();
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
						out.println("login success !");
					}
                }
            }
            
            
            } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
	
}
