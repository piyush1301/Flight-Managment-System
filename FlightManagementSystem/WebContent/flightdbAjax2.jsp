<%@page import="com.wipro.frs.dao.FlightDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String id=request.getParameter("val");
System.out.print(id);
if(id.length()>0)
{
	FlightDAOImpl dao=new FlightDAOImpl();
	boolean status=dao.gRouteIdJSP(id);
	System.out.println(status);
	if(status)
	{
	
	}
	else
	{
		out.print("Route Id does not exists");
	}
}
else
{
	out.print("Route  Id cannot be blank");
}
%>
</body>
</html>