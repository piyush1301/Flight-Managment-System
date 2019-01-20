<%@page import="com.itextpdf.text.log.SysoLogger"%>
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
String des=request.getParameter("dest");  
String src=request.getParameter("src");  
System.out.println(des+src);
if(des.equalsIgnoreCase(src))
	out.print("Source and Destination can never be the same"); 
    
  
     %>
   
</body>
</html>