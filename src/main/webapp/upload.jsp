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

.form-box{
background:white;
padding:30px;
border-radius:12px;
width:420px;
margin:auto;
margin-top:80px;
box-shadow:0 6px 20px rgba(0,0,0,0.2);
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

<div class="form-box">

<h3 class="mb-3 text-center">Upload Study Material</h3>

<form action="UploadServlet" method="post" enctype="multipart/form-data">

<div class="mb-3">
<label>Subject</label>
<input type="text" name="subject" class="form-control" required>
</div>

<div class="mb-3">
<label>Title</label>
<input type="text" name="title" class="form-control" required>
</div>

<div class="mb-3">
<label>Upload File</label>
<input type="file" name="file" class="form-control"
accept=".pdf,.jpg,.png,.jpeg,.doc,.docx,.txt">
</div>

<center><b>OR</b></center>

<div class="mb-3">
<label>Paste Material Link</label>
<input type="text" name="link" class="form-control"
placeholder="https://example.com">
</div>

<button class="btn btn-dark w-100">Upload</button>

</form>

</div>

</body>
</html>