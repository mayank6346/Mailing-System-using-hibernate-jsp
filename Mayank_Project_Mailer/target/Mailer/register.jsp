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
.color2 {
	background-color: #EBEBEB;
}
</style>
<style type="text/css">
/* COMPACT CAPTCHA */
.capbox {
	background-color: #BBBBBB;
	background-image: linear-gradient(#BBBBBB, #9E9E9E);
	border: #2A7D05 0px solid;
	border-width: 2px 2px 2px 20px;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	display: inline-block;
	padding: 5px 8px 5px 8px;
	border-radius: 4px 4px 4px 4px;
}

.capbox-inner {
	font: bold 12px arial, sans-serif;
	color: #000000;
	background-color: #E3E3E3;
	margin: 0px auto 0px auto;
	padding: 3px 10px 5px 10px;
	border-radius: 4px;
	display: inline-block;
	vertical-align: middle;
}

#CaptchaDiv {
	color: #000000;
	font: normal 25px Impact, Charcoal, arial, sans-serif;
	font-style: italic;
	text-align: center;
	vertical-align: middle;
	background-color: #FFFFFF;
	user-select: none;
	display: inline-block;
	padding: 3px 14px 3px 8px;
	margin-right: 4px;
	border-radius: 4px;
}

#CaptchaInput {
	border: #38B000 2px solid;
	margin: 3px 0px 1px 0px;
	width: 105px;
}
</style>



</head>


<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="home.jsp">PubliK</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">

				<li class="nav-item"><a class="nav-link" href="about.jsp">About</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="login.jsp">Login
				</a></li>
			</ul>
		</div>
	</nav>

	<div class=" bg-img">

		<div class="row justify-content-end mr-1  ">


			<div class="col-4 color2 mr-1 justify-content-center">


				<form action="<%=request.getContextPath()%>/register" method="post">
					<br>
					<div class="form-group">
						<label for="uname">First Name:</label> <input type="text"
							class="form-control" id="uname" placeholder="First Name"
							name="firstName" required>
					</div>

					<div class="form-group">
						<label for="uname">Last Name:</label> <input type="text"
							class="form-control" id="uname" placeholder="last Name"
							name="lastName" required>
					</div>

					<div class="form-group">
						<label for="uname">Email :</label> <input type="email"
							class="form-control" id="username" placeholder="Email"
							name="email" required>
					</div>

					<div class="form-group">
						<label for="uname">Password:</label> <input type="password"
							class="form-control" id="password" placeholder="Password"
							name="password" required>
					</div>





					<div class="capbox justify-content-center">

						<div class="justify-content-center ">

							<div id="CaptchaDiv"></div>

							<div class="capbox-inner">
								Type the number:<br> <input type="hidden" id="txtCaptcha">
								<input type="text" name="CaptchaInput" id="CaptchaInput"
									size="15"><br>

							</div>
						</div>
					</div>
						<button type="submit" class="btn btn-primary col-4 ml-5 ">Register</button>

						<br>
<br>
<br>


					<div class="row justify-content-center">
						<button type="submit" class="btn btn-primary col-4 "
							onclick="window.location.href='login.jsp'">Sign Up</button>

					</div>
					<br>
			</div>






			</form>

		</div>




	</div>




	</div>
	<script type="text/javascript">
		// Captcha Script

		function checkform(theform) {
			var why = "";

			if (theform.CaptchaInput.value == "") {
				why += "- Please Enter CAPTCHA Code.\n";
			}
			if (theform.CaptchaInput.value != "") {
				if (ValidCaptcha(theform.CaptchaInput.value) == false) {
					why += "- The CAPTCHA Code Does Not Match.\n";
				}
			}
			if (why != "") {
				alert(why);
				return false;
			}
		}

		var a = Math.ceil(Math.random() * 9) + '';
		var b = Math.ceil(Math.random() * 9) + '';
		var c = Math.ceil(Math.random() * 9) + '';
		var d = Math.ceil(Math.random() * 9) + '';
		var e = Math.ceil(Math.random() * 9) + '';

		var code = a + b + c + d + e;
		document.getElementById("txtCaptcha").value = code;
		document.getElementById("CaptchaDiv").innerHTML = code;

		// Validate input against the generated number
		function ValidCaptcha() {
			var str1 = removeSpaces(document.getElementById('txtCaptcha').value);
			var str2 = removeSpaces(document.getElementById('CaptchaInput').value);
			if (str1 == str2) {
				return true;
			} else {
				return false;
			}
		}

		// Remove the spaces from the entered and generated code
		function removeSpaces(string) {
			return string.split(' ').join('');
		}
	</script>


</body>
</html>