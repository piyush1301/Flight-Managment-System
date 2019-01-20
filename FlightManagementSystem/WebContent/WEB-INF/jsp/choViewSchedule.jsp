<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>3'PN Projects</title>
<link rel="stylesheet" type="text/css" href="images/login.css">
<style>
body {
	padding: 60px;
	background-image: url("images/123.jpg");
	background-repeat: no-repeat;
}
</style>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
</head>
<body>
<a href="homepage2.html"><img src="images/home-icon-png.png" width="50" align=left height="50"></a>


<center>

		<div id="wrapper"> 

<form:form action="ShowbyidSchedule.html" method="post" class="login-form">
				<div class="header">
					<h1>View Schedule By ID</h1>
				</div>	<div class="footer">
				
	<input type="submit" value="BY ID" class="button"/>
</form:form>
<form:form action="ShowAllSchedule.html" method="post"> <br><br>

	<input type="submit" value="All Schedules" class="button" />
				</div>
			</form:form>
</body>
</html>
