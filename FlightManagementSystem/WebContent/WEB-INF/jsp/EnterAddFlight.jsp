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
<body>
<a href="homepage2.html"><img src="images/home-icon-png.png" width="50" align=left height="50"></a>
<form:form method="POST" action="addFlightdata.html">
	<table>
			    <tr>
			        <td><form:label path="flightName">Flight Name:</form:label></td>
			        <td><form:input path="flightName"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="seatingCapacity">Seating Capacity:</form:label></td>
			        <td><form:input path="seatingCapacity"/></td>
			    </tr>
			    <tr>
			        <td><form:label path="reservationCapacity">Reservation Capacity:</form:label></td>
			        <td><form:input path="reservationCapacity"/></td>
			    </tr>
			    <tr>
			    <td colspan="2"><input type="submit" value="Login"/></td>
			    </tr>
	</table> 
</form:form>
</body>
</html>