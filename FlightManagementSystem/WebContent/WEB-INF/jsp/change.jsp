<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title><link rel="stylesheet" type="text/css" href="images/login.css">

<style>
body {
	padding: 60px;
	background-image: url("images/123.jpg");
	background-repeat: no-repeat;
}
</style>
</head>
<body>
<a href="homep.html"><img src="images/home-icon-png.png"
		width="50" align=left height="50"></a>

<center>
		<div id="wrapper">
		
	<form:form method="POST" action="passchanged.html" class="login-form">
				<div class="header">
					<h1>Change Your Password</h1>
					<h3>${data}</h3>
				</div>
			<div class="content">
			<form:input path="userID"  class="input username" placeholder="UserID"/>
						<div class="user-icon"></div>	
			<form:password path="password"  class="input password" placeholder="Password" />
			<div class="pass-icon"></div>		
			</div>

		<div class="footer">
						<input type="submit" value="Submit" class="button"/>

			    </form:form></div>
	</form>
	

</div>
<div class="gradient"></div>
<div class="footer">
            <p>Copyright © 2013 Wipro Technologies. All rights reserved</p>
        </div>
</center>
	    
</body>
</html>