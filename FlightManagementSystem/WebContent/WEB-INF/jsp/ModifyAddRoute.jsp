<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>3'PN Projects</title><script type="text/javascript">
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
<body >
<a href="homepage2.html"><img src="images/home-icon-png.png" width="50" align=left height="50"></a>
<h2>${value}</h2>
<center>
<h2>Modify Route</h2>
		<form:form name="piy" onsubmit="return cho()" method="POST" action="ModifiedRoute.html">
	   		<table align=center>
			    <tr>
			        <td><form:label path="routeID">Route ID:</form:label></td>
			        <td><form:input path="routeID" value="${data.routeID}" readonly="true"/></td>
			        
			    </tr>
			      
			    <tr>
			        <td><form:label path="source">Source:</form:label></td>
			       <td><form:select path="source" id="source">
			   	<form:option value="Delhi" label="Delhi" />
					<form:option value="Bengaluru" label="Bengaluru" />
					<form:option value="Jodhpur" label="Jodhpur" />
					<form:option value="Mumbai" label="Mumbai" />
					<form:option value="Rohtak" label="Rohtak" />
					<form:option value="Chandigarh" label="Chandigarh" />
					<form:option value="Bidar" label="Bidar" />
					<form:option value="Hyderabad" label="Hyderabad" />
			    </form:select>
			    </td>
			        
			    </tr>
			    <tr>
			    <td><form:label path="destination">Destination:</form:label></td>
			    <td><form:select path="destination" id="dest"
						onblur="sendInfo3(this.value,source.value)">
			   <form:option value="Bengaluru" label="Bengaluru" />
					<form:option value="Delhi" label="Delhi" />
					<form:option value="Jodhpur" label="Jodhpur" />
					<form:option value="Mumbai" label="Mumbai" />
					<form:option value="Rohtak" label="Rohtak" />
					<form:option value="Chandigarh" label="Chandigarh" />
					<form:option value="Bidar" label="Bidar" />
					<form:option value="Hyderabad" label="Hyderabad" />
			    </form:select>
			    </td>
							<td><div id="amit6" style="color: red"></div></td>
			    </tr>
			    
			       <tr>
			        <td><form:label path="distance">Distance(in miles):</form:label></td>
			        <td><form:input path="distance" value="${data.distance}" onblur="sendInfo2(this.value)" onkeypress="return isNumber(event)"        /></td>
				<td><div id="amit5" style="color: red"></div></td>
				<td><form:errors path="distance"></form:errors></td>
			    </tr>
			      
			    
			    <tr>
			        <td><form:label path="fare">Fare(cost per mile):</form:label></td>
			        <td><form:input path="fare" value="${data.fare}" onblur="sendInfo1(this.value)"   onkeypress="return isNumberKey(event)"         /></td>
				<td><div id="amit51" style="color: red"></div></td>
				<td><form:errors path="fare"></form:errors></td>
			    </tr>
			    <tr>
			    <td colspan="2" align=center><input type="submit" value="MODIFY"/></td>
			    </tr>
			</table> 
		</form:form>
</body>
</html>