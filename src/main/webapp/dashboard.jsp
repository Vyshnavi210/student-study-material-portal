<%@ page import="java.sql.*" %>
<%@ include file="header.jsp" %>

<html>

<head>

<meta charset="UTF-8">

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<style>

body{
background:linear-gradient(135deg,#667eea,#764ba2);
min-height:100vh;
font-family:Arial;
}

.hero{
text-align:center;
color:white;
padding:60px 20px;
}

.dashboard-cards{
margin-top:20px;
}

.card{
border:none;
border-radius:12px;
box-shadow:0 6px 20px rgba(0,0,0,0.15);
transition:0.3s;
}

.card:hover{
transform:translateY(-6px);
}

.card img{
width:60px;
margin-bottom:10px;
}

.btn-dark{
background:#2c3e50;
border:none;
}

.btn-dark:hover{
background:#1a252f;
}

</style>

</head>

<body>

<div class="container">

<!-- HERO SECTION -->

<div class="hero">

<h2>Student Study Material Sharing Portal</h2>

<p>Upload and share study materials with other students easily</p>

</div>

<%

Connection con=null;
Statement st=null;
ResultSet rs=null;

int total=0;

try{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/studyportal",
"root",
"Vyshu@213@@");

st=con.createStatement();

rs=st.executeQuery("select count(*) from materials");

if(rs.next()){
total=rs.getInt(1);
}

con.close();

}catch(Exception e){
out.println(e);
}

%>

<!-- DASHBOARD CARDS -->

<div class="row dashboard-cards text-center justify-content-center g-4">

<div class="col-md-3">

<div class="card p-4">

<img src="https://cdn-icons-png.flaticon.com/512/3135/3135755.png">

<h5>Total Materials</h5>

<h3><%=total%></h3>

</div>

</div>

<div class="col-md-3">

<div class="card p-4">

<img src="https://cdn-icons-png.flaticon.com/512/2991/2991108.png">

<h5>Upload Study Material</h5>

<a href="upload.jsp" class="btn btn-dark mt-2">Upload</a>

</div>

</div>

<div class="col-md-3">

<div class="card p-4">

<img src="https://cdn-icons-png.flaticon.com/512/3145/3145765.png">

<h5>View Study Materials</h5>

<a href="view.jsp" class="btn btn-dark mt-2">View</a>

</div>

</div>

</div>

</div>

</body>
</html>