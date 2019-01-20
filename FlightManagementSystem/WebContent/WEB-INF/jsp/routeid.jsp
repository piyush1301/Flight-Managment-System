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
<body><a href="homepage2.html"><img src="images/home-icon-png.png" width="50" align=left height="50"></a>

<h3>Enter Route ID</h3>
<form:form method="POST" action="goview.html">
<table align=center>
 <tr>
			        <td><form:label path="routeID">Route ID:</form:label></td>
			        <td><form:input path="routeID"/></td>
			        
			    </tr>
			    <tr>
			    <td colspan="2"><input type="submit" value="VIEW"/></td>
			    </tr>
			</table> 
</form:form>

<%-- <table align="left" border="1">
		<tr>
			<th>ROUTE ID</th>
			<th>SOURCE</th>
			<th>DESTINATION</th>
			<th>DISTANCE</th>
			<th>FARE</th>
			

		</tr>

		
			<tr>
				<td><c:out value="${myroute.routeID}"/></td>
				<td><c:out value="${myroute.source}"/></td>
				<td><c:out value="${myroute.destination}"/></td>
				<td><c:out value="${myroute.distance}"/></td>
				<td><c:out value="${myroute.fare}"/></td>
				
				
			</tr>
		
	</table> --%>
</body>
</html>