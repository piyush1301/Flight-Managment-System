<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body><%  
String exp=request.getParameter("val").trim();  
String exp2=request.getParameter("val2").trim();  
int i=0;
int j=0;

if(exp.equals(""))
	out.print("Enter no of seats"); 
if(exp2.equals(""))
	out.print("Enter no of seats"); 

char[] ch1=exp.toCharArray();
char[] ch2=exp2.toCharArray();

int len1=ch1.length;
int len2=ch1.length;

for(i=0;i<len1;i++)
{
    if(Character.isDigit(ch1[i]))
    {
    continue;
    }
   	else
   		out.print("Only numbers can be entered.");
        break;
} 
for(j=0;j<len2;j++)
{
    if(Character.isDigit(ch2[j]))
    {
    continue;
    }
   	else
   		out.print("Only numbers can be entered.");
        break;
} 



	if(i==len1 && j==len2)
	{
		if(Integer.parseInt(exp)>=Integer.parseInt(exp2))
   		out.print("Seating capacity shold be less then reservation capacity.");
	}



%> 
</body>
</html>