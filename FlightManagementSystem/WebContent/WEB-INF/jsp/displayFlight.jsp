<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>3'PN Projects</title>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
  <script src="images/table.js" type="text/javascript"></script>
<link href="images/table.css" rel="stylesheet" type="text/css" />
  
</head>
<body bgcolor="wheat">
<a href="homepage2.html"><img src="images/home-icon-png.png" width="50" align=left height="50"></a>
<center>
<h3>Flight Detail's</h3>
		<form:form method="POST" action="">
	   		
	   			<table align="left" border="1">
			   	 <tr>
			  	      <td>Flight ID:</td>
			  	      <td>${bean.flightID} </td>
			 	   </tr>
			    
			 	   <tr>
			 	       <td>Flight Name:</td>
			 	       <td>${bean.flightName}</td>
				    </tr>
			     
			 	    <tr>
			 	       <td>Seating Capacity:</td>
			 	       <td>${bean.seatingCapacity} </td>
			 	   </tr>
			       <tr>
			    	    <td>Reservation Capacity:</td>
			  		    <td>${bean.reservationCapacity} </td>
			  	  </tr>
				</table> 
			
		</form:form>
</center>
</body>
</html>