<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>3'PN Projects</title><link href="images/table.css" rel="stylesheet" type="text/css" />

<style>
body {
	background-image: url("images/show.jpg");
	background-repeat: no-repeat;
}

</style>
</head>
<body>

	<a href="homepage2.html"><img src="images/home-icon-png.png"
		width="50" align=left height="50"></a>

	<CENTER>
	<br><br>
		<table border="2">
			<tr>
				<th>Reservation ID</th>
				<th>Name</th>
				<th>Gender</th>
				<th>Age</th>
				<th>Seat No</th>


			</tr>
			<c:forEach items="${data}" var="data">
				<tr>
					<td><c:out value="${data.reservationID}" /></td>
					<td><c:out value="${data.name}" /></td>
					<td><c:out value="${data.gender}" /></td>
					<td><c:out value="${data.age}" /></td>
					<td><c:out value="${data.seatNo}" /></td>
				</tr>
			</c:forEach>
		</table>
	</CENTER>
</body>
</html>