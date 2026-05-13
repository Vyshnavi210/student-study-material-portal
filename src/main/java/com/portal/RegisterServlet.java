package com.portal;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

protected void doPost(HttpServletRequest request,
HttpServletResponse response)
throws ServletException, IOException {

String name=request.getParameter("name");
String email=request.getParameter("email");
String password=request.getParameter("password");

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/studyportal",
"root",
"Vyshu@213@@");

PreparedStatement ps=con.prepareStatement(
"insert into students(name,email,password) values(?,?,?)");

ps.setString(1,name);
ps.setString(2,email);
ps.setString(3,password);

ps.executeUpdate();

response.getWriter().println("Registration Successful");

}catch(Exception e){
System.out.println(e);
}

}
}
