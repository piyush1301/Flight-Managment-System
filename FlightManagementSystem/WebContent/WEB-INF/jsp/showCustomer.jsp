<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.wipro.frs.bean.ProfileBean"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>3'PN Projects</title>


<style>
body {
	background-image: url("images/show.jpg");
	background-repeat: no-repeat;
}
</style>



<link href="images/table.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

</head>
<body> 
	<a href="homepage.html"><img src="images/home-icon-png.png" width="50" align=left height="50"></a>
	
	<br><br>
<center>
	<br><br>
	<br><br>

		<form:form method="POST" action="">
	   		<table align=center border="2" cellpadding=3 cellspacing=6 >
			 <tr>
			 <td colspan="2"><font size=6 font face="Times New Roman"> <b>Customers Details</b></font></td>
			 </tr>
			 
			 
			 
			    <tr>
			        <td>User ID:</td>
			        <td>${bean.userID}</td>
			    </tr>
			    <tr>
			        <td>Name:</td>
			        <td>${bean.firstName}  ${bean.lastName}</td>
			 </tr>
			 
			   <tr>
            		<td>Date of Birth:</td>
            	
            	
            	<%
						ProfileBean sb= (ProfileBean)request.getAttribute("bean");
						Date dob = sb.getDateOfBirth();
						SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
						String date = sdf.format(dob);

%> 
            	
            		<td><%=date %></td>
        	
        	   </tr>
			   <tr>
			        <td>Gender:</td>
			        <td>${bean.gender} </td>
			   </tr>
		        	    <tr>
			        <td>Street:</td>
			        <td>${bean.street} </td>
			    </tr>
			     <tr>
			        <td>Location:</td>
			        <td>${bean.location}</td>
			    </tr>
			     <tr>
			        <td>City:</td>
			        <td>${bean.city}</td>
			  			  
			    </tr>
			     <tr>
			        <td>State:</td>
			        <td>${bean.state}</td>
			    </tr>
			     <tr>
			        <td>Pin Code:</td>
			        <td>${bean.pincode}</td>
			    </tr>		    
			    <tr>
			        <td>Mobile No:</td>
			        <td>${bean.mobileNo}</td>
			    </tr>
			    <tr>
			        <td>Email ID:</td>
			        <td>${bean.emailID}</td>
			    </tr> 
		
	   
			    
			</table> 
		</form:form> </center> 
		

</body>
</html>