<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>3'PN Projects</title>
<script type="text/javascript">
function cho() 
{
	piy.flightID.value=piy.flightID.value.toUpperCase();
}
</script>
</head>
<body>
<a href="homepage2.html"><img src="images/home-icon-png.png" width="50" align=left height="50"></a>
<form:form name="piy" method="POST" action="Showbyidflight.html">
	<table>
			    <tr>
			        <td><form:label path="flightID">Flight Id:</form:label></td>
			        <td><form:input path="flightID" onkeyup="cho()" value=""/></td>
			    </tr>
			    <tr>
			    <td colspan="2"><input type="submit" value="Login"/></td>
			    </tr>
	</table> 
</form:form>

	


</body>
</html>