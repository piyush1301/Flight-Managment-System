package com.wipro.frs.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.wipro.frs.bean.CardDetailsBean;
import com.wipro.frs.bean.CredentialsBean;
import com.wipro.frs.bean.PassengerBean;
import com.wipro.frs.bean.ProfileBean;
import com.wipro.frs.bean.ReservationBean;
import com.wipro.frs.bean.ScheduleBean;

public interface Customer {
	ProfileBean getXYZ(String uID) ;

	ArrayList<ScheduleBean> viewScheduleByRoute(String source, String destination, Date date);

	String reserveTicket(ReservationBean reservationBean, ArrayList<PassengerBean> passengers);

	boolean cancelTicket(String reservationId);

	Map<ReservationBean, PassengerBean> viewTicket(String reservationId);

	Map<ReservationBean, PassengerBean> printTicket(String reservationId);

	public List getFare();

	public String registerCustomer(ProfileBean profileBean);

	public ProfileBean getCustomer(String uId);

	public List getDuration();

	public List checkPayment();
	
	public List getReservation();
	
	public String getReservatonId(String source, String destination);
    String bookTicket(ReservationBean bean);
    void addPassenger(PassengerBean bean);
    PassengerBean getPassengerBean(String rID);
    
	
	public String verifyUser(ProfileBean profileBean) ;
	

	public boolean changePass(String userID, String password) ;
		
		public ReservationBean getRBean(String rID);
		boolean updatecreditCard(Integer c,String UID);

	
	
}
