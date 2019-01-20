<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>3'PN Projects</title>
<link rel="stylesheet" type="text/css" href="images/login.css"><link rel ="stylesheet" type="text/css" href = "images/menu2.css">
	
<style>
body {
	background-image: url("images/show.jpg");
	background-repeat: no-repeat;
}

{
margin
:
 
0;
}
html, body {
	height: 100%;
}

.wrapper {
	min-height: 100%;
	height: auto !important;
	height: 100%;
	margin: 0 auto -4em;
}

</style>
</head>
<body>
	<h2 align="center">${data}</h2>
	<center>
<div id="menu">
<ul>
<li><a href="homep.html">Home</a></li>
<li><a href="aboutUs.html">About Us</a></li>
<li><a href="contactus.html">Contact Us</a></li>
</ul>
</div>
		<div id="wrapper">
			<form:form method="GET" action="logout.html" class="login-form">
				<div class="header">
					<h1>Login Form</h1>
				</div>
				<div class="content">
				
				<div class="footer">
					<input type="submit" value="Logout" class="button" />

					<div class="sd" style="color: red">${retVal}</div>
					
			</form:form>
		</div>


		</form>



		</div>
	</center>
</body>
</html>