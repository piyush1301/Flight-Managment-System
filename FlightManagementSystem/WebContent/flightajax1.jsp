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
		String exp = request.getParameter("val");
		if (exp.equals(""))
			out.print("Enter the flight name");

		else 
		{
			
			if (exp.length()>=25)
			out.print("Length of flight must be between 2 to 25 only");
			else if(exp.length()<2)
			out.print("Length of flight must be between 2 to 25 only");
			else
			{
				
			}
			
			
		}
	%>
</body>
</html>