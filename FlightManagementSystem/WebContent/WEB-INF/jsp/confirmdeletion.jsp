<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>3'PN Projects</title>
<script>
function toConfirmDelete()
{
	var choose=confirm("Are you sure you want to delete route");
	if(choose)
		return true;
	else 
		return false;
	}
</script>
</head>
<body>
<a href="homepage2.html"><img src="images/home-icon-png.png" width="50" align=left height="50"></a>
<form:form method="POST" onsubmit="return toConfirmDelete()" action="godelete.html">
<table align="left" border="1">
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
				</table>
				<input type=hidden value="${myroute.routeID}" name="id"/>
				
			    <input type="submit" value="DELETE"/>
			    
		
	
</form:form>
</body>
</html>