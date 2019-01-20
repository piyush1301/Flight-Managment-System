package com.wipro.frs.bean;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.format.annotation.NumberFormat.Style;

@Entity
@Table(name="FRS_TBL_Schedule")
public class ScheduleBean {
	
	@Id
	private String scheduleID;
	@NotNull
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="flightID")
	private FlightBean flight;
	@NotNull
	@OneToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="routeID")
	private RouteBean route;
	@NotNull
	@NumberFormat(style = Style.NUMBER)
	private int travelDuration;
	@NotNull(message="Please select atleast one day")
	private String availableDays;
	
	@NotEmpty
	@Pattern(regexp="([01]?[0-9]|2[0-3]):[0-5][0-9]", message="Time Should Be in 24 hours format")
	private String departureTime;
	
	public String getScheduleID() {
		return scheduleID;
	}
	public void setScheduleID(String scheduleID) {
		this.scheduleID = scheduleID;
	}
	
	public FlightBean getFlight() {
		return flight;
	}
	public void setFlight(FlightBean flight) {
		this.flight = flight;
	}
	public RouteBean getRoute() {
		return route;
	}
	public void setRoute(RouteBean route) {
		this.route = route;
	}
	public int getTravelDuration() {
		return travelDuration;
	}
	public void setTravelDuration(int travelDuration) {
		this.travelDuration = travelDuration;
	}
	public String getAvailableDays() {
		return availableDays;
	}
	public void setAvailableDays(String availableDays) {
		this.availableDays = availableDays;
	}
	public String getDepartureTime() {
		return departureTime;
	}
	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}
	
	

}
