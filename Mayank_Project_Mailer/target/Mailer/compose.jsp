<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="Login_Css.css">

<style>
.img-fluid {
	height: 850px;
}
</style>







</head>
<%-- 
<%
if(session.getAttribute("email")==null)
{
	response.sendRedirect("login.jsp");
}

%>
 --%>

<body class="bg-img">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="welcome.jsp">PubliK</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="about.jsp">About</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="compose.jsp">Compose</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="draft.jsp">Draft</a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/Logout">Logout</a></li>


			</ul>
		</div>
	</nav>

	<div class="row">
		<div class="col-md-8 offset-md-2">
			<form action="<%=request.getContextPath()%>/compose" method="post">
				<br>
				<div class="form-group">
					<label for="from">TO :</label> <input type="email"
						class="form-control" id="to" placeholder="to" name="to" required>
				</div>
				<div class="form-group">
					<label for="from">FROM :</label> <input type="email"
						class="form-control" id="from" placeholder="from" name="from" required>
				</div>
				

				<div class="form-group">
					<label for="cc">CC :</label> <input type="email"
						class="form-control" id="cc" placeholder="cc" name="cc">
				</div>

				<div class="form-group">
					<label for="bcc">BCC :</label> <input type="email"
						class="form-control" id="username" placeholder="bcc" name="bcc">
				</div>


				<div class="form-group">
					<label for="exampleFormControlTextarea1">Message</label>
					<textarea class="form-control" placeholder="message" name="message"></textarea>
				</div>


				<div class="row">
					<div class="col-md-8 offset-md-2">
<!-- 						<button type="submit" class="btn btn-primary col-4 ml-4  ">Draft</button>
 -->
						<button type="submit" class="btn btn-primary col-4 ml-4 ">Send</button>
					</div>
				</div>


			</form>

		</div>
	</div>






</body>
</html>