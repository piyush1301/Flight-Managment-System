package com.wipro.frs.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wipro.frs.bean.FlightBean;
import com.wipro.frs.bean.ReservationBean;
import com.wipro.frs.bean.RouteBean;
import com.wipro.frs.bean.ScheduleBean;
import com.wipro.frs.service.Administrator;

@Controller

public class AdminFlightController {
	@Autowired
	Administrator administrator;
	static Map<String, Object> map1 = new HashMap<String, Object>();
	static Map<String, Object> map2 = new HashMap<String, Object>();
	static Map<String, Object> map3 = new HashMap<String, Object>();

	static Map<String, Object> map4 = new HashMap<String, Object>();

	@RequestMapping(value = "/flight", method = RequestMethod.GET)
	public ModelAndView fun3(@ModelAttribute("command") FlightBean flightBean, BindingResult result) {
		return new ModelAndView("AddFlight");
	}

	@RequestMapping(value = "/addFlight", method = RequestMethod.GET)
	public ModelAndView addflight(@ModelAttribute("command") FlightBean flightBean, BindingResult result) {
		return new ModelAndView("AddFlightdata");
	}

	@RequestMapping(value = "/addflighttodb", method = RequestMethod.GET)
	public ModelAndView addflighttodb(@Valid @ModelAttribute("command") FlightBean flightBean, BindingResult result) {
		if (result.hasErrors()) {
			return new ModelAndView("AddFlightdata");
		}
		int rc=flightBean.getReservationCapacity();
		int sc=flightBean.getSeatingCapacity();
		if(rc>sc)
		{
			return new ModelAndView("AddFlightdata","ERROR","Reservation capacity should be less then seating capacity");
		}
		
		else {
			String data = administrator.addFlight(flightBean);
			if (data.equalsIgnoreCase("Success")) 
			{
				
				data = "Flight is Added With ID " + flightBean.getFlightID();
				List<FlightBean> list = administrator.viewByAllFlights();
				if (list == null) 
				{
					return new ModelAndView("Display", "data", "No Record Found..!!");
				} 
				else 
				{
					ModelAndView modal=new ModelAndView();
					modal.setViewName("Displayall");
					modal.addObject("data",list);
					modal.addObject("data1",data);
					
					
					return modal;
				}
			} else if (data.equalsIgnoreCase("Fail")) {
				data = "Fail";
			} else if (data.equalsIgnoreCase("Error")) {
				data = "Error";
			}
			return new ModelAndView("display", "data", data);
		}
	}

	@RequestMapping(value = "/viewchoice", method = RequestMethod.GET)
	public ModelAndView viewflight(@ModelAttribute("command") FlightBean flightBean, BindingResult result) {
		return new ModelAndView("choViewFlight");
	}

	@RequestMapping(value = "/viewbyid", method = RequestMethod.GET)
	public ModelAndView viewbyid(@ModelAttribute("command") FlightBean flightBean, BindingResult result) {
		return new ModelAndView("choViewFlightgetID");
	}

	@RequestMapping(value = "/getdatabyid", method = RequestMethod.GET)
	public ModelAndView getdatabyid(@ModelAttribute("command") FlightBean flightBean, BindingResult result) {
		if (flightBean.getFlightID() == null || result.hasErrors()) {
			return new ModelAndView("Display", "data", "Invalid Input Given..!!");
		} else {
			FlightBean fbean = administrator.viewByFlightId(flightBean.getFlightID());
			if (fbean == null) {
				return new ModelAndView("display", "data", "No Record Found For ID : " + flightBean.getFlightID());
			} else {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("data", fbean);
				return new ModelAndView("displayone", map);
			}
		}
	}

	@RequestMapping(value = "modifyflight")
	public ModelAndView modifyScheduke(@ModelAttribute("command") FlightBean flightbean, BindingResult result) {

		String id = flightbean.getFlightID();
		FlightBean fBean = administrator.viewByFlightId(id);
		
		
		
		map1.put("data", fBean);
		return new ModelAndView("ModifyAddFlight", map1);
	}

	@RequestMapping(value = "Modifiedflight")
	public ModelAndView Modified(@Valid @ModelAttribute("command") FlightBean flightbean, BindingResult result) {
		if (result.hasErrors()) {
			return new ModelAndView("ModifyAddFlight", map1);

		}
		
		int rc=flightbean.getReservationCapacity();
		int sc=flightbean.getSeatingCapacity();
		if(rc>sc)
		{
			return new ModelAndView("ModifyAddFlight","ERROR","Reservation capacity should be less then seating capacity");
		}
		
		
		
		
		
		else {
			Boolean data = administrator.modifyFlight(flightbean);
			if (data) {
				return new ModelAndView("display", "data", "Updated Flight" + flightbean.getFlightID());
			} else {
				return new ModelAndView("display", "data", "Not Updated");
			}

		}
	}

	@RequestMapping(value = "deleteflight")
	public ModelAndView confdel(@ModelAttribute("command") FlightBean flightbean, BindingResult result) {
		try{
			
		
		int data = administrator.removeFlight(flightbean);
		if (data == 1) {
			return new ModelAndView("Displayall", "hi", "Deleted Flight id " + flightbean.getFlightID());
		} else {
			return new ModelAndView("display", "data", "Error");
		}
	}
		
	catch(Exception e)
		{
		return new ModelAndView("display", "data", "Flight can not be deleted");

		}
	
	}

	@RequestMapping(value = "/viewbyall", method = RequestMethod.GET)
	public ModelAndView viewbyall(@ModelAttribute("command") FlightBean flightBean, BindingResult result) {
		List<FlightBean> list = administrator.viewByAllFlights();
		if (list == null) {
			return new ModelAndView("Display", "data", "No Record Found..!!");
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("data", list);
			return new ModelAndView("Displayall", map);
		}
	}

	// _________________________________________________________________________________

	@RequestMapping(value = "/route", method = RequestMethod.GET)
	public ModelAndView update(@Valid @ModelAttribute("command") RouteBean routeBean, BindingResult result) {

		return new ModelAndView("AddRoute");
	}

	@RequestMapping(value = "/addroute", method = RequestMethod.GET)
	public ModelAndView add(@ModelAttribute("command") RouteBean routeBean, BindingResult result) {
		return new ModelAndView("AddRoutedata");
	}

	@RequestMapping(value = "/addroutetodb", method = RequestMethod.GET)
	public ModelAndView addtodb(@ModelAttribute("command") RouteBean routeBean, BindingResult result) {
		if (result.hasErrors()) 
		{
			return new ModelAndView("AddRoutedata");
		}
		String rs = administrator.addRoute(routeBean);
		if (rs.equalsIgnoreCase("SUCCESS")) 
		{
			
			List<RouteBean> list = administrator.viewByAllRoute();
			if (list == null) 
			{
				return new ModelAndView("Display", "data", "No Record Found..!!");
			} 
			else 
			{
				
				ModelAndView md=new ModelAndView();
				md.setViewName("displayallroute");
				md.addObject("data",list);
				md.addObject("data1","Route Created ID :" + routeBean.getRouteID());
				return md;
			}			
		}
		else 
		{
			return new ModelAndView("display", "data", "Error to Create Route");
		}	
	}

	@RequestMapping(value = "/viewroute", method = RequestMethod.GET)
	public ModelAndView option(@ModelAttribute("command") RouteBean routeBean, BindingResult result) {
		return new ModelAndView("choViewRoute");
	}

	@RequestMapping(value = "/viewroutebyid", method = RequestMethod.GET)
	public ModelAndView oneRoute(@ModelAttribute("command") RouteBean routeBean, BindingResult result) {
		return new ModelAndView("choViewRouteID");
	}

	@RequestMapping(value = "/goview", method = RequestMethod.GET)
	public ModelAndView viewroute(@ModelAttribute("command") RouteBean routeBean, BindingResult result) {
		if (routeBean.getRouteID() == null) {
			return new ModelAndView("display", "data", "Invalied Input");
		} else {
			RouteBean rbean = administrator.viewByRouteId(routeBean.getRouteID());
			if (rbean == null) {
				return new ModelAndView("display", "data", "Route ID Not Found :" + routeBean.getRouteID());
			} else {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("data", rbean);
				return new ModelAndView("displayoneroute", map);
			}
		}
	}

	@RequestMapping(value = "/modifyroute", method = RequestMethod.POST)
	public ModelAndView edit(@ModelAttribute("command") RouteBean routeBean, BindingResult result) {
		map2.put("data", administrator.viewByRouteId(routeBean.getRouteID()));
		return new ModelAndView("ModifyAddRoute", map2);
	}

	@RequestMapping(value = "/ModifiedRoute", method = RequestMethod.POST)
	public ModelAndView updateroute(@Valid @ModelAttribute("command") RouteBean routebean, BindingResult result) {
		if (result.hasErrors()) {
			return new ModelAndView("ModifyAddRoute", "map", map2);

		} else {
			boolean rs = administrator.modifyRoute(routebean);
			if (rs) {
				return new ModelAndView("display", "data", "Updated Route ID : " + routebean.getRouteID());
			} else {
				return new ModelAndView("display", "data", "Error in Updation");
			}
		}
	}

	@RequestMapping(value = "/deleteroute", method = RequestMethod.POST)
	public ModelAndView godel(@ModelAttribute("command") RouteBean routeBean, BindingResult result) {
	try{
		int del = administrator.removeRoute(routeBean);
		
		
		if (del == 1) {
			return new ModelAndView("displayallroute", "hi", "Deleted Route ID : " + routeBean.getRouteID());
		} else {
			return new ModelAndView("display", "data", "Error In Delete");
		}

	}
	catch(Exception e)
	{
		return new ModelAndView("display", "data", "Route can't be Deleted");

	}
	}

	@RequestMapping(value = "/viewall", method = RequestMethod.GET)
	public ModelAndView allRoutes(@ModelAttribute("command") RouteBean routeBean, BindingResult result) {
		List<RouteBean> list = administrator.viewByAllRoute();
		if (list == null) {
			return new ModelAndView("Display", "data", "No Record Found..!!");
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("data", list);
			System.out.println(map.size());
			return new ModelAndView("displayallroute", map);
		}
	}

	// ____________________________________________________________________________________________________

	@RequestMapping(value = "schedule")
	public ModelAndView manageSchedule(@ModelAttribute("command") ScheduleBean scheduleBean, BindingResult result) {
		return new ModelAndView("AddSchedule");
	}

	@RequestMapping(value = "addSchedule")
	public ModelAndView addSchedule(@ModelAttribute("command") ScheduleBean scheduleBean, BindingResult result) {

		List<RouteBean> listr = administrator.viewByAllRoute();
		List<FlightBean> listf = administrator.viewByAllFlights();
		List<ScheduleBean> lists = administrator.viewByAllSchedule();
		map3.put("datas", lists);
		map3.put("datar", listr);
		map3.put("dataf", listf);
		return new ModelAndView("AddScheduledata", map3);

	}

	@RequestMapping(value = "addScheduledata")
	public ModelAndView addScheduledata(@Valid @ModelAttribute("command") ScheduleBean sBean, BindingResult result) {

		if (result.hasErrors()) {
			return new ModelAndView("AddScheduledata", map3);
		} else {

			RouteBean rbBean = administrator.viewByRouteId(sBean.getRoute().getRouteID());
			if (rbBean == null) {
				return new ModelAndView("display", "data", "Route ID Invalied ");
			}
			FlightBean fbBean = administrator.viewByFlightId(sBean.getFlight().getFlightID());
			if (fbBean == null) {
				return new ModelAndView("display", "data", "Flight ID Invalied");
			}

			sBean.setRoute(rbBean);
			sBean.setFlight(fbBean);
			String data = administrator.addSchedule(sBean);
			if (data.equalsIgnoreCase("SUCCESS")) {
				data = "Created a Schedule With ID :" + sBean.getScheduleID();
			} else if (data.equalsIgnoreCase("Fail")) {
				data = "FAIL To insert ... !!!";
			}
			return new ModelAndView("display", "data", data);
		}
	}

	@RequestMapping(value = "viewSchedule")
	public ModelAndView choiceMenuSchedule(@ModelAttribute("command") ScheduleBean scheduleBean, BindingResult result) {
		return new ModelAndView("choViewSchedule");
	}

	@RequestMapping(value = "ShowbyidSchedule")
	public ModelAndView ShowbyidSchedule(@ModelAttribute("command") ScheduleBean scheduleBean, BindingResult result) {
		return new ModelAndView("choiceViewScheduleID");
	}

	@RequestMapping(value = "viewbyScheduleID")
	public ModelAndView viewScheduleID(@ModelAttribute("command") ScheduleBean scheduleBean, BindingResult result) {
		if (scheduleBean.getScheduleID() == null) {
			return new ModelAndView("display", "data", "Invalid Input ");
		} else {
			ScheduleBean sBean = administrator.viewByScheduleId(scheduleBean.getScheduleID());
			Map<String, Object> map = new HashMap<String, Object>();

			if (sBean == null) {
				return new ModelAndView("display", "data", "No Data Found For ID: " + scheduleBean.getScheduleID());
			} else {
				map.put("data", sBean);
				return new ModelAndView("displayoneSchedule", map);
			}
		}
	}

	@RequestMapping(value = "ShowAllSchedule")
	public ModelAndView ShowAllSchedule(@ModelAttribute("command") ScheduleBean scheduleBean, BindingResult result) {

		List<ScheduleBean> list = administrator.viewByAllSchedule();
		if (list == null) {
			return new ModelAndView("display", "data", "No Record Found ");
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("data", list);
			return new ModelAndView("displayallSchedule", map);
		}
	}

	@RequestMapping(value = "modifySchedule")
	public ModelAndView modifySchedule(@ModelAttribute("command") ScheduleBean scheduleBean, BindingResult result) {
		String id = scheduleBean.getScheduleID();
		ScheduleBean sBean = administrator.viewByScheduleId(id);
		map4.put("data", sBean);
		return new ModelAndView("ModifyAddSchedule", map4);
	}

	@RequestMapping(value = "ModifiedSchedule")
	public ModelAndView Modified(@Valid @ModelAttribute("command") ScheduleBean sBean, BindingResult result) {
		if (result.hasErrors()) {
			return new ModelAndView("ModifyAddSchedule", map4);
		}
		RouteBean rbBean = administrator.viewByRouteId(sBean.getRoute().getRouteID());
		if (rbBean == null) {
			return new ModelAndView("display", "data", "Route ID Invalied ");
		}
		FlightBean fbBean = administrator.viewByFlightId(sBean.getFlight().getFlightID());
		if (fbBean == null) {
			return new ModelAndView("display", "data", "Flight ID Invalied");
		}
		ScheduleBean d=(ScheduleBean) map4.get("data");
		
		
		sBean.setRoute(rbBean);
		sBean.setFlight(fbBean);
		sBean.setScheduleID(d.getScheduleID());
		System.out.println("DAYS"+sBean.getAvailableDays() +sBean.getFlight().getFlightID()+sBean.getRoute().getRouteID()+sBean.getDepartureTime()+sBean.getScheduleID());
		Boolean data = administrator.modifySchedule(sBean);
		System.out.println("BOOLEAN"+data);
		if (data) {
			return new ModelAndView("display", "data", "Updated Schedule ID :" + sBean.getScheduleID());
		} else {
			return new ModelAndView("display", "data", "Error in Updation ..!!");
		}
	}

	@RequestMapping(value = "deleteSchedule")
	public ModelAndView confdel(@ModelAttribute("command") ScheduleBean sBean, BindingResult result) {
		try{
		int data = administrator.removeSchedule(sBean);
		if (data == 1) {
			return new ModelAndView("displayallSchedule", "hi", "Deleted ID " + sBean.getScheduleID());
		} else {
			return new ModelAndView("display", "data", "Error in Delete ..!!");
		}
		}
		catch(Exception e)
		{
			return new ModelAndView("display", "data", "Error in Deleting Schedule ..!!");

		}
	}
	// _______________________________________________________________________________________________

	@RequestMapping(value = "passengergetSchdule")
	public ModelAndView viewpassenger(@ModelAttribute("command") ReservationBean reservationBean) {
		return new ModelAndView("choViewPassanger");
	}

	/*@RequestMapping(value = "viewPasengerById")
	public ModelAndView viewpassenger3(@ModelAttribute("command") ReservationBean reservationBean) {
		return new ModelAndView("choViewPassangerflight");
	}*/
	
	@RequestMapping(value = "ViewPassanger")
	public ModelAndView ViewPassanger(@ModelAttribute("command") ReservationBean reservationBean) {
		String id = reservationBean.getScheduleID();
		List ReservationData = administrator.viewPassengersByFlight(id);

		if (ReservationData.isEmpty()) {
			return new ModelAndView("display", "data", "No records found");

		} else {
			return new ModelAndView("ViewPassenger", "data", ReservationData);

		}
	}

	// ________________________________________________________________________________________

	@RequestMapping(value = "/scheduleforCustomer", method = RequestMethod.GET)
	public ModelAndView scheduleforCustomer(@Valid @ModelAttribute("command") ScheduleBean scheduleBean,
			BindingResult result) {
		return new ModelAndView("choViewSchedulecus");

	}

	@RequestMapping(value = "/ShowbyidSchedulecus", method = RequestMethod.GET)
	public ModelAndView ShowbyidSchedulecus(@Valid @ModelAttribute("command") ScheduleBean scheduleBean,
			BindingResult result) {
		return new ModelAndView("choViewscheduleIDcus");
	}

	@RequestMapping(value = "/ShowAllSchedulecus", method = RequestMethod.GET)
	public ModelAndView ShowAllSchedulecus(@Valid @ModelAttribute("command") ScheduleBean scheduleBean,
			BindingResult result) {
		List<ScheduleBean> list = administrator.viewByAllSchedule();
		if (list == null) {
			return new ModelAndView("display", "data", "No Record Found ");
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("data", list);
			return new ModelAndView("displayallSchedulecus", map);
		}
	}

	@RequestMapping(value = "/viewbyScheduleIDcus", method = RequestMethod.POST)
	public ModelAndView viewbyScheduleIDcus(@Valid @ModelAttribute("command") ScheduleBean scheduleBean,
			BindingResult result) {
		String source = scheduleBean.getRoute().getSource();
		String destination = scheduleBean.getRoute().getDestination();
		List sBean = administrator.viewByScheduleId(source, destination);
		Iterator<RouteBean> it = sBean.iterator();
		System.out.println("Size of route" + sBean.size());
		List l = new ArrayList();
		List lp = new ArrayList();
		while (it.hasNext()) {
			RouteBean reBean = (RouteBean) it.next();
			System.out.println("this is routeID " + reBean.getRouteID());
			l = administrator.showtouserfortravel();
			System.out.println("now its new type= " + l.size());
			Iterator<ScheduleBean> itt = l.iterator();
			while (itt.hasNext()) {
				ScheduleBean scheduleBean2 = (ScheduleBean) itt.next();
				System.out.println(scheduleBean2.getRoute().getRouteID() + " == " + reBean.getRouteID());
				if (scheduleBean2.getRoute().getRouteID().equalsIgnoreCase(reBean.getRouteID())) {
					System.out.println("YES");
					System.out.println(scheduleBean2.getTravelDuration());
					System.out.println(scheduleBean2.getScheduleID());
					System.out.println(scheduleBean2.getDepartureTime());
					System.out.println(scheduleBean2.getAvailableDays());
					System.out.println(scheduleBean2.getFlight().getFlightID());
					System.out.println(scheduleBean2.getRoute().getRouteID());
					scheduleBean = scheduleBean2;
					lp.add(scheduleBean2);
				}
			}
		}

		Map<String, Object> map = new HashMap();
		map.put("data", scheduleBean);
		if (!lp.isEmpty())
			return new ModelAndView("displayoneSchedulecus", map);
		else
			return new ModelAndView("display2", "data", "No Schedule Found..!!");
	}

}
