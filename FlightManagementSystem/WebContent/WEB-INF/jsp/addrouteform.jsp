<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href="homepage2.html"><img src="images/home-icon-png.png" width="50" align=left height="50"></a>
<h1>Add Route</h1>
		<form:form method="POST" action="save.html">
	   		<table align=center>
			    
			    <tr>
			        <td><form:label path="source">Source:</form:label></td>
			       <td><form:select path="source">
			    <form:option value="Delhi" label="Delhi"/>
			    <form:option value="Mumbai" label="Mumbai"/>
			    <form:option value="Bangalore" label="Bangalore"/>
			    <form:option value="Chennai" label="Chennai"/>
			    </form:select>
			    </td>
			        
			    </tr>
			    <tr>
			    <td><form:label path="destination">Destination:</form:label></td>
			    <td><form:select path="destination">
			   <form:option value="Delhi" label="Delhi"/>
			    <form:option value="Mumbai" label="Mumbai"/>
			    <form:option value="Bangalore" label="Bangalore"/>
			    <form:option value="Chennai" label="Chennai"/>
			    </form:select>
			    </td>
			    </tr>
			    
			       <tr>
			        <td><form:label path="distance">Distance(in miles):</form:label></td>
			        <td><form:input path="distance"/></td>
			        
			    </tr>
			      
			    
			    <tr>
			        <td><form:label path="fare">Fare(cost per mile):</form:label></td>
			        <td><form:input path="fare"/></td>
			        
			    </tr>
			    <tr>
			    <td colspan="2"><input type="submit" value="ADD"/></td>
			    </tr>
			</table> 
		</form:form>
</body>
</html>