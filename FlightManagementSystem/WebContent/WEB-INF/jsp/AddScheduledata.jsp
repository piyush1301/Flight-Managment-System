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
<style>
body {
	background: url(images/fog_flight--2-650_010815101432.jpg) no-repeat
		center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}
</style>
<script type="text/javascript">
	function upper() {

		piy.flight.flightID.value = piy.flight.flightID.value.toUpperCase();
		piy.rID.value = piy.rID.value.toUpperCase();

	}

	function sendInfo1(value) {

		var url = "flightdbAjax.jsp?val=" + value;
		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {
			request.onreadystatechange = getInfo;
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}

		function getInfo() {
			if (request.readyState == 4) {
				var val = request.responseText;
				document.getElementById('amit6').innerHTML = val;
			}
		}
	}

	function sendInfo2(value) {

		var url = "flightdbAjax2.jsp?val=" + value;
		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {
			request.onreadystatechange = getInfo;
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}

		function getInfo() {
			if (request.readyState == 4) {
				var val = request.responseText;
				document.getElementById('amit7').innerHTML = val;
			}
		}
	}
	
	
	
	
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

	<table>
		<tr>
			<td><form:form name="piy" method="POST"
					action="addScheduledata.html" onsubmit="return abc()">
					<table width="130%">
						<%
						String Field;	
						String Field2;	

						ArrayList li = new ArrayList();
						ArrayList li2 = new ArrayList();
	%>
						<tr>
							<td colspan="2"></td>
						</tr>
						<tr>
						<tr>
							<td>Flight ID:</td>
							<td><form:select path="flight.flightID" id="source"
									onblur="sendInfo1(this.value)">
									<%
										try {
													Class.forName("oracle.jdbc.driver.OracleDriver");
													Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "piyush",
															"system");
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
									<form:option label="<%=Field %>" value="<%=Field %>"> 					
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
													Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "piyush",
															"system");
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
							<td><form:input path="travelDuration" value="0" /></td>
							<td><form:errors path="travelDuration" /></td>
						</tr>
						<tr>
							<td><form:label path="availableDays">Available Days:</form:label></td>
							<td><form:checkbox path="availableDays" value="mon"	label="mon" /> 
								<form:checkbox path="availableDays"	value="tues" label="tues" /> 
								<form:checkbox path="availableDays" value="wed" label="wed" /> 
								
							<br>
							<form:checkbox path="availableDays" value="thurs" label="thurs" /> 
								<form:checkbox path="availableDays" value="fri" label="fri" /> 
								<form:checkbox path="availableDays" value="sat" label="sat" /> 
								<form:checkbox path="availableDays" value="sun" label="sun" />
							</td>
						</tr>
						<tr>	
							<td><form:errors path="availableDays" /></td>
						</tr>
						<tr>
							<td><form:label path="departureTime">Departure Time:</form:label></td>
							<td><form:input path="departureTime" placeholder="HH:MM" /></td>
							<td><form:errors path="departureTime" /></td>
						</tr>
						<tr>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="submit"
								value="Add Schdule" /></td>
						</tr>
					</table>
				</form:form></td>
			<td></td>
			<td>
				<table border="2" width="80%" align="Right">
					<tr>
						<th colspan="6">Currently Running Schedule</th>
					</tr>
					<tr>
						<th>Schedule ID</th>
						<th>Flight ID</th>
						<th>Route ID</th>
						<th>Travel Duration</th>
						<th>Available Days</th>
						<th>Departure Time</th>

					</tr>
					<c:forEach items="${datas}" var="f">
						<tr>
							<th><c:out value="${f.scheduleID}" /></th>
							<th><c:out value="${f.flight.flightID}" /></th>
							<th><c:out value="${f.route.routeID}" /></th>
							<th><c:out value="${f.travelDuration}" /></th>
							<th><c:out value="${f.availableDays}" /></th>
							<th><c:out value="${f.departureTime}" /></th>

						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>


	<br />
	<br />
	<table>
		<tr>
			<td>
				<table border="2">
					<tr>
						<th colspan="4" align="center">Flight DATA</th>
					</tr>
					<tr>
						<th>FlightID</th>
						<th>Flight Name</th>
						<th>Seating Capacity</th>
						<th>Reservation Capacity</th>
					</tr>
					<c:forEach items="${dataf}" var="data">
						<tr>
							<th><c:out value="${data.flightID}" /></th>
							<th><c:out value="${data.flightName}" /></th>
							<th><c:out value="${data.seatingCapacity}" /></th>
							<th><c:out value="${data.reservationCapacity}" /></th>
						</tr>
					</c:forEach>
				</table>
			</td>
			<td width="50px"></td>
			<td>
				<table border="2">
					<tr>
						<th colspan="5" align="center">Route DATA</th>
					</tr>
					<tr>
						<th>ROUTE ID</th>
						<th>SOURCE</th>
						<th>DESTINATION</th>
						<th>DISTANCE</th>
						<th>FARE</th>
					</tr>
					<c:forEach items="${datar}" var="data">
						<tr>
							<th><c:out value="${data.routeID}" /></th>
							<th><c:out value="${data.source}" /></th>
							<th><c:out value="${data.destination}" /></th>
							<th><c:out value="${data.distance}" /></th>
							<th><c:out value="${data.fare}" /></th>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>