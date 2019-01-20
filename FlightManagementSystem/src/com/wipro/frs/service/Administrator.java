package com.wipro.frs.service;

import java.util.ArrayList;
import java.util.List;

import com.wipro.frs.bean.FlightBean;
import com.wipro.frs.bean.PassengerBean;
import com.wipro.frs.bean.RouteBean;
import com.wipro.frs.bean.ScheduleBean;

public interface Administrator {

	String addFlight(FlightBean flightBean);
	boolean modifyFlight(FlightBean flightBean);
	int removeFlight(FlightBean flightbean);
	String addSchedule(ScheduleBean scheduleBean);
	boolean modifySchedule(ScheduleBean scheduleBean);
	int removeSchedule(ScheduleBean scheduleId);
	String addRoute(RouteBean routeBean);
	boolean modifyRoute(RouteBean routeBean);
	int removeRoute(RouteBean routeId);
	FlightBean viewByFlightId(String flightId);
	RouteBean viewByRouteId(String routeId);
	ArrayList<FlightBean> viewByAllFlights();
	ArrayList<RouteBean> viewByAllRoute();
	ArrayList<ScheduleBean> viewByAllSchedule();
	ScheduleBean viewByScheduleId(String scheduleId);
	ArrayList<PassengerBean> viewPassengersByFlight(String scheduleId);
	public ArrayList viewByScheduleId(String source,String destination);
	List showtouserfortravel();
	List viewPassengersBySchedule(String rID);
	boolean updateSeatstatus(int SeatingCapacity,String rID);
	public ArrayList viewByRealScheduleId(String source,String destination);
}
