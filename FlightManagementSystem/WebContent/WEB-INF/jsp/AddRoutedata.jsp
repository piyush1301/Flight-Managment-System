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
	function sendInfo2(value) {
		var url = "dec.jsp?val=" + value;
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

	function sendInfo1(value) {
		var url = "dec.jsp?val=" + value;
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
				document.getElementById('amit51').innerHTML = val;
			}
		}
	}

	function sendInfo67(value, hn) {
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
				document.getElementById('amit61').innerHTML = val;
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
	function isNumber(evt) {
	    evt = (evt) ? evt : window.event;
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
	    alert("Please enter digits only..");
	    	return false;
	    }
	    return true;
	}
		
		
      function isNumberKey(evt)
      {
         var charCode = (evt.which) ? evt.which : evt.keyCode;
         if (charCode != 46 && charCode > 31 
           && (charCode < 48 || charCode > 57))
            
        	 {
        	 alert("Please dont  enter alphabets or special characters.Only decimal and digits are valid ");
        	 
        	 return false;
        	 }
         return true;
      }
	function cho() {

		
		src = piy.source.value;
		dest = piy.destination.value;
		if (src == dest) 
		{
			alert("Destination And Source Cannot Be Same");
			return false;
		} 
		
		if (piy.distance.value < 0) 
		{
			alert("Distance Canot Be Less Then Zero");
			return false;
		} 
		else if (piy.distance.value ==0) 
		{
			alert("Distance Canot Be  Zero");
			return false;
		}
		
		
		else if (piy.distance.value > 4000) 
		{
			alert("Distance Canot Be More then 4000");
			return false;
		} 
		
		
		
		
		if (piy.fare.value <0) 
		{
			alert("fare Canot Be Less Then Zero");
			return false;
		}
		else if (piy.fare.value ==0) 
		{
			alert("fare Canot Be  Zero");
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


			<form:form onsubmit="return cho()" name="piy" method="GET"
				action="addroutetodb.html" class="login-form">
				<div class="header">
					<h1>Add a Route</h1>
				</div>
				<form:label path="source">
					<b>Source:</b>
				</form:label>
				<div class="content">

					<form:select path="source" id="source" class="input username">
						<form:option value="Delhi" label="Delhi" />
						<form:option value="Bengaluru" label="Bengaluru" />
						<form:option value="Jodhpur" label="Jodhpur" />
						<form:option value="Mumbai" label="Mumbai" />
						<form:option value="Rohtak" label="Rohtak" />
						<form:option value="Chandigarh" label="Chandigarh" />
						<form:option value="Bidar" label="Bidar" />
						<form:option value="Hyderabad" label="Hyderabad" />
					</form:select>
					<form:label path="destination">
						<b>Destination:</b>
					</form:label>
					<td><form:select path="destination" id="dest"
							onblur="sendInfo3(this.value,source.value)"
							class="input username">
							<form:option value="Bengaluru" label="Bengaluru" />
							<form:option value="Delhi" label="Delhi" />
							<form:option value="Jodhpur" label="Jodhpur" />
							<form:option value="Mumbai" label="Mumbai" />
							<form:option value="Rohtak" label="Rohtak" />
							<form:option value="Chandigarh" label="Chandigarh" />
							<form:option value="Bidar" label="Bidar" />
							<form:option value="Hyderabad" label="Hyderabad" />
						</form:select>
						<div id="amit6" style="color: red"></div> <form:label
							path="distance">
							<b>Distance(in miles):</b>
						</form:label> <form:input path="distance" value=""
							onblur="sendInfo2(this.value)" class="input username"   onkeypress="return isNumber(event)"  />
						<div id="amit5" style="color: red"></div> <form:errors
							path="distance"></form:errors> <form:label path="fare">
							<b>Fare(cost per mile):</b>
						</form:label> <form:input path="fare" value="" onblur="sendInfo1(this.value)"
							class="input username" onkeypress="return isNumberKey(event)"  />
						<div id="amit51" style="color: red"></div> <form:errors
							path="fare" />
				</div>
				<div class="footer">
					<input type="submit" value="ADD ROUTE" class="button" />
				</div>
			</form:form>
</body>
</html>