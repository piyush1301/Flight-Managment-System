<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>3'PN Projects</title>
<link rel="stylesheet" type="text/css" href="images/login.css">
<link rel="stylesheet" type="text/css" href="images/menu2.css">
<style>
body {
	background-image: url("images/show.jpg");
	background-repeat: no-repeat;
}
</style>

</head>
<body>
	
<center>
<div id="menu">
			<ul>
				<li><a href="homepage.html">Home</a></li>

			</ul>
		</div>
		<div id="wrapper">

	<form:form method="POST" action="confirmPayment.html"  class="login-form">
			<div class="header">
						<h1>Payment</h1>
					</div>
<div class="content">
	<center>


			<form:label path="creditcardNumber">Card Number:</form:label>
				<form:input path="creditcardNumber" class="input username" />
	

	
			Valid From:
				<form:input path="validFrom"  class="input username"/>
		
				Valid To:
				<form:input path="validTo" class="input username" />
	


</center></div>
<div class="footer">

				<input type="submit" value="Book My Ticket" class="button"/>
</div>
		<div id="sd">${retVal}</div>

	</form:form>

</body>
</html>