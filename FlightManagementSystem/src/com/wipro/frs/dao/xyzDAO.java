package com.wipro.frs.dao;

import java.util.List;

import com.wipro.frs.bean.CardDetailsBean;
import com.wipro.frs.bean.CredentialsBean;
import com.wipro.frs.bean.PassengerBean;
import com.wipro.frs.bean.ProfileBean;
import com.wipro.frs.bean.ReservationBean;

public interface xyzDAO {
	String createXYZ(ProfileBean profileBean);

	ProfileBean getXYZ(String uID);

	String getReservationId(String source, String dest);

	public List getFare();

	List getDuration();

	List checkPayment();

	String bookTicket(ReservationBean bean);

	List getReservation();

	void addPassenger(PassengerBean bean);

	PassengerBean getPassengerBean(String rID);

	ReservationBean getRBean(String rId);

	boolean cancelTicket(String reId);

	public boolean changePass(String userID, String password);

	public String verifyUser(ProfileBean profileBean);
	boolean updatecreditCard(Integer c,String UID);

}
