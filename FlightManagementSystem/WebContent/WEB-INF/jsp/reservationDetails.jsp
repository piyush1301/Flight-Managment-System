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


<style>
body {
	background-image: url("images/show.jpg");
	background-repeat: no-repeat;
}</style>



<link rel="stylesheet"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">

<link href="images/table.css" rel="stylesheet" type="text/css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script type="text/javascript">
function cho() 
{
	var co=confirm('Are you sure you want to continue');
	if(co)
		return true;
	else
		return false;
}
</script>
</head>
<body>
	<center>
		<a href="homepage.html"><img src="images/home-icon-png.png"
			width="50" align=left height="50"></a>
		<h1>Customer Reservation Detail's</h1>
		<br> <br>
		<form:form method="GET" action="return cho()">
			<center>
				<c:if test="${!empty beanw}">
					<table align="center" border="1">
						<tr>
							<th>User Id</th>
							<th>Source</th>
							<th>Destination</th>
							<th>Journey Date</th>
							<th>Booking status</th>
							<th>Fare</th>
							<th>FirstName</th>
							<th>Gender</th>
							<th>Seat No</th>
							<th colspan="2">Select</th>
						</tr>
						<%
							int i = 0;
						%>
						<c:forEach items="${beanw}" var="bean">
							<tr>
								<td><c:out value="${bean.userID}" /></td>
								<td><c:out value="${bean.source}" /></td>
								<td><c:out value="${bean.destination}" /></td>
								<%
									ArrayList list1 = (ArrayList) request.getAttribute("beanw");
												ReservationBean be = (ReservationBean) list1.get(i++);
												Date dob = be.getJourneyDate();
												SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
												String date = sdf.format(dob);
								%>
								<td><c:out value="<%=date%>" /></td>
								<td><c:out value="Booked" /></td>
								<td><c:out value="${bean.totalFare}" /></td>


								<td>${emp.name}</td>
								<td>${emp.gender}</td>
								<td>${emp.seatNo}</td>


<td bgcolor=white>	
						<a href="printit.html">PRINT</a>
							<a href="cancelBooking.html">CANCEL</a>	
							
								</td>




							</tr>
						</c:forEach>
					</table>
				</c:if></center>
				
		</form:form>
	</center>
</body>
</html>