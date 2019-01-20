package com.wipro.frs.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity
@Table(name="FRS_TBL_Flight")
public class FlightBean {
	@Id
	private String flightID;
	@NotNull	
	@Pattern(regexp = "^[A-z]{2}[0-9A-z ]{0,255}$", message="First two chars of Flight name should be alphabets")
	@Size(min=2,max=25,message="Flight name must be bw 2 and 25")
	private String flightName;
	@NotNull
	private int seatingCapacity;
	@NotNull 	
	private int	reservationCapacity;
	public String getFlightID() {
		return flightID;
	}
	public void setFlightID(String flightID) {
		this.flightID = flightID;
	}
	public String getFlightName() {
		return flightName;
	}
	public void setFlightName(String flightName) {
		this.flightName = flightName;
	}
	public int getSeatingCapacity() {
		return seatingCapacity;
	}
	public void setSeatingCapacity(int seatingCapacity) {
		this.seatingCapacity = seatingCapacity;
	}
	public int getReservationCapacity() {
		return reservationCapacity;
	}
	public void setReservationCapacity(int reservationCapacity) {
		this.reservationCapacity = reservationCapacity;
	}
}
