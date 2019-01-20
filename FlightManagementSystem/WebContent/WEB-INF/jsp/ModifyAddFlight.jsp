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
		var url = "flightres.jsp?val=" + value+"&val2="+v2;
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
	 
	  
	  f1.flightName.value=f1.flightName.value.toUpperCase();
	
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
		if (sc < 0) {
			alert("Seating capacity cannot be negative");
			return false;
		} else if (sc > 1000) {

			alert("Seating capacity cannot be more then 1000");
			return false;

		}
		else if(sc% 1 != 0)
		{

		alert("Seating capacity cannot be In Decimals");
		return false;
		}
		else if(sc==0){

			alert("Seating capacity cannot be 0");
			return false;

		}
		
			if (rc < 0) {
				alert("Reservation capacity cannot be negative");
				return false;
			} else if (rc > 1000) {

				alert("Rservation capacity cannot be more then 1000");
				return false;

			} 
			else if(rc==0){

				alert("Reservation capacity cannot be 0");
				return false;

			}	
			
			else if(rc% 1 != 0)
			{

			alert("Seating capacity cannot be In Decimals");
			return false;
			}

				else {
					return true;
				}

			

		
	}
  
  
  
  </script>
</head>
<body>
<a href="homepage2.html"><img src="images/home-icon-png.png" width="50" align=left height="50"></a>
<center>
		<div id="wrapper">
<form:form method="GET" action="Modifiedflight.html" onsubmit="return checking()" name="f1" class="login-form">
<div class="header">
					<h1>Edit Flight Detail's</h1>
				</div>
<div class="content">
	${ERROR}<br>
			        <form:label path="flightID"><b>Flight ID:</b></form:label>
			       <form:input path="flightID" value="${data.flightID}" readonly="true" class="input username" />
						        <form:label path="flightName"><b>Flight Name:</b></form:label>
			
			   <form:input path="flightName" onblur="sendInfo1(this.value)"
						onkeyup="upper()" class="input username" 
					value="${data.flightName}"	/>
					<div id="amit7" style="color: red"></div>
					<form:errors path="flightName"></form:errors>
											        <form:label path="seatingCapacity"><b>Seating Capacity:</b></form:label>
					
			   <form:input path="seatingCapacity" value="${data.seatingCapacity}" class="input username"
						onblur="sendInfo2(this.value)"  onkeypress="return isNumber(event)" />
					<div id="amit5" style="color: red"></div>
					
					<form:errors path="seatingCapacity"></form:errors>
			   <form:label path="reservationCapacity">
						<b>Reservation Capacity:</b>
					</form:label>
					<form:input path="reservationCapacity" value="${data.reservationCapacity}"
						class="input username" onkeypress="return isNumber(event)"  />
					<div id="amit6" style="color: red"></div>
					<form:errors path="reservationCapacity"></form:errors>
				</div>
			    <div class="footer">
					<input type="submit" value="Update Flight" class="button" />
				</div>

			</form:form>
	</body>
</html>