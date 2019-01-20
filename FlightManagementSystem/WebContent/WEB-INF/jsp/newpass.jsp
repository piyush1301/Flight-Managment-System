<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="images/login.css">

<style>
body {
	padding: 60px;
	background-image: url("images/123.jpg");
	background-repeat: no-repeat;
}
</style>
<script>
	function checkPassword() {
		if (document.getElementById('oldpassword').value == document
				.getElementById('matchin').value)

		{

			if (document.getElementById('password').value == document
					.getElementById('confirm_password').value) {
				document.getElementById('submit').disabled = false;
			} else {
				window.alert("Password and confirm password doesnt match");
				document.getElementById('submit').disabled = true;

			}
		} else {
			alert("Incorrect Old Password");

			document.getElementById('submit').disabled = false;

		}
	}
</script>
</head>
<body>
	<center>
		<a href="homepage.html"><img src="images/home-icon-png.png"
			width="50" align=left height="50"></a>
		<div id="wrapper">


			<form:form method="POST" action="newpassword.html" class="login-form">
				<div class="header">
					<h1>Change Your Password</h1>
					<h3>${data}</h3>

				</div>
				<div class="content">
					<input type="hidden" id="matchin" class="input username"
						value=${password } /><br> Enter Your Old Password:<br> <input
						type="password" name="word" id="oldpassword"
						class="input username" /><br> <br> Enter Your New
					Password:<br> <input type="password" name="password"
						id="password" class="input username" /><br> <br>
					Confirm your New Password:<br> <input type="password"
						name="confirm_password" id="confirm_password"
						onblur='checkPassword()' class="input username" />
				</div>
				<div class="footer">
					<input type="submit" name="submit" value="Submit" class="button" />
				</div>



			</form:form>
</body>
</html>