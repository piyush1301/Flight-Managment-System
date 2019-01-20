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
<link rel="stylesheet" type="text/css" href="images/menu2.css">
<script type="text/javascript">

function cho() {
	
	var src = document.getElementById('source').value;
	var dest =  document.getElementById('destination').value;
	if (src == dest) 
	{
		alert("Destination And Source Cannot Be Same");
		return false;
	} 
	else
		return true;
	
}





</script>
<style>
body {
	padding: 60px;
	background-image: url("images/show.jpg");
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<center>

		<div id="menu">
			<ul>
				<li><a href="homepage.html">Home</a></li>

			</ul>
		</div>
		<div id="wrapper">

			<center>
				<br> <br>
				<form:form method="GET" name="piy" action="viewSchedules.html"
					class="login-form" onsubmit="return cho()">
					<div class="header">
						<h1>Search By Source and Destination</h1>
					</div>
					<div class="content">


						<form:label path="route.source">Source:</form:label>
						<form:select path="route.source" class="input username" id="source">
							<form:option value="Delhi" label="Delhi" />
							<form:option value="Bengaluru" label="Bengaluru" />
							<form:option value="Jodhpur" label="Jodhpur" />
							<form:option value="Mumbai" label="Mumbai" />
							<form:option value="Rohtak" label="Rohtak" />
							<form:option value="Chandigarh" label="Chandigarh" />
							<form:option value="Bidar" label="Bidar" />
							<form:option value="Hyderabad" label="Hyderabad" />
						</form:select>
						<form:label path="route.destination">Destination:</form:label>
						<form:select path="route.destination" class="input username" id="destination" >
							<form:option value="Delhi" label="Delhi" />
							<form:option value="Bengaluru" label="Bengaluru" />
							<form:option value="Jodhpur" label="Jodhpur" />
							<form:option value="Mumbai" label="Mumbai" />
							<form:option value="Rohtak" label="Rohtak" />
							<form:option value="Chandigarh" label="Chandigarh" />
							<form:option value="Bidar" label="Bidar" />
							<form:option value="Hyderabad" label="Hyderabad" />
						</form:select>
					</div>

					<div class="footer">
						<input type="submit" value="   View   " class="button" />
					</div>

				</form:form>
			</center>
		</div>
</body>
</html>