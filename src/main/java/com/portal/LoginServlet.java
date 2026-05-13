package com.portal;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

protected void doPost(HttpServletRequest request,
HttpServletResponse response)
throws ServletException, IOException {

String email = request.getParameter("email");
String password = request.getParameter("password");

try {

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/studyportal",
"root",
"Vyshu@213@@");

PreparedStatement ps = con.prepareStatement(
"select * from students where email=? and password=?");

ps.setString(1,email);
ps.setString(2,password);

ResultSet rs = ps.executeQuery();

if(rs.next())
{

// store user in session
HttpSession session = request.getSession();
session.setAttribute("username", email);

response.sendRedirect("dashboard.jsp");

}
else
{
response.getWriter().println("Invalid Login");
}

con.close();

} catch(Exception e) {
System.out.println(e);
}

}
}