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
</head>
<body>

<a href="homepage2.html"><img src="images/home-icon-png.png" width="50" align=left height="50"></a>
<center>



		<div id="wrapper">  
<form:form action="viewroutebyid.html" method="GET" class="login-form">
				<div class="header">
					<h1>View Routes</h1>
				</div>
				<div class="footer">
	
	<input type="submit" value="View By RouteID" class="button"/>
</form:form>
<form:form action="viewall.html" method="GET">			<br>

	<input type="submit" value="View All Routes" class="button" />
				
			</form:form></div>
			
</body>
</html>
