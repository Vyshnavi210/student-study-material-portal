<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%@ include file="header.jsp" %>

<html ng-app="studyApp">

<head>

<meta charset="UTF-8">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>

<style>

body{
background:linear-gradient(135deg,#667eea,#764ba2);
min-height:100vh;
font-family:Arial;
}

.view-box{
background:white;
padding:30px;
border-radius:12px;
box-shadow:0 6px 20px rgba(0,0,0,0.2);
margin-top:40px;
}

th{
background:#34495e;
color:white;
}

</style>

</head>

<body class="container" ng-controller="searchController">

<div class="view-box">

<h2>Available Study Materials</h2>

<%
String msg=request.getParameter("msg");
if("success".equals(msg)){
%>

<div class="alert alert-success">
Material uploaded successfully!
</div>

<%
}
%>

<input type="text"
class="form-control w-25"
placeholder="Search materials..."
ng-model="searchText">

<br>

<table class="table table-bordered table-hover">

<tr>
<th>Subject</th>
<th>Title</th>
<th>Material</th>
<th>Action</th>
<th>Date</th>
</tr>

<%

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

try{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/studyportal",
"root",
"Vyshu@213@@");

stmt=con.createStatement();

rs=stmt.executeQuery("select * from materials");

while(rs.next())
{

String subject=rs.getString("subject");
String title=rs.getString("title");
String link=rs.getString("link");
String date=rs.getString("upload_date");
int id=rs.getInt("id");

%>

<tr ng-show="'<%=subject%> <%=title%>'.toLowerCase().includes(searchText.toLowerCase())">

<td><%=subject%></td>
<td><%=title%></td>

<td>

<%

if(link.endsWith(".pdf")){
%>

📄 <a href="<%=link%>" target="_blank">View PDF</a>

<a href="<%=link%>" download>
<button class="btn btn-sm btn-dark">Download</button>
</a>

<%
}
else if(link.endsWith(".png") || link.endsWith(".jpg") || link.endsWith(".jpeg")){
%>

🖼 <a href="<%=link%>" target="_blank">View Image</a>

<br>

<img src="<%=link%>" width="120">

<a href="<%=link%>" download>
<button class="btn btn-sm btn-dark">Download</button>
</a>

<%
}
else if(link.startsWith("http")){
%>

🌐 <a href="<%=link%>" target="_blank">Open Website</a>

<%
}
else{
%>

📁 <a href="<%=link%>" target="_blank">Open File</a>

<a href="<%=link%>" download>
<button class="btn btn-sm btn-dark">Download</button>
</a>

<%
}
%>

</td>

<td>

<a href="DeleteServlet?id=<%=id%>">
<button class="btn btn-danger btn-sm">Delete</button>
</a>

</td>

<td><%=date%></td>

</tr>

<%

}

con.close();

}catch(Exception e){

out.println(e);

}

%>

</table>

</div>

<script>

var app = angular.module("studyApp", []);

app.controller("searchController", function($scope){
$scope.searchText="";
});

</script>

</body>
</html>