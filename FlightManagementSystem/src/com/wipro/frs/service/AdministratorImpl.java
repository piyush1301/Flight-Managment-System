package com.wipro.frs.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.wipro.frs.bean.FlightBean;
import com.wipro.frs.bean.PassengerBean;
import com.wipro.frs.bean.RouteBean;
import com.wipro.frs.bean.ScheduleBean;
import com.wipro.frs.dao.FlightDao;
import com.wipro.frs.dao.RouteDAO;


@Service("administrator")
@Transactional(propagation=Propagation.SUPPORTS,readOnly=true)
public class AdministratorImpl implements Administrator{

	@Autowired
	FlightDao flightDao;
	@Autowired
	RouteDAO rDao;
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public String addFlight(FlightBean flightBean) {
		flightBean.setFlightID(flightDao.GetID(flightBean));
		if(flightBean.getFlightID()==null||flightBean.getFlightName()==null||flightBean.getReservationCapacity()<=0||flightBean.getSeatingCapacity()<=0)
		{
			return "Error";
		}
		else
		{
			return flightDao.createFlight(flightBean);
		}
	}
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public ArrayList<FlightBean> viewByAllFlights() {
		return flightDao.findAll();
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public FlightBean viewByFlightId(String flightId) {
		
		return flightDao.DisplayByID(flightId);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public int removeFlight(FlightBean flightbean) {
		return flightDao.DeleteFlight(flightbean);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public boolean modifyFlight(FlightBean flightBean) {
		return flightDao.updateFlight(flightBean);
	}
	
//_____________________________________________________________________________	
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public String addRoute(RouteBean routeBean) {
		if(routeBean==null)
			return "FAIL";
			
		String res=routeBean.getSource().substring(0,2).toUpperCase();
		res+=routeBean.getDestination().substring(0,2).toUpperCase();
		res+=flightDao.getComputedId();
		routeBean.setRouteID(res);
		return flightDao.createRoute(routeBean);		
	}
	
	
	
	public RouteBean viewByRouteId(String routeId) {
		return flightDao.viewByRouteId(routeId);
		
	}
	
	public ArrayList<RouteBean> viewByAllRoute() {
		return flightDao.viewByAllRoute();
	}
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public boolean modifyRoute(RouteBean routeBean) {
		return flightDao.updateRoute(routeBean);
	}
	
	public int removeRoute(RouteBean routeId) {
		return flightDao.deleteroute(routeId);
	}
	
	
//_____________________________________________________________________________________	
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public String addSchedule(ScheduleBean scheduleBean) {
		
		if(scheduleBean==null)
		{
			return "Invalid Entry";
		}
		else 
		{
			String id=flightDao.getScheduleID();
			id=scheduleBean.getRoute().getRouteID().substring(0,4).toUpperCase()+id;
			scheduleBean.setScheduleID(id);
			return flightDao.createScheduleBean(scheduleBean);
		}
		
	}
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public ScheduleBean viewByScheduleId(String scheduleId) 
	{
		return flightDao.viewSchedulebyID(scheduleId);
	}
	
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public ArrayList<ScheduleBean> viewByAllSchedule() {
		return flightDao.viewallSchedule();
	}

	public int removeSchedule(ScheduleBean scheduleId) {
		return flightDao.removeSchedule(scheduleId);
	}

	
	public boolean modifySchedule(ScheduleBean scheduleBean) {
		return flightDao.updateSchedule(scheduleBean);
	}

	//______________________________________________________________________________________
	public ArrayList<PassengerBean> viewPassengersByFlight(String scheduleId) {
		return flightDao.ViewAllPessenger(scheduleId);
	}
	
	//______________________________________________customer_______________________________
	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)
	public ArrayList viewByScheduleId(String source,String destination) 
	{
		return flightDao.viewSchedulebyID(source,destination);
	}

	public List showtouserfortravel() {
		return flightDao.showtouserfortravel();
	}

	public List viewPassengersBySchedule(String rID) {
		return flightDao.viewPassengersBySchedule(rID);
	}

	@Override
	public boolean updateSeatstatus(int SeatingCapacity, String rID) {
		
		return rDao.updateSeatstatus(SeatingCapacity, rID);
	}

	@Transactional(propagation=Propagation.REQUIRED,readOnly=false)

	public ArrayList viewByRealScheduleId(String source, String destination) {
		return flightDao.viewByRealScheduleId(source,destination);
		}

}
