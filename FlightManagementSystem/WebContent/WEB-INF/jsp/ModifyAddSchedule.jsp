<%@page import="java.util.ArrayList"%>
<%@page import="com.itextpdf.text.log.SysoLogger"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>3'PN Projects</title>
<script type="text/javascript">



function  abc() {
	
	
	if(piy.travelDuration.value<0)
		{
		alert("Travel Duration can not be less then 0");
		return false;
		}
	if(piy.travelDuration.value==0)
	{
	alert("Travel Duration can not be  0");
	return false;
	}
	if(piy.travelDuration.value<=0)
	{
	alert("Travel Duration can not be less then 0");
	return false;
	}
	else if(piy.travelDuration.value>=100)
		{
		alert("Travel Duration can not be more then 100");
		return false;
		}
	
	
	
	else
		return true;
}





</script>


</head>
<body>


	<a href="homepage2.html"><img src="images/home-icon-png.png"
		width="50" align=left height="50"></a>
		<br><br>
	<%
						String Field;	
						String Field2;	

						ArrayList li = new ArrayList();
						ArrayList li2 = new ArrayList();
	%><form:form method="POST" action="ModifiedSchedule.html" onsubmit="return abc()" name="piy" >
	<center>
		<table align=center>
			<tr>
				<td>Flight ID:</td>
							<td><form:select path="flight.flightID" id="source"
									onblur="sendInfo1(this.value)" checked="${data.flight.flightID}"  >
									<%
										try {
													Class.forName("oracle.jdbc.driver.OracleDriver");
													Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "hr",
															"hr");
													Statement st = con.createStatement();
													String sql = "select * from FRS_TBL_FLIGHT";
													System.out.print(sql);
													ResultSet rs = st.executeQuery(sql);
													while (rs.next()) {
														String name = rs.getString("FLIGHTID");
														li.add(name);
													}
									%>

 <%
        for(int i=0;i<li.size();i++) {
            Field=li.get(i).toString();
        %>
									<form:option label="<%=Field %>" value="<%=Field %>" > 					
									</form:option>
<%} %>
									<%
                                     	} catch (Exception e) {

												}
									%>
								</form:select></td>









							<td><form:errors path="flight.flightID" /></td>
							<td><div id="amit6" style="color: red"></div></td>

						</tr>
						<tr>
							<td>Route ID:</td>
							<td><form:select  path="route.routeID"
									 onblur="sendInfo2(this.value)" >	<%
										try {
													Class.forName("oracle.jdbc.driver.OracleDriver");
													Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "hr",
															"hr");
													Statement st = con.createStatement();
													String sql = "select * from FRS_TBL_ROUTE";
													System.out.print(sql);
													ResultSet rs = st.executeQuery(sql);
													while (rs.next()) {
														String gh = rs.getString("ROUTEID");
														li2.add(gh);
													}
									%>

 <%
        for(int i=0;i<li2.size();i++) {
            Field2=li2.get(i).toString();
        %>
        
									<form:option label="<%=Field2 %>" value="<%=Field2 %>"> 					
									</form:option>
<%} %>
									<%
                                     	} catch (Exception e) {

												}
									%>
								</form:select></td>
							<td><form:errors path="route.routeID" /></td>
							<td><div id="amit7" style="color: red"></div></td>
						</tr>
		
			<tr>
				<td><form:label path="travelDuration">Travel Duration:</form:label></td>
				<td><form:input path="travelDuration" value="${data.travelDuration}" /></td>
				<td><form:errors path="travelDuration"/></td>
			</tr>
			<tr>
							<td><form:label path="availableDays">Available Days:</form:label></td>
							<td><form:checkbox path="availableDays" value="mon"
									label="mon" /> <form:checkbox path="availableDays"
									value="tues" label="tues" /> <form:checkbox
									path="availableDays" value="wed" label="wed" /> <form:checkbox
									path="availableDays" value="thurs" label="thurs" /> <form:checkbox
									path="availableDays" value="fri" label="fri" /> <form:checkbox
									path="availableDays" value="sat" label="sat" /> <form:checkbox
									path="availableDays" value="sun" label="sun" /></td>
						</tr><tr>	<td><form:errors path="availableDays" /></td>
						</tr>
			<tr>
				<td><form:label path="departureTime">Departure Time:</form:label></td>
				<td><form:input path="departureTime" value="${data.departureTime}" /></td>
				<td><form:errors path="departureTime" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Modify" /></td>
			</tr>
		</table>
		</center>
	</form:form>
</body>
</html>