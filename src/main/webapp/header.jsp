<%
String username = (String) session.getAttribute("username");

if(username == null){
username = "Guest";
}
%>

<link rel="stylesheet"
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

<div class="container">

<a class="navbar-brand" href="dashboard.jsp">
Student Portal
</a>

<ul class="navbar-nav ms-auto">

<li class="nav-item">
<a class="nav-link" href="dashboard.jsp">Dashboard</a>
</li>

<li class="nav-item">
<a class="nav-link" href="upload.jsp">Upload Material</a>
</li>

<li class="nav-item">
<a class="nav-link" href="view.jsp">View Materials</a>
</li>

<li class="nav-item">
<span class="nav-link text-info">
Welcome <%=username%>
</span>
</li>

<li class="nav-item">
<a class="nav-link text-danger" href="login.html">Logout</a>
</li>

</ul>

</div>

</nav>