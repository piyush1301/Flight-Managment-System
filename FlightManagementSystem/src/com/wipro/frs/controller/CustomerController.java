package com.wipro.frs.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.wipro.frs.bean.CardDetailsBean;
import com.wipro.frs.bean.CredentialsBean;
import com.wipro.frs.bean.FlightBean;
import com.wipro.frs.bean.PassengerBean;
import com.wipro.frs.bean.ProfileBean;
import com.wipro.frs.bean.ReservationBean;
import com.wipro.frs.bean.RouteBean;
import com.wipro.frs.bean.ScheduleBean;
import com.wipro.frs.service.Administrator;
import com.wipro.frs.service.Customer;
import com.wipro.frs.util.User;

@Controller

public class CustomerController {
	@Autowired
	Customer customer;
	@Autowired
	Administrator admin;
	@Autowired
	User user;
	static String rId, fynalRouteId, mainsource, maindest;
	int seats2;
	HashMap hmap = new HashMap();
	HashMap<String, ReservationBean> hm = new HashMap<>();
	static double total_fare;

	@RequestMapping(value = "/registerCustomer", method = RequestMethod.GET)
	public ModelAndView fun3(@ModelAttribute("command") ProfileBean fg, BindingResult result) {

		return new ModelAndView("registerCustomer");

	}

	@RequestMapping(value = "/viewCustomer", method = RequestMethod.GET)
	public ModelAndView viewCu(@ModelAttribute("command") ProfileBean fg, BindingResult result) {
		try {
			String a = (String) MainController.hm.get("userId");
			ProfileBean bean = customer.getCustomer(a);
			System.out.println("---" + bean);
			return new ModelAndView("showCustomer", "bean", bean);
		} catch (Exception e) {
			return new ModelAndView("display2", "data", "User defined Exception");

			// TODO: handle exception
		}
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public ModelAndView update(@Valid @ModelAttribute("command") ProfileBean profileBean, BindingResult result) {

		if (result.hasErrors()) {
			return new ModelAndView("showCustomer");
		} else {
			try {
				customer.registerCustomer(profileBean);
				return new ModelAndView("customer");
			} catch (Exception e) {
				return new ModelAndView("display2", "data", "User defined Exception");

				// TODO: handle exception
			}
		}
	}

	@RequestMapping(value = "/reg", method = RequestMethod.POST)
	public ModelAndView save(@Valid @ModelAttribute("command") ProfileBean profileBean, BindingResult result) {

		if (result.hasErrors()) {

			return new ModelAndView("registerCustomer");
		} else {
			try {
				System.out.println("Bean" + profileBean);
				customer.registerCustomer(profileBean);
				return new ModelAndView("show","retVal","You have been registered successfully,User Id="+profileBean.getUserID());
			}
				catch (Exception e) {
				return new ModelAndView("display2", "data", "Can not add a user");

			}
		}
	}

	@RequestMapping(value = "/changepass2", method = RequestMethod.GET)
	public ModelAndView npass(@ModelAttribute("command") ProfileBean fg) {

		return new ModelAndView("newpass", "password", MainController.hm.get("pword"));

	}

	@RequestMapping(value = "/newpassword", method = RequestMethod.POST)
	public ModelAndView newpass(@Valid@ModelAttribute("command") CredentialsBean credentialsBean, BindingResult result,
			@RequestParam("password") String pass, HttpSession session) {
			if(result.hasErrors())
			{
					return new ModelAndView("newpass");
			}
			else
			{	try {
			String uid = (String) session.getAttribute("login");
			boolean ver = customer.changePass(uid, pass);
			if (ver) {
				session.removeAttribute("login");
				session.invalidate();

				user.changeStatus(uid);

				return new ModelAndView("show", "data", "Password changed successfully,Login with new password");
			}

			else
				return new ModelAndView("newpass", "data", "Password not changed,TRY AGAIN!");
		} catch (Exception e) {
			return new ModelAndView("display2", "data", "User defined Exception");

			// TODO: handle exception
		}		}
	}

	@RequestMapping(value = "/reservation", method = RequestMethod.GET)
	public ModelAndView bookTicket(@ModelAttribute("command") ScheduleBean fg, BindingResult result) {

		return new ModelAndView("halfres1");

	}

	@RequestMapping(value = "/viewSchedules", method = RequestMethod.GET)
	public ModelAndView bookTicke2t(@ModelAttribute("command") ScheduleBean scheduleBean, BindingResult result) {
		ScheduleBean bean = new ScheduleBean();

		String source = scheduleBean.getRoute().getSource();
		String destination = scheduleBean.getRoute().getDestination();
		System.out.println("src" + source + "dest" + destination);
		List sBean = admin.viewByRealScheduleId(source, destination);
		if (sBean == null) {
			return new ModelAndView("display", "data", "No Record Found ");
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("data", sBean);
			mainsource = source;
			
			maindest = destination;

			return new ModelAndView("halfres2", map);
		}

	}

	@RequestMapping(value = "/hreservation", method = RequestMethod.GET)
	public ModelAndView bookTicket1(@ModelAttribute("command") ReservationBean fg, BindingResult result,
			HttpSession session) {

		String a = (String) MainController.hm.get("userId");
		ModelAndView modal = new ModelAndView();
		modal.addObject("uId", session.getAttribute("login"));
		modal.addObject("source", mainsource);
		modal.addObject("destination", maindest);
		System.out.println("UID" + a);
		modal.setViewName("halfReservation");

		return modal;

	}

	@RequestMapping(value = "/forgot", method = RequestMethod.GET)
	public ModelAndView fpass(@ModelAttribute("command") ProfileBean fg, BindingResult result) {

		System.out.println(fg);
		return new ModelAndView("checkdetails");

	}

	@RequestMapping(value = "/changepassword", method = RequestMethod.POST)
	public ModelAndView chpass(@Valid@ModelAttribute("command") ProfileBean fg, BindingResult result) {
		System.out.println(fg.getUserID());
		System.out.println(fg.getEmailID());
		System.out.println(fg.getDateOfBirth());
		
		
			try {
			String ver = customer.verifyUser(fg);
			if (ver.equalsIgnoreCase("verified"))
				return new ModelAndView("change");
			if (ver.equalsIgnoreCase("Invalid Details")) {
				return new ModelAndView("checkdetails", "data", "Enter correct details");
			}
			if (ver.equalsIgnoreCase("Invalid User")) {

				return new ModelAndView("checkdetails", "data", "User Id not valid");
			} else
				return new ModelAndView("checkdetails", "data", "Not Verified");
		} catch (Exception e) {
			return new ModelAndView("display2", "data", "User defined Exception");

			// TODO: handle exception
		}
	}

	@RequestMapping(value = "/passchanged", method = RequestMethod.POST)
	public ModelAndView password(@ModelAttribute("command") ProfileBean fg, BindingResult result) {
		System.out.println(fg.getPassword());
		try {
			boolean ver = customer.changePass(fg.getUserID(), fg.getPassword());
			if (ver)
				return new ModelAndView("show", "data", "Password changed successfully,LOGIN");
			else
				return new ModelAndView("show", "data", "Password not changed,TRY AGAIN!");
		} catch (Exception e) {
			return new ModelAndView("display2", "data", "User defined Exception");

			// TODO: handle exception
		}
	}

	@RequestMapping(value = "/reservationtype", method = RequestMethod.POST)
	public ModelAndView bookTicketReservationType(@Valid @ModelAttribute("command") ReservationBean fg,
			BindingResult result,HttpSession session) {
		try {
			String uId=(String) session.getAttribute("login");
			fg.setUserID(uId);
			fg.setSource(mainsource);
			fg.setDestination(maindest);
			
			fg.setReservationID(customer.getReservatonId(fg.getSource(), fg.getDestination()));
			String fID = null;
			int rCapacity = 0;
			String dest = fg.getDestination();
			String source = fg.getSource();
			
			ArrayList<RouteBean> list = (ArrayList<RouteBean>) customer.getFare();
			RouteBean routeBean = new RouteBean();
			Iterator it = list.iterator();
			while (it.hasNext()) {
				RouteBean bean = (RouteBean) it.next();
				if (bean.getSource().equalsIgnoreCase(source) && bean.getDestination().equalsIgnoreCase(dest)) {
					routeBean = bean;
				}
			}
			
			int distance = routeBean.getDistance();
			double fare = routeBean.getFare();
		System.out.println("Distance"+distance+"fare"+fare);
			int seats = fg.getNoOfSeats();
			String routeId = routeBean.getRouteID();

			ArrayList l = (ArrayList) customer.getDuration();
			System.out.println("Araylist" + l);
			
			String sId = null;
			int duration = 0;
			Iterator it1 = l.iterator();
			while (it1.hasNext()) {
				ScheduleBean bean1 = (ScheduleBean) it1.next();
				System.out.println("RouteId" + bean1.getRoute().getRouteID() + routeId);

				if (bean1.getRoute().getRouteID().trim().equalsIgnoreCase(routeId)) {
					System.out.println("Matching");
					duration = bean1.getTravelDuration();
					sId = bean1.getScheduleID();
				}
			}

			System.out.println("Duration" + duration);
			total_fare = ((distance * fare) + (fare * duration)) * seats;
			System.out.println("Fare" + total_fare);
			/*
			 * Map map=new HashMap(); map.put("fare",total_fare);
			 */
			fg.setTotalFare(total_fare);
			System.out.println("SID____________" + sId);
			fg.setScheduleID(sId);
			hm.put("ReservationBean", fg);

			ArrayList<ScheduleBean> slist = admin.viewByAllSchedule();
			Iterator itflight = slist.iterator();
			while (itflight.hasNext()) {
				ScheduleBean bean1 = (ScheduleBean) itflight.next();

				if (bean1.getScheduleID().trim().equalsIgnoreCase(sId)) {
					System.out.println("Matching");
					fID = bean1.getFlight().getFlightID();
				}
			}

			ArrayList<FlightBean> flightarray = admin.viewByAllFlights();

			Iterator itfl = flightarray.iterator();
			while (itfl.hasNext()) {
				FlightBean bean1 = (FlightBean) itfl.next();

				if (bean1.getFlightID().trim().equalsIgnoreCase(fID)) {
					System.out.println("Matching");
					rCapacity = bean1.getSeatingCapacity();
				}
			}
			System.out.println("Capacity" + rCapacity);

			if (rCapacity < fg.getNoOfSeats())
				return new ModelAndView("display2", "data", "Sorry"+fg.getNoOfSeats() +" Seats Not Avalible.No of available seats are"+rCapacity);
			else {
				fynalRouteId = fID;
				seats2 = rCapacity;
				return new ModelAndView("halfReservation", "fare", total_fare);
			}

		} catch (Exception e) {
			return new ModelAndView("display2", "data", "User defined Exception");

			// TODO: handle exception
		}
	}/*
		 * }
		 */

	@RequestMapping(value = "/paymentDetails", method = RequestMethod.POST)
	public ModelAndView paymentDetails(@ModelAttribute("command") CardDetailsBean pageBean, BindingResult result) {
		try {
			return new ModelAndView("payment");
		} catch (Exception e) {
			return new ModelAndView("display2", "data", "User defined Exception");

			// TODO: handle exception
		}
	}

	@RequestMapping(value = "/manageReservation", method = RequestMethod.GET)
	public ModelAndView ppp(@ModelAttribute("command") ReservationBean pageBean, BindingResult result,HttpSession session) {
try {
			String source = null, dest = null;
			String uId = (String) session.getAttribute("login");
System.out.println("UID###########"+uId);
			ReservationBean rbean = new ReservationBean();
			PassengerBean pbBean = new PassengerBean();
			ArrayList l = (ArrayList) customer.getReservation();
			System.out.println("Araylist" + l);
			String sId = null;
			int duration = 0;
			Iterator it1 = l.iterator();
			List<ReservationBean> list1 = new ArrayList<>();
			int flag = 0;
			while (it1.hasNext()) {
				ReservationBean bean1 = (ReservationBean) it1.next();
				System.out.println("Bean" + bean1.getUserID());
				flag = 1;
				System.out.println("FLAG 9999999999999999999999");
if (bean1.getUserID().trim().equalsIgnoreCase(uId)) {
					System.out.println("Matching");
					rId = bean1.getReservationID();
					source = bean1.getSource();
					dest = bean1.getDestination();
					PassengerBean pb = customer.getPassengerBean(bean1.getReservationID());
					System.out.println(pb.getName());
					System.out.println(bean1.getReservationID());
					pbBean = pb;
					list1.add(bean1);
				System.out.println("PAurush");
				}

				else
					rbean = null;

			}
System.out.println("FLAG"+flag);
			if (flag == 1) {

				ModelAndView modal = new ModelAndView();
				modal.setViewName("reservationDetails");
				modal.addObject("beanw", list1);
				modal.addObject("emp", pbBean);
System.out.println("SOURCE"+source);
				hmap.put("name", pbBean.getName());
				hmap.put("gender", pbBean.getGender());
				hmap.put("age", pbBean.getAge());
				hmap.put("rID", pbBean.getReservationID());
				hmap.put("source", source);
				hmap.put("dest", dest);

				return modal;

			}

			else

				return new ModelAndView("display2", "data", "No Data Found");
		} catch (Exception e) {
			return new ModelAndView("display2", "data", "User defined Exception");

			// TODO: handle exception
		}
	}

	@RequestMapping(value = "/cancelBooking", method = RequestMethod.GET)
	public ModelAndView canceltDetails(@ModelAttribute("command") ReservationBean pageBean, BindingResult result) {
		try {
			System.out.println("Reservation " + rId);
			ReservationBean rbean = customer.getRBean(rId);
			Date jDate = rbean.getJourneyDate();
			// SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
			Date todayDate = new Date();
			int x = jDate.compareTo(todayDate);
			if (x == 1) {
				System.out.println("ReservationDate " + pageBean.getJourneyDate());

				customer.cancelTicket(rId);

				return new ModelAndView("display2", "data", "Your ticket has been cancelled");
			}

			else

				return new ModelAndView("display2", "data",
						"The jorney date has been exceedeed ..No use to cancel the ticket.......");
		} catch (Exception e) {
			return new ModelAndView("display2", "data", "User defined Exception");

			// TODO: handle exception
		}
	}

	@RequestMapping(value = "/printit", method = RequestMethod.GET)
	public ModelAndView fun3589585893(@ModelAttribute("command") ReservationBean rBean, BindingResult result) {
		try {

			ModelAndView mv = new ModelAndView();
			mv.addObject("name", hmap.get("name"));
			mv.addObject("gender", hmap.get("gender"));
			mv.addObject("age", hmap.get("age"));
			mv.addObject("ReservationId", hmap.get("rID"));
			mv.addObject("source", hmap.get("source"));
			mv.addObject("Destination", hmap.get("dest"));
			mv.setViewName("print");

			return mv;
		} catch (Exception e) {
			return new ModelAndView("display2", "data", "User defined Exception");

			// TODO: handle exception
		}
	}

	@RequestMapping(value = "/confirmPayment", method = RequestMethod.POST)
	public ModelAndView cpaymentDetails(@ModelAttribute("command") CardDetailsBean pageBean, BindingResult result,
			HttpSession session) {
		try {
			CardDetailsBean card = new CardDetailsBean();
			String user_id = (String) session.getAttribute("login");

			ArrayList l = (ArrayList) customer.checkPayment();

			String returnVal = null;
			int duration = 0;
			Iterator it1 = l.iterator();
			while (it1.hasNext()) {
				CardDetailsBean bean1 = (CardDetailsBean) it1.next();

				if (bean1.getCreditcardNumber().equals(pageBean.getCreditcardNumber())
						&& bean1.getValidFrom().equals(pageBean.getValidFrom())
						&& bean1.getValidTo().equals(pageBean.getValidTo())) {
					System.out.println("Matching");

					if (bean1.getCreditBalance() < total_fare) {
						returnVal = "Not enough balance";
					} else {
						Integer balance=(int) (bean1.getCreditBalance() - total_fare);
						System.out.println(balance);
						customer.updatecreditCard(balance, user_id);
						System.out.println("Piyush");

						returnVal = "Ticket Booked Succesfully";
					}

				} else {

					returnVal = "Invalid Payment Details";
				}
			}

			if (returnVal.equals("Invalid Payment Details"))
				return new ModelAndView("payment", "retVal", "Invalid Payment Details");
			else if (returnVal.equals("Not enough balance"))
				return new ModelAndView("payment", "retVal", "Not enough balance");

			else {
				ReservationBean rb = hm.get("ReservationBean");
				rb.setBookingStatus(1);
				customer.bookTicket(rb);
				Random r = new Random();

				int i = r.nextInt(78);
				ProfileBean profileBean = customer.getXYZ(user_id);
				PassengerBean passengerBean = new PassengerBean();
				passengerBean.setName(profileBean.getFirstName() + " " + profileBean.getLastName());
				passengerBean.setGender(profileBean.getGender());
				passengerBean.setReservationID(rb.getReservationID());
				passengerBean.setSeatNo(i);
				int seats = rb.getNoOfSeats();

				admin.updateSeatstatus((seats2 - seats), fynalRouteId);

				int y = new Date().getYear() - profileBean.getDateOfBirth().getYear();
				passengerBean.setAge(y);

				customer.addPassenger(passengerBean);
				System.out.println("DONE**********************");

				return new ModelAndView("customer", "data", "Your ticket has been booked");

			}
		} catch (Exception e) {
			return new ModelAndView("display2", "data", "User defined Exception");

			// TODO: handle exception
		}
	}

}
