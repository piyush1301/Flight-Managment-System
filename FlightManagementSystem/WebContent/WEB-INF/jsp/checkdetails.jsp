<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</head>
<body><a href="homep.html"><img src="images/home-icon-png.png"
		width="50" align=left height="50"></a>
	<h3>${data}</h3>
	<form:form method="POST" action="changepassword.html"
		class="login-form">
		<div class="header">
			<h1>Enter ur details</h1>
		</div>

		<center>
			<div id="wrapper">
<div class="content">
				<form:label path="userID">User Id:</form:label>
				<form:input path="userID" class="input username"/>


				<form:label path="mobileNo">Mobile no.:</form:label>
				<form:input path="mobileNo" class="input username"/>



				<form:label path="emailID">Email ID:</form:label>
				<form:input path="emailID" class="input username"/>


				<div class="footer">
				<input type="submit" value="Submit" class="button" />
				</div></div></div>
	</form:form>
<div class="footer">
            <p>Copyright © 2013 Wipro Technologies. All rights reserved</p>
        </div>
</body>
</html>

