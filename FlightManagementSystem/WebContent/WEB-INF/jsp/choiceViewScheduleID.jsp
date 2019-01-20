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
<script type="text/javascript">
function upper() {
	 
	  piy.scheduleID.value=piy.scheduleID.value.toUpperCase();
	
} 
function sendInfo1(value) {
	var url = "flightajax10.jsp?val=" + value;
	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	try {
		request.onreadystatechange = getInfo;
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}

	function getInfo() {
		if (request.readyState == 4) {
			var val = request.responseText;
			document.getElementById('amit7').innerHTML = val;
		}
	}
}

</script>
</head>
<body>
<a href="homepage2.html"><img src="images/home-icon-png.png" width="50" align=left height="50"></a>

<center>

		<div id="wrapper"> 
<form:form name="piy" method="POST" action="viewbyScheduleID.html" class="login-form">
				<div class="header">
					<h1>View Schedule By ID</h1>
				</div>
			 <div class="content">
			     <form:label path="scheduleID">Schedule ID:</form:label>
			    <form:input path="scheduleID" onkeyup="upper()" onblur="sendInfo1(this.value)" value="" class="input username"/>
			    	<div id="amit7" style="color: red"></div></div>
			<div class="footer">	    <input type="submit" value="View" class="button" /></div>

			</form:form>
	</center>
</body>
</html>
			