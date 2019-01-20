<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>3'PN Projects</title>
<link rel="stylesheet" type="text/css" href="images/login.css">
<link rel="stylesheet" type="text/css" href="images/menu2.css">


<style>
body {
	background-image: url("images/show.jpg");
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
		$("#datepicker").datepicker({
			minDate : 0
		});
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
	function sendInfo3(value, hn) {
		var url = "flightajax3.jsp?dest=" + value + "&src=" + hn;
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
	function sendInfo4(value) {
		var url = "flightajax4.jsp?val=" + value;
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
	function view() {

		var ns = f1.noOfSeats.value;
		var fare = f1.totalFare.value;
		var jDate = f1.journeyDate.value;
		var rType = f1.reservationType.value;

		if (jDate == "") {
			alert("Please Select Journey Date");
			return false;
		}

		if (ns % 1 != 0) {
			alert("No of seats cannot be In Decimals");
			return false;
		}
		if (ns == 0  || rType == "") {
			if (ns == 0) {
				alert("No of seats cant be 0");
				return false;
			} else if (rType == "") {
				alert("Please select reservation type");
				return false;
			} 
		}

		else
			return true;
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
</script>

</head>
<body>

	<center>
		<div id="menu">
			<ul>
				<li><a href="homepage.html">Home</a></li>

			</ul>
		</div>
		<div id="wrapper">

			<form:form method="POST" action="reservationtype.html"
				onsubmit="return view()" name="f1" class="login-form">
				<div class="header">
					<h1>Book your Ticket</h1>
				</div>
				<div class="content">
					<form:label path="bookingDate">BookingDate:</form:label>



					<%
						Date d = new Date();
							SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
							String s = sdf.format(d);
					%>







					<form:input path="bookingDate" value="<%=s%>"
						class="input username" readonly="true" />
					JourneyDate:
					<form:input path="journeyDate" id="datepicker" readonly="true"
						class="input username" />


					<form:label path="noOfSeats">No. Of Seats:</form:label>
					<form:input path="noOfSeats" onblur="sendInfo2(this.value)"
						class="input username" value="" onkeypress="return isNumber(event)" />
					<div id="amit5" style="color: red"></div>

					<form:label path="reservationType" onblur="sendInfo4(this.value)">Reservation Type:</form:label>
					<br> <br>
					<form:radiobutton path="reservationType" value="Economy"
						label="Economy" />
					&nbsp &nbsp &nbsp &nbsp
					<form:radiobutton path="reservationType" value="Normal"
						label="Normal" />
					<div id="amit7" style="color: red"></div>

					<div class="footer">
						<input type="submit" value="Calculate Fare" class="button" />

					</div>
					<form:input path="totalFare" value="${fare}" class="input username"
						readonly="true" />
			</form:form>
			<form:form method="POST" action="paymentDetails.html">
				<div class="footer">

					<input type="submit" value="Confirm Booking" class="button" />
				</div>

			</form:form>
</body>
</html>