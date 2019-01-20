<%@page import="com.wipro.frs.bean.ScheduleBean"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script>
	$(document).ready(function() {
		$("#datepicker").datepicker();
	});
</script>

<script type="text/javascript">
	function sendInfo2(value) {
		var url = "flightajax2.jsp?val=" + value;
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
				document.getElementById('amit5').innerHTML = val;
			}
		}
	}

	function sendInfo3(value, v2) {
		var url = "flightres.jsp?val=" + value + "&val2=" + v2;
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
				document.getElementById('amit6').innerHTML = val;
			}
		}
	}

	function sendInfo1(value) {
		var url = "flightajax1.jsp?val=" + value;
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

	function upper() {
		f1.flightName.value = f1.flightName.value.toUpperCase();
	}
	function isNumber(evt) {
	    evt = (evt) ? evt : window.event;
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
	    alert("Please enter digits only..");
	    	return false;
	    }
	    return true;
	}
	function checking() {

		var sc = f1.seatingCapacity.value;
		var rc = f1.reservationCapacity.value;
	
		
		if((sc>'A'&& sc<'Z') || (sc>'a' && sc<'z') )
			{
				alert("Seating Capacity should Be number");
				return false;
			}
		if((rc>'A'&& rc<'Z') || (rc>'a' && rc<'z') )
		{
			alert("Reservation Capacity should  Be number");
			return false;
		}
		if(sc%1!=0)
			{
				alert("Seating Capacity Cannot Be In Decimal");
				return false;
			}
		else if(rc%1!=0)
		{
			alert("Reservationn Capacity Cannot Be In Decimal");
			return false;
		}
		else
			if (sc < 0) 
		{
			alert("Seating capacity cannot be negative");
			return false;
		} 		
		else if (sc > 1000) 
		{
			alert("Seating capacity cannot be more then 1000");
			return false;
		}	
		else if(sc==0)
		{
			alert("Seating capacity cannot be 0");
			return false;
		}
		if (rc < 0) 
		{
			alert("Reservation capacity cannot be negative");
			return false;
		} 
		else if (rc > 1000) 
		{

				alert("Rservation capacity cannot be more then 1000");
				return false;

		} 
		else if(rc==0)
		{
				alert("Reservation capacity cannot be 0");
				return false;
		}
		
				
		else 
		{
				return true;
		}		
	}
</script>

</head>
<body>
	<a href="homepage2.html"><img src="images/home-icon-png.png"
		width="50" align=left height="50"></a>
	<center>
		<div id="wrapper">

			<form:form  method="GET"
				action="addflighttodb.html" name="f1" class="login-form"   onsubmit="return checking()" >
${ERROR}


				<div class="header">
					<h1>Add a Flight</h1>
				</div>

				<form:label path="flightName">
					<b>Flight Name:</b>
				</form:label>
				<div class="content">
					<form:input path="flightName" 
						onkeyup="upper()" class="input username" />
					<div id="amit7" style="color: red"></div>
					<form:errors path="flightName"></form:errors>
					<br><form:label path="seatingCapacity">
						<b>Seating Capacity:</b>
					</form:label>
					<form:input path="seatingCapacity" value="0" class="input username"
						   onkeypress="return isNumber(event)"/>
					<div id="amit5" style="color: red"></div>
					<form:errors path="seatingCapacity"></form:errors>
					
					<br>
					<form:label path="reservationCapacity">
						<b>Reservation Capacity:</b>
					</form:label>
					
					<form:input path="reservationCapacity" value="0"
						class="input username" onkeypress="return isNumber(event)" />
					<div id="amit6" style="color: red"></div>
					<form:errors path="reservationCapacity"></form:errors>
				</div>
				<div class="footer">
					<input type="submit" value="Add Flight" class="button" />
				</div>

			</form:form>
	</center>
</body>
</html>