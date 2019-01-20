<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>3'PN Projects</title>

<style>
body {
	padding: 60px;
	background-image: url("images/123.jpg");
	background-repeat: no-repeat;
}
</style>
<script type="text/javascript">
function cho() {
	
	var src = document.getElementById('s').value;
	var dest =  document.getElementById('d').value;
	if (src == dest) 
	{
		alert("Destination And Source Cannot Be Same");
		return false;
	} 
	else
		return true;
	
}
</script>

</head>
<body>
				
			<a href="homepage.html"><img src="images/home-icon-png.png" width="50" align=left height="50"></a>
		
		<div class="header">
					<h1><center>Search Schedules by source and destination</h1>
				</div>		
<div class="content">
<center>
<br>
<br>
<form:form method="POST" action="viewbyScheduleIDcus.html" onsubmit="return cho()">
		<table border=2 align=center>
				<tr>
					<td><form:label path="route.source">Source:</form:label></td>
					<td><form:select path="route.source" id="s">
							<form:option value="Delhi" label="Delhi" />
							<form:option value="Bengaluru" label="Bengaluru" />
							<form:option value="Jodhpur" label="Jodhpur" />
							<form:option value="Mumbai" label="Mumbai" />
							<form:option value="Rohtak" label="Rohtak" />
							<form:option value="Chandigarh" label="Chandigarh" />
							<form:option value="Bidar" label="Bidar" />
							<form:option value="Hyderabad" label="Hyderabad" />
						</form:select></td>
				</tr>
				<tr>
					<td><form:label path="route.destination">Destination:</form:label></td>
					<td><form:select path="route.destination" id="d">
							<form:option value="Delhi" label="Delhi" />
							<form:option value="Bengaluru" label="Bengaluru" />
							<form:option value="Jodhpur" label="Jodhpur" />
							<form:option value="Mumbai" label="Mumbai" />
							<form:option value="Rohtak" label="Rohtak" />
							<form:option value="Chandigarh" label="Chandigarh" />
							<form:option value="Bidar" label="Bidar" />
							<form:option value="Hyderabad" label="Hyderabad" />
						</form:select></td>
				</tr>
				<tr>
					<td colspan="2" align=center><input type="submit" value="   View   " /></td>
				</tr>
			</table>
		</form:form>
	</center>
	</div>
</body>
</html>