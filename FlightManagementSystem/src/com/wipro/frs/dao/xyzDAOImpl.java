package com.wipro.frs.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.wipro.frs.bean.CardDetailsBean;
import com.wipro.frs.bean.CredentialsBean;
import com.wipro.frs.bean.PassengerBean;
import com.wipro.frs.bean.ProfileBean;
import com.wipro.frs.bean.ReservationBean;
import com.wipro.frs.bean.RouteBean;
import com.wipro.frs.bean.ScheduleBean;

@Repository("xyzDAO")
public class xyzDAOImpl implements xyzDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)

	public String createXYZ(ProfileBean profileBean) {

		String id = getComputedId(profileBean.getFirstName(), "FRS_SEQ_USER_ID");

		profileBean.setUserID(id);
		try {
			sessionFactory.getCurrentSession().save(profileBean);
			addtoCredential(profileBean.getUserID(), profileBean.getPassword());
			return "Added";
		} catch (Exception e) {
			return "Not Added";
		}

	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public String verifyUser(ProfileBean profileBean) {
		// String sql="select * from frs_tbl_user_profile where
		// userID='"+profileBean.getUserID()+"'";
		System.out.println(profileBean.getUserID());

		System.out.println(profileBean.getMobileNo());

		ProfileBean pbean = (ProfileBean) sessionFactory.getCurrentSession().get(ProfileBean.class,
				profileBean.getUserID());

		if (pbean == null) {
			return "Invalid user";
		}
		if (pbean.getMobileNo().equals(profileBean.getMobileNo())
				&& pbean.getEmailID().equalsIgnoreCase(profileBean.getEmailID())) {
			return "verified";
		} else {
			System.out.println("in else");
			return "Incorrect Details";
		}

	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public boolean changePass(String userID, String password) {
		String sql = "update frs_tbl_user_profile set password= '" + password + "' where userID= '" + userID + "'";
		String sql2 = "update frs_tbl_user_credentials set password= '" + password + "' where userID= '" + userID + "'";
		try {
			sessionFactory.getCurrentSession().createSQLQuery(sql).executeUpdate();
			int res = sessionFactory.getCurrentSession().createSQLQuery(sql2).executeUpdate();
			if (res == 1) {
				System.out.println("updated");
				return true;
			} else
				return false;
		} catch (Exception e) {
			System.out.println("in catch");
			return false;
		}
	}

	public String addtoCredential(String uId, String password) {

		CredentialsBean cb = new CredentialsBean();
		cb.setLoginStatus(0);
		cb.setUserID(uId);
		cb.setPassword(password);
		cb.setUserType("C");
		sessionFactory.getCurrentSession().save(cb);

		return "SUCCESS";

	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)

	public String getComputedId(String name, String seqName) {

		String s = name.substring(0, 2).toUpperCase();
		String seq = sessionFactory.getCurrentSession().createSQLQuery("select " + seqName + ".nextval from dual")
				.uniqueResult().toString();
		System.out.println(s + seq);
		return s + "" + seq;

	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public ProfileBean getXYZ(String uID) {
		System.out.println("-------" + uID);
		ProfileBean bean = (ProfileBean) sessionFactory.getCurrentSession().get(ProfileBean.class, uID);
		System.out.println(bean);
		return bean;
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)

	public String getReservationId(String source, String dest) {
		String a = source.substring(0, 2).toUpperCase() + dest.substring(0, 2).toUpperCase();
		String seq = sessionFactory.getCurrentSession()
				.createSQLQuery("select FRS_SEQ_RESERVATION_ID.nextval from dual").uniqueResult().toString();
		System.out.println(a + seq);

		return a + seq;
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)

	public List getFare() {

		ArrayList<RouteBean> list = (ArrayList<RouteBean>) sessionFactory.getCurrentSession()
				.createCriteria(RouteBean.class).list();
		return list;

	}

	@Override
	public List getDuration() {
		ArrayList<ScheduleBean> list = (ArrayList<ScheduleBean>) sessionFactory.getCurrentSession()
				.createCriteria(ScheduleBean.class).list();

		return list;
	}

	@Override
	public List checkPayment() {
		ArrayList<CredentialsBean> list = (ArrayList<CredentialsBean>) sessionFactory.getCurrentSession()
				.createCriteria(CardDetailsBean.class).list();
		return list;
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)

	public String bookTicket(ReservationBean bean) {
		try {
			sessionFactory.getCurrentSession().save(bean);
			return "Added";
		}

		catch (Exception e) {
			return "Not booked";
		}

	}

	@Override
	public List getReservation() {
		ArrayList<ReservationBean> list = (ArrayList<ReservationBean>) sessionFactory.getCurrentSession()
				.createCriteria(ReservationBean.class).list();
		return list;
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public void addPassenger(PassengerBean bean) {
		sessionFactory.getCurrentSession().save(bean);

	}

	@Override
	public PassengerBean getPassengerBean(String rID) {
		PassengerBean bean = (PassengerBean) sessionFactory.getCurrentSession().get(PassengerBean.class, rID);
		return bean;
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)

	public boolean cancelTicket(String reId) {
		String qry = "delete from FRS_TBL_RESERVATION where reservationID='" + reId + "'";
		sessionFactory.getCurrentSession().createSQLQuery(qry).executeUpdate();
		return true;
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)

	public ReservationBean getRBean(String rId) {

		ReservationBean rb = (ReservationBean) sessionFactory.getCurrentSession().get(ReservationBean.class, rId);
		return rb;
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)

	public boolean updatecreditCard(Integer c, String UID) {
		String qry="update FRS_TBL_CREDITCARD set CREDITBALANCE="+c+ " where USERID='"+UID+"'";
		System.out.println(qry);
		sessionFactory.getCurrentSession().createSQLQuery(qry).executeUpdate();
		System.out.println("666666666666");
		return true;
	}

}
