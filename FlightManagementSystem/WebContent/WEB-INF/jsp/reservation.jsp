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
  <script>
  $(document).ready(function() {
    $("#datepicker").datepicker();
  });
  </script>
</head>
<body>
<a href="homepage.html"><img src="images/home-icon-png.png" width="50" align=left height="50"></a>
		<form:form method="POST" action="save.html">
	   		<table>
			   
			     <tr>
			        <td><form:label path="userID">User ID:</form:label></td>
			        <td><form:input path="userID" readonly="true"/></td>
			    </tr>
			    
			     <tr>
			        <td><form:label path="scheduleID">Schedule ID:</form:label></td>
			        <td><form:input path="scheduleID" /></td>
			    </tr>
			    
			    <tr>
			        <td><form:label path="reservationType">Reservation Type:</form:label></td>
			        <td><form:input path="reservationType" /></td>
			    </tr>
			   
			    <tr>
            		<td>BookingDate:</td>
            		<td><form:input path = "bookingDate" id = "datepicker" /></td>
        	   </tr>
        	   
        	   <tr>
            		<td>JourneyDate:</td>
            		<td><form:input path = "journeyDate" id = "datepicker" /></td>
        	   </tr>
        	    
        	     <tr>
			        <td><form:label path="noOfSeats">No. Of Seats:</form:label></td>
			        <td><form:input path="noOfSeats" /></td>
			    </tr>
			    
			     <tr>
			        <td><form:label path="totalFare">Total Fare:</form:label></td>
			        <td><form:input path="totalFare" /></td>
			    </tr>
			    
			     <tr>
			        <td><form:label path="bookingStatus">Booking Status:</form:label></td>
			        <td><form:input path="bookingStatus" /></td>
			    </tr>
			    
			    <tr>
			        <td><form:label path="source">Source:</form:label></td>
			        <td><form:input path="source" /></td>
			    </tr>
			    
			    <tr>
			        <td><form:label path="destination">Destination:</form:label></td>
			        <td><form:input path="destination" /></td>
			    </tr>
			    
			   
			    <tr>
			      <td colspan="2"><input type="submit" value="Submit"/></td>
		      </tr>
			</table> 
		</form:form>

</body>
</html>