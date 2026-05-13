package com.portal;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/UploadServlet")
@MultipartConfig
public class UploadServlet extends HttpServlet {

protected void doPost(HttpServletRequest request,
HttpServletResponse response)
throws ServletException, IOException {

String subject=request.getParameter("subject");
String title=request.getParameter("title");
String link=request.getParameter("link");

Part filePart=request.getPart("file");
String fileName=filePart.getSubmittedFileName();

String uploadPath=getServletContext().getRealPath("") + File.separator + "uploads";

File uploadDir=new File(uploadPath);
if(!uploadDir.exists()) uploadDir.mkdir();

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/studyportal",
"root",
"Vyshu@213@@");

PreparedStatement ps=con.prepareStatement(
"insert into materials(subject,title,link) values(?,?,?)");

if(fileName!=null && fileName.length()>0){

filePart.write(uploadPath + File.separator + fileName);

ps.setString(1,subject);
ps.setString(2,title);
ps.setString(3,"uploads/" + fileName);

ps.executeUpdate();

}

else if(link!=null && link.length()>0){

ps.setString(1,subject);
ps.setString(2,title);
ps.setString(3,link);

ps.executeUpdate();

}

response.sendRedirect("view.jsp");

con.close();

}catch(Exception e){
System.out.println(e);
}

}
}