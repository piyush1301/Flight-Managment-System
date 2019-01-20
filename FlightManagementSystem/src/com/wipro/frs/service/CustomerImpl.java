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
import com.wipro.frs.dao.xyzDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service("customer")
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class CustomerImpl implements Customer {

	@Autowired
	xyzDAO xyzDao;

	@Override
	public ArrayList<ScheduleBean> viewScheduleByRoute(String source, String destination, Date date) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String reserveTicket(ReservationBean reservationBean, ArrayList<PassengerBean> passengers) {
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)

	public boolean cancelTicket(String reservationId) {
return xyzDao.cancelTicket(reservationId);	

	}

	@Override
	public Map<ReservationBean, PassengerBean> viewTicket(String reservationId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<ReservationBean, PassengerBean> printTicket(String reservationId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)

	public String registerCustomer(ProfileBean profileBean) {

		xyzDao.createXYZ(profileBean);
		return null;
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public String verifyUser(ProfileBean profileBean) {
		
		return xyzDao.verifyUser(profileBean);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public boolean changePass(String userID, String password) {
		
		return xyzDao.changePass(userID, password);
	}

	
	
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public ProfileBean getCustomer(String uId) {
		System.out.println("dfgdfg" + uId);
		ProfileBean bean = xyzDao.getXYZ(uId);
		return bean;
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public String getReservatonId(String source, String destination) {
		return xyzDao.getReservationId(source, destination);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)

	public List getFare() {
	return xyzDao.getFare();
	}

	@Override
	public List getDuration() {
		// TODO Auto-generated method stub
		return xyzDao.getDuration();
	}

	@Override
	public List checkPayment() {
		
		return xyzDao.checkPayment();
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public String bookTicket(ReservationBean bean) {
		if(xyzDao.bookTicket(bean).equals("Added"))
		return "SUCCESS";
		else
			return "FAILURE";
	
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)

	public List getReservation() {
	
		return xyzDao.getReservation();
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)

	public ProfileBean getXYZ(String uID) {
		return xyzDao.getXYZ(uID);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)

	public void addPassenger(PassengerBean bean) {
xyzDao.addPassenger(bean);		
	}

	@Override
	public PassengerBean getPassengerBean(String rID) {
		return xyzDao.getPassengerBean(rID);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)

	public ReservationBean getRBean(String rID) {
		
		return 	xyzDao.getRBean(rID);
	}

	public boolean updatecreditCard(Integer c, String UID) {
		xyzDao.updatecreditCard(c,UID);
		return true;
	}

}
