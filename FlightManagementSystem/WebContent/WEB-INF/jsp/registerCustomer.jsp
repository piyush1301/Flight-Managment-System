<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>3'PN Projects</title>
<style type="text/css">
<style type ="text/css">h3 {
	font-family: Calibri;
	font-size: 22pt;
	font-style: normal;
	font-weight: bold;
	color: SlateBlue;
	text-align: center;
	text-decoration: underline
}

table {
	font-family: Calibri;
	color: black;
	font-size: 11pt;
	font-style: normal;
	text-align:;
	border: 2px solid navy
}

table.inner {
	border: 0px
}
</style>
<script>
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
			document.getElementById('amit1').innerHTML = val;
			
		}
	}
}
function sendInfo2(value) {
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
			document.getElementById('amit2').innerHTML = val;
			
		}
	}
}function sendInfo3(value) {
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
			document.getElementById('amit3').innerHTML = val;
			
		}
	}
}function sendInfo4(value) {
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
			document.getElementById('amit4').innerHTML = val;
			
		}
	}
}function sendInfo5(value) {
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
			document.getElementById('amit5').innerHTML = val;
			
		}
	}
}function sendInfo6(value) {
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
			document.getElementById('amit6').innerHTML = val;
			
		}
	}
}function sendInfo7(value) {
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
}function sendInfo8(value) {
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
			document.getElementById('amit8').innerHTML = val;
			
		}
	}
}
function sendInfo9(value) {
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
			document.getElementById('amit9').innerHTML = val;
			
		}
	}
}function sendInfo10(value) {
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
			document.getElementById('amit10').innerHTML = val;
			
		}
	}
}
</script>


<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
	<script>
		$(document).ready(function() {
			$("#datepicker").datepicker({ maxDate: 0});
		});
	
		
		function date1() {
			var da=document.getElementById('datepicker').value;
	if((da=="")||da==null)
		{
		alert("Please Select date of birth");
		return false;
		}
	else
		return true;
		}
		
		
		</script>		

</head>

<body>
	<center>
	<a href="homep.html"><img src="images/home-icon-png.png" width="50" align=left height="50"></a>
	
	<h3> REGISTRATION FORM </h3>
	<form:form action="reg.html" method="POST" onsubmit="return date1()">
	<table align="center" cellpadding="10">
		
		<!----- First Name ---------------------------------------------------------->
		<tr>
			<td>FIRST NAME</td>
			<td><form:input path="firstName" class="long" onblur="sendInfo1(this.value)"  value="" placeholder="First Name" /></td>
	
				<td><form:errors path="firstName"/><td><div id="amit1" style="color: red"></div></td></td>
	
	
	
		</tr>

		<!----- Last Name ---------------------------------------------------------->
		<tr>
			<td>LAST NAME</td>
			<td><form:input path="lastName" class="long" onblur="sendInfo2(this.value)"  value="" placeholder="Last Name" /></td>
			<td><form:errors path="lastName"/><td><div id="amit2" style="color: red"></div></td></td>
			
		</tr>

		<!----- Date Of Birth -------------------------------------------------------->
		<tr>
			<td>DATE OF BIRTH</td>
			<td><form:input path="dateOfBirth" id="datepicker"    /></td>
			<td><form:errors
					path="dateOfBirth" /></td>

				
		</tr>


		<!----- Email Id ---------------------------------------------------------->
		<tr>
			<td>EMAIL ID</td>
			<td><form:input path="emailID" class="input username" onblur="sendInfo3(this.value)"  value=""  placeholder="abc@xyz.com"  /></td>
			<td><form:errors path="emailID" /><td><div id="amit3" style="color: red"></div></td></td>
		</tr>

		<!----- Mobile Number ---------------------------------------------------------->
		<tr>
			<td>MOBILE NUMBER</td>
			<td><form:input path="mobileNo" onblur="sendInfo4(this.value)"  value="" placeholder="91**********"  /></td>
			<td><form:errors path="mobileNo" /><td><div id="amit4" style="color: red"       ></div></td></td>
		</tr>

		<!----- Gender ----------------------------------------------------------->
		<tr>
			<td>GENDER</td>
			<td><form:radiobutton path="gender" value="male" label="Male" />
				<form:radiobutton path="gender" value="female" label="Female" /></td>
							<td><form:errors path="gender"  /></td>
		</tr>

		<!----- Street ---------------------------------------------------------->
		<tr>
			<td>Street</td>
			<td><form:input path="street" class="long" onblur="sendInfo5(this.value)"  value="" /></td>
			<td><form:errors path="street"  /><td><div id="amit5" style="color: red"></div></td></td>
		</tr>

		<!----- Location ---------------------------------------------------------->
		<tr>
			<td>Location:</td>
			<td><form:input path="location" class="long" onblur="sendInfo6(this.value)"  value="" /></td>
			<td><form:errors path="location"  /><td><div id="amit6" style="color: red"></div></td></td>
		</tr>

		<!----- City ---------------------------------------------------------->
		<tr>
			<td>City:</td>
			<td><form:input path="city" class="long" onblur="sendInfo7(this.value)"  value="" /></td>
			<td><form:errors path="city"  /><td><div id="amit7" style="color: red"></div></td></td>
		</tr>

		<!----- State ---------------------------------------------------------->
		<tr>
			<td>STATE</td>
			<td><form:input path="state" class="long" onblur="sendInfo8(this.value)"  value="" /></td>
			<td><form:errors path="state"  /><td><div id="amit8" style="color: red"></div></td></td>
		</tr>

		<!----- Pin Code ---------------------------------------------------------->
		<tr>
			<td>PIN CODE</td>
			<td><form:input path="pincode" class="long" onblur="sendInfo9(this.value)" placeholder="******"  value=""/></td>
			<td><form:errors path="pincode"  /><td><div id="amit9" style="color: red"      ></div></td></td>
		</tr>

	<tr>
			<td>PASSWORD</td>
			<td><form:password path="password" class="long" onblur="sendInfo10(this.value)"  value=""/></td>
			<td><form:errors path="password"  /><td><div id="amit10" style="color: red"    ></div></td></td>
		</tr>

		<!----- Submit and Reset ------------------------------------------------->
		<tr>
			<td colspan="2" align="center">
				<td colspan="2">
				<input type="submit" value="Submit"  />
				
				
				</td>
			</td>
		</tr>
		</center>
	</table>

</form:form>
</body>
</html>