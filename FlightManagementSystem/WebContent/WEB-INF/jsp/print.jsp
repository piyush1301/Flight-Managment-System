<%@page import="java.util.ArrayList"%>
<%@page import="com.wipro.frs.bean.ReservationBean"%>
<%@page import="com.wipro.frs.bean.PassengerBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.wipro.frs.bean.ProfileBean"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>3'PN Projects</title>
<style type="text/css">

body

{
    background: url(images/content_image.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  
}

</style>



<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">

<script	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

</head>
<body>
	<center>
	<a href="homepage.html"><img src="images/home-icon-png.png" width="50" align=left height="50"></a>
		<h1>Print Ticket</h1>
		<br>
		<br>
		
		<table bgcolor="white" width=55% cellpadding="6" cellspacing="4" border=2>
						<tr><th colspan=2> 3'PN Flight Reservation System </th></tr>
						<tr><th>Reservation Id</th><td>${ReservationId}</td></tr>
						<tr><th>Name</th><td>${name}</td></tr>
						<tr><th>Gender</th><td>${gender}</td></tr>
						<tr><th>Age</th><td>${age}</td></tr>
						<tr><th>Source</th><td>${source}</td></tr>
						<tr><th>Destination</th><td>${Destination}</td></tr>
					
		
		
		 </table>
		<a href="printit.html" download="Ticket"><b>Download</b></a>
	</center>
</body>
</html>