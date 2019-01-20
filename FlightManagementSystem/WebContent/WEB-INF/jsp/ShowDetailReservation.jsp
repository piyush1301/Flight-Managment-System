
	
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>3'PN Projects</title>
</head>
<body bgcolor="#9ACD32"><a href="homepage2.html"><img src="images/home-icon-png.png" width="50" align=left height="50"></a>

	<h1>Record</h1>
	<form:form action="paymentDetails" method="POST">
		<table border="2">
		<tr>
					<td>Schedule ID</td>
					<td>Flight ID</td>
					<td>Seating Capacity</td>
					<td>Reservation Capacity</td>	
					<td>Option</td>	
		</tr>
		
			<tr>
				<th><c:out value="${data.reservationID}"/></th>
				<th><c:out value="${data.user.userID}"/></th>
				<th><c:out value="${data.schedule.scheduleID}"/></th>
				<th><c:out value="${data.reservationType}"/></th>
				<th><c:out value="${data.bookingDate}"/></th>
				
				<th><c:out value="${data.journeyDate}"/></th>
				<th><c:out value="${data.totalFare}"/></th>
				<th><c:out value="${data.bookingStatus}"/></th>
				<th><c:out value="${data.source}"/></th>
				<th><c:out value="${data.destination}"/></th>
			</tr>
			<tr>
			<td colspan="2">
					<input type="submit" value="Pay"/>
			</td>			
			</tr>
			</table>
	</form:form>
</body>
</html>