package com.portal;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {

protected void doGet(HttpServletRequest request,
HttpServletResponse response)
throws ServletException, IOException {

String id=request.getParameter("id");

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/studyportal",
"root",
"Vyshu@213@@");

PreparedStatement ps=con.prepareStatement(
"delete from materials where id=?");

ps.setInt(1,Integer.parseInt(id));

ps.executeUpdate();

response.sendRedirect("view.jsp");

con.close();

}catch(Exception e){
System.out.println(e);
}

}
}