<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>3'PN Projects</title>
<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>
<style type="text/css">
</style>

<link rel="stylesheet" href="images/layout.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="images/mainmenu.css" type="text/css"
	media="screen">
</head>
<body onload="noBack();"
    onpageshow="if (event.persisted) noBack();">
	



	<center>
		<h1>Welcome to customer page.</h1>
	</center>
	<div class="container">
		<div class="content">

			<ul id="nav">
				<li><a href="viewCustomer.html">Profile</a></li>
				<li><a href="#">Schedule</a>

					<ul class="subs">
						<li><a href="ShowbyidSchedulecus.html">View By Source and Destination</a></li>
						<li><a href="ShowAllSchedulecus.html">View All schedules</a></li>
					</ul></li>


				<li><a href="reservation.html">Book Ticket</a></li>
				<li><a href="manageReservation.html">Reservation</a></li>
				<li><a href="changepass2.html">Change Password</a></li>
				<li><a href="logout.html">Logout</a></li>

			</ul>
		</div>	
	</div>
	<center>
<div><h1>${data}</h1></div>
</body>
</html>
