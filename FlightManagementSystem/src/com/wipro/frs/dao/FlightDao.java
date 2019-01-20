
package com.wipro.frs.dao;

import java.util.ArrayList;
import java.util.List;

import com.wipro.frs.bean.FlightBean;
import com.wipro.frs.bean.PassengerBean;
import com.wipro.frs.bean.RouteBean;
import com.wipro.frs.bean.ScheduleBean;

public interface FlightDao {
	String createFlight(FlightBean flightBean) ;	
	String GetID(FlightBean flightBean);
	ArrayList<FlightBean> findAll();
	FlightBean DisplayByID(String flightname);
	int DeleteFlight(FlightBean flightBean);
	boolean updateFlight(FlightBean flightBean);
	
	
	String createScheduleBean(ScheduleBean scheduleBean);
	String getScheduleID();
	ScheduleBean viewSchedulebyID(String scheduleBean);
	ArrayList<ScheduleBean> viewallSchedule();
	int removeSchedule(ScheduleBean scheduleId);
	boolean updateSchedule(ScheduleBean scheduleBean);
	public ArrayList viewByRealScheduleId(String source,String destination);

	
	String createRoute(RouteBean routeBean) ;
	int deleteroute(RouteBean routeId);
	boolean updateRoute(RouteBean routeBean);
	RouteBean viewByRouteId(String routeId);
	ArrayList<RouteBean> viewByAllRoute();
	String getComputedId();
	
	ArrayList<PassengerBean> ViewAllPessenger(String ID);
	

	public ArrayList viewSchedulebyID(String source,String destination);
	List showtouserfortravel();
	List viewPassengersBySchedule(String rID);
	
}
