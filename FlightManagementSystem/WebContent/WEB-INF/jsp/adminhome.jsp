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
{
margin:0;
}
html, body {
	height: 100%;
}

.wrapper {
	min-height: 100%;
	height: auto !important;
	height: 100%;
	margin: 0 auto -4em;
}

.footer, .push {
	height: 4em;
	clear: both;
}
</style>



<link rel="stylesheet" href="images/layout.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="images/mainmenu.css" type="text/css"
	media="screen">
</head>
<body onload="noBack();"
    onpageshow="if (event.persisted) noBack();">
	

	<center>
		<h1>Welcome to admin page.</h1>
	</center>

	<div class="container">
		<div class="content">

			<ul id="nav">
				<li><a href="homepage2.html">Home</a></li>
				<li><a href="#" class="current">Flight</a>
					<ul class="subs">
						<li><a href="addFlight.html">Add Flight</a></li>
						<li><a href="viewchoice.html">View Flight</a></li>
					</ul></li>

				<li><a href="#" class="current">Route</a>
					<ul class="subs">
						<li><a href="addroute.html">Add Route</a></li>
						<li><a href="viewroute.html">View Route</a></li>
					</ul></li>

				<li><a href="#" class="current">Schedule</a>
					<ul class="subs">
						<li><a href="addSchedule.html">Add Schedule</a></li>
						<li><a href="viewSchedule.html">View Schedule</a></li>
					</ul></li>

				<li><a href="passengergetSchdule.html">View</a></li>






				<li><a href="logout.html">Logout</a></li>
			</ul>
		</div>
	</div>

	<div class="footer">
		<p>Copyright © 2013 Wipro Technologies. All rights reserved</p>
	</div>

</body>
</html>
